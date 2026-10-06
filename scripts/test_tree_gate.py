"""Gate regression tests with synthetic evidence; these do not certify mathematics.

All files live in a temporary directory. Git subprocesses are mocked, so no test
accesses a remote, changes a repository, or claims fresh GitHub verification.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import subprocess
import tempfile
import unittest
from unittest.mock import patch

SPEC=importlib.util.spec_from_file_location('tree_gate',Path(__file__).with_name('tree_gate.py'))
gate=importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(gate)


class TreeGateTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='tree-gate-test-')
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)
        self.root_patch=patch.object(gate,'ROOT',self.root)
        self.root_patch.start()
        self.addCleanup(self.root_patch.stop)
        self.nodes={}
        self.blobs={}
        self.contained=set()
        self.queries=[]
        self.origin='https://github.com/SongXin2357/xiong-fns-general-vacuum.git'
        self.git_patch=patch.object(gate.subprocess,'run',side_effect=self.git_run)
        self.git_patch.start()
        self.addCleanup(self.git_patch.stop)

    def git_run(self,args,**kwargs):
        self.queries.append(args[3:])
        command=args[3:]
        if command==['remote','get-url','origin']:
            return subprocess.CompletedProcess(args,0,self.origin+'\n','')
        if command[0]=='for-each-ref':
            commit=command[command.index('--contains')+1]
            output='refs/remotes/origin/codex/test\n' if commit in self.contained else ''
            return subprocess.CompletedProcess(args,0,output,'')
        if command[0]=='show':
            data=self.blobs.get(command[1])
            return subprocess.CompletedProcess(args,0 if data is not None else 128,data or b'',b'')
        raise AssertionError('Unexpected Git command: '+repr(args))

    def write(self,rel,data):
        path=self.root/rel
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(data)
        return {'path':rel,'sha256':hashlib.sha256(data).hexdigest()}

    def add_node(self,nid,parent='ROOT',dependencies=()):
        module='Fixture.'+nid
        theorem=module+'.result'
        contents={
            'statement':b'Synthetic gate-test statement only.\n',
            'lean_source':b'theorem result -- synthetic fixture, never compiled\n',
            'lean_root':('import '+module+'\n').encode(),
            'build_log':b'Synthetic exit-0 fixture, not actual Lean evidence.\n',
            'type_axiom_log':(theorem+' [propext, Classical.choice, Quot.sound]\n').encode(),
            'semantic_review':b'Synthetic review fixture.\n',
            'independent_review':b'Synthetic independent fixture.\n',
            'derivation':b'Synthetic derivation fixture.\n',
            'extra_evidence':b'Every bound role must be checked remotely.\n',
        }
        files={role:self.write('evidence/'+nid+'/'+role+'.txt',data) for role,data in contents.items()}
        node={'id':nid,'parent':parent,'dependencies':list(dependencies),'lean_status':'lean-verified','gate':'passed',
              'statement':files['statement']['path'],'certificate':'evidence/'+nid+'/certificate.json',
              'github_commit':hashlib.sha1(nid.encode()).hexdigest()}
        deps=gate.dependency_ids(node)
        certificate={'node_id':nid,'kernel_build_exit_code':0,'type_axiom_exit_code':0,
                     'semantic_review_passed':True,'independent_review_passed':True,
                     'unproved_analytic_dependencies':[],'sorry_ax':False,
                     'axioms':['propext','Classical.choice','Quot.sound'],
                     'lean_module':module,'theorem_name':theorem,'files':files,
                     'dependency_certificates':{dep:gate.sha(self.root/self.nodes[dep]['certificate']) for dep in deps}}
        self.write(node['certificate'],json.dumps(certificate,sort_keys=True).encode())
        self.nodes[nid]=node
        commit=node['github_commit']
        self.contained.add(commit)
        for rel in [node['certificate']]+[item['path'] for item in files.values()]:
            self.blobs[commit+':'+rel]=(self.root/rel).read_bytes()
        return node

    def graph(self):
        self.add_node('P')
        self.add_node('S')
        self.add_node('D',dependencies=['S'])
        return self.add_node('N',parent='P',dependencies=['D'])

    def test_valid_remote_bundle_checks_full_dependency_closure(self):
        node=self.graph()
        gate.published(node,self.nodes)
        shown={command[1] for command in self.queries if command[0]=='show'}
        self.assertEqual(shown,set(self.blobs))

    def test_unpublished_parent_explicit_and_transitive_dependency_rejected(self):
        node=self.graph()
        for dep in ('P','D','S'):
            with self.subTest(dependency=dep):
                commit=self.nodes[dep]['github_commit']
                self.nodes[dep]['github_commit']=None
                with self.assertRaisesRegex(ValueError,dep+' is locally verified but not yet recorded'):
                    gate.published(node,self.nodes)
                self.nodes[dep]['github_commit']=commit

    def test_missing_or_changed_remote_bound_file_rejected(self):
        node=self.add_node('N')
        cert=gate.verify(node,self.nodes)
        for role in ('lean_source','type_axiom_log','extra_evidence'):
            key=node['github_commit']+':'+cert['files'][role]['path']
            original=self.blobs[key]
            for mode in ('missing','changed'):
                with self.subTest(role=role,mode=mode):
                    if mode=='missing': self.blobs.pop(key)
                    else: self.blobs[key]=original+b'changed'
                    with self.assertRaisesRegex(ValueError,'missing or stale: '+role):
                        gate.published(node,self.nodes)
                    self.blobs[key]=original

    def test_remote_certificate_or_unfetched_commit_rejected(self):
        node=self.add_node('N')
        key=node['github_commit']+':'+node['certificate']
        original=self.blobs[key]
        self.blobs[key]=original+b' '
        with self.assertRaisesRegex(ValueError,'certificate differs'):
            gate.published(node,self.nodes)
        self.blobs[key]=original
        self.contained.clear()
        with self.assertRaisesRegex(ValueError,'not in a fetched origin branch'):
            gate.published(node,self.nodes)

    def test_registry_dependency_removal_cannot_drop_certificate_pin(self):
        node=self.graph()
        node['dependencies']=[]
        with self.assertRaisesRegex(ValueError,'dependency set differs'):
            gate.verify(node,self.nodes)
        node['dependencies']=['D']
        node['parent']='ROOT'
        with self.assertRaisesRegex(ValueError,'dependency set differs'):
            gate.verify(node,self.nodes)

    def test_changed_dependency_certificate_is_stale(self):
        node=self.graph()
        path=self.root/self.nodes['D']['certificate']
        path.write_bytes(path.read_bytes()+b'\n')
        with self.assertRaisesRegex(ValueError,'stale dependency certificate: D'):
            gate.verify(node,self.nodes)

    def test_registry_statement_cannot_be_retargeted(self):
        node=self.add_node('N')
        node['statement']='different-claim.md'
        with self.assertRaisesRegex(ValueError,'registry statement differs'):
            gate.verify(node,self.nodes)

    def test_origin_is_pinned_to_authorized_repository(self):
        node=self.add_node('N')
        for url in ('https://github.com/SongXin2357/xiong-fns-general-vacuum',
                    'git@github.com:SongXin2357/xiong-fns-general-vacuum.git',
                    'ssh://git@github.com:22/SongXin2357/xiong-fns-general-vacuum.git'):
            with self.subTest(accepted=url):
                self.origin=url
                gate.published(node,self.nodes)
        for url in ('https://github.com/Other/repo.git','https://github.com.evil.test/SongXin2357/xiong-fns-general-vacuum.git',
                    'C:/local/repository.git'):
            with self.subTest(rejected=url):
                self.origin=url
                with self.assertRaisesRegex(ValueError,'not the authorized GitHub repository'):
                    gate.published(node,self.nodes)

    def test_audit_requires_explicit_dependency_publication_for_pending_node(self):
        dependency=self.add_node('D')
        dependency['github_commit']=None
        pending={'id':'N','parent':'ROOT','dependencies':['D'],'lean_status':'not-run','gate':'open'}
        registry={'nodes':[dependency,pending],'github_status':'test-fixture'}
        with patch.object(gate,'tree',return_value=registry),patch.object(gate.sys,'argv',['tree_gate.py','audit']):
            with self.assertRaisesRegex(ValueError,'D is locally verified but not yet recorded'):
                gate.main()


if __name__=='__main__':
    unittest.main(verbosity=2)

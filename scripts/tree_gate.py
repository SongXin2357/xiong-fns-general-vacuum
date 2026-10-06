"""Fail-closed research-tree evidence checks. This is not a mathematical prover.

Publication checks use fetched Git objects, not a live GitHub query. The operator
must separately record an actual fetch/readback receipt before branch extension.
"""
from pathlib import Path
import argparse, hashlib, json, re, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
EXPECTED_REPOSITORY='SongXin2357/xiong-fns-general-vacuum'

def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()

def safe(rel):
    p=(ROOT/rel).resolve()
    if not p.is_relative_to(ROOT.resolve()) or not p.is_file():
        raise ValueError('Missing/nonlocal evidence: '+rel)
    return p

def tree(): return json.loads((ROOT/'notes/tree.json').read_text(encoding='utf-8'))

def dependency_ids(node):
    deps=list(node.get('dependencies',[]))
    if node.get('parent')!='ROOT': deps.append(node['parent'])
    return list(dict.fromkeys(deps))

def verify(node, nodes, stack=()):
    nid=node['id']
    if nid in stack: raise ValueError('Dependency cycle: '+nid)
    if node.get('lean_status')!='lean-verified' or node.get('gate')!='passed':
        raise ValueError(nid+' has not passed its exact Lean/semantic gate')
    cert=json.loads(safe(node['certificate']).read_text(encoding='utf-8'))
    if cert.get('node_id')!=nid or cert.get('kernel_build_exit_code')!=0 or cert.get('type_axiom_exit_code')!=0:
        raise ValueError(nid+' lacks a successful build and type/axiom run')
    if not cert.get('semantic_review_passed') or not cert.get('independent_review_passed'):
        raise ValueError(nid+' lacks exact-scope independent and semantic reviews')
    if cert.get('unproved_analytic_dependencies') or cert.get('sorry_ax'):
        raise ValueError(nid+' still has an unproved dependency')
    allowed={'propext','Classical.choice','Quot.sound'}
    if not set(cert.get('axioms',[]))<=allowed:
        raise ValueError(nid+' contains undisclosed/nonstandard axioms')
    required={'statement','lean_source','lean_root','build_log','type_axiom_log','semantic_review','independent_review','derivation'}
    files=cert.get('files',{})
    if not required<=set(files): raise ValueError(nid+' has incomplete evidence roles')
    if node.get('statement')!=files['statement']['path']:
        raise ValueError(nid+' registry statement differs from certified statement')
    for role, item in files.items():
        if sha(safe(item['path']))!=item['sha256']:
            raise ValueError(nid+' has stale evidence: '+role)
    src=safe(files['lean_source']['path']).read_text(encoding='utf-8')
    root=safe(files['lean_root']['path']).read_text(encoding='utf-8')
    if cert['lean_module'] not in root or cert['theorem_name'].split('.')[-1] not in src:
        raise ValueError(nid+' module/theorem is missing from recorded build')
    log=safe(files['type_axiom_log']['path']).read_text(encoding='utf-8')
    if cert['theorem_name'] not in log or 'sorryAx' in log:
        raise ValueError(nid+' type/axiom evidence does not cover target')
    deps=dependency_ids(node)
    pins=cert.get('dependency_certificates',{})
    if set(pins)!=set(deps):
        raise ValueError(nid+' dependency set differs from certificate pins')
    for dep in deps:
        if dep not in nodes: raise ValueError('Missing dependency '+dep)
        verify(nodes[dep],nodes,stack+(nid,))
        if pins[dep]!=sha(safe(nodes[dep]['certificate'])):
            raise ValueError(nid+' stale dependency certificate: '+dep)
    return cert

def check_origin():
    origin=subprocess.run(['git','-C',str(ROOT),'remote','get-url','origin'],capture_output=True,text=True)
    pattern=r'(?:https://github\.com/|git@github\.com:|ssh://git@github\.com(?::22)?/)'+re.escape(EXPECTED_REPOSITORY)+r'(?:\.git)?/?'
    if origin.returncode or not re.fullmatch(pattern,origin.stdout.strip(),flags=re.IGNORECASE):
        raise ValueError('origin is not the authorized GitHub repository')

def committed_file_matches(commit, rel, digest):
    shown=subprocess.run(['git','-C',str(ROOT),'show',commit+':'+rel],capture_output=True)
    return shown.returncode==0 and hashlib.sha256(shown.stdout).hexdigest()==digest

def published(node, nodes, stack=()):
    """Check the full evidence/dependency closure against fetched origin objects."""
    nid=node['id']
    if nid in stack: raise ValueError('Publication dependency cycle: '+nid)
    cert=verify(node,nodes)
    commit=node.get('github_commit')
    if not commit:
        raise ValueError(nid+' is locally verified but not yet recorded on GitHub; extension remains blocked')
    if not isinstance(commit,str) or not re.fullmatch(r'[0-9a-f]{40}',commit):
        raise ValueError('Invalid recorded GitHub commit')
    check_origin()
    command=['git','-C',str(ROOT),'for-each-ref','--format=%(refname)','--contains',commit,'refs/remotes/origin/']
    found=subprocess.run(command,capture_output=True,text=True)
    if found.returncode or not found.stdout.strip():
        raise ValueError('Recorded node commit is not in a fetched origin branch')
    if not committed_file_matches(commit,node['certificate'],sha(safe(node['certificate']))):
        raise ValueError(nid+' recorded GitHub certificate differs from current certificate')
    for role,item in cert['files'].items():
        if not committed_file_matches(commit,item['path'],item['sha256']):
            raise ValueError(nid+' recorded GitHub evidence is missing or stale: '+role)
    for dep in dependency_ids(node):
        published(nodes[dep],nodes,stack+(nid,))

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('command',choices=['audit','can-extend']);ap.add_argument('node',nargs='?');a=ap.parse_args()
    t=tree(); ns={n['id']:n for n in t['nodes']}
    if len(ns)!=len(t['nodes']): raise ValueError('Duplicate IDs')
    if a.command=='can-extend':
        if a.node=='ROOT':
            print('ROOT is administrative: only independent first nodes may start.');return
        published(ns[a.node],ns)
        print(a.node+': exact current evidence permits a child; this is not a global PDE certificate.');return
    for n in ns.values():
        if n.get('gate')=='passed' or n.get('lean_status')=='lean-verified': verify(n,ns)
        for dep in dependency_ids(n):
            if dep not in ns: raise ValueError('Missing dependency '+str(dep))
            published(ns[dep],ns)
        chain=[]; cur=n
        while cur.get('parent')!='ROOT':
            if cur['id'] in chain: raise ValueError('Tree cycle')
            chain.append(cur['id']);cur=ns[cur['parent']]
    print(json.dumps({'tree_integrity':'PASS','nodes':len(ns),'verified_nodes':sum(n.get('gate')=='passed' for n in ns.values()),'global_PDE_theorem':'OPEN','github_status':t.get('github_status')},indent=2))
if __name__=='__main__':
    try: main()
    except (ValueError,KeyError,OSError,json.JSONDecodeError) as e:
        print('REJECTED: '+str(e));sys.exit(2)

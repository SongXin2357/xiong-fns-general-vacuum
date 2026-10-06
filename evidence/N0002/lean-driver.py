from pathlib import Path
import sys, subprocess, runpy, json, hashlib, datetime
root=Path(__file__).resolve().parents[2]
runtime=root/'lean/local-runtime-n0002'
runtime.mkdir(exist_ok=True)
(runtime/'lakefile.toml').write_text('name = "fns_tree_n0002"\nversion = "0.1.0"\ndefaultTargets = ["N0002Check"]\n\n[[require]]\nname = "mathlib"\npath = "/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib"\n\n[[lean_lib]]\nname = "FNSTree"\nsrcDir = ".."\nroots = ["FNSTree.N0001", "FNSTree.N0002"]\n\n[[lean_lib]]\nname = "N0002Check"\nsrcDir = ".."\n')
(runtime/'lean-toolchain').write_bytes((root/'lean/lean-toolchain').read_bytes())
if not (runtime/'lake-manifest.json').exists():
 (runtime/'lake-manifest.json').write_bytes((root/'lean/local-runtime/lake-manifest.json').read_bytes())
env=runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')['child_env']()
mode=sys.argv[1] if len(sys.argv)>1 else 'build'
args={'build':['build','N0002Check'], 'probe':['env','lean','../FNSTree/N0002.lean'], 'print':['env','lean','../N0002Check.lean'], 'version':['env','lean','--version']}[mode]
cmd=['/home/sx/xiong-agent/.elan/bin/lake']+args
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
prefix=root/'evidence/N0002'/('lean-'+stamp+'-'+mode)
source=root/'lean/FNSTree/N0002.lean'
Path(str(prefix)+'.source.lean').write_bytes(source.read_bytes())
paths=[source,root/'lean/N0002Check.lean',root/'lean/lakefile.toml',root/'lean/lean-toolchain',root/'notes/nodes/N0002/statement.md']
meta={'utc':stamp,'command':cmd,'cwd':str(runtime),'toolchain':(root/'lean/lean-toolchain').read_text().strip(),'hashes':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},'dependency_commit_expected':'0df444a360eaa60ab8c11dca51a86af692955474'}
try:
 result=subprocess.run(cmd,cwd=runtime,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=600)
 output=result.stdout; meta['exit_code']=result.returncode
except subprocess.TimeoutExpired as e:
 output=(e.stdout or b'').decode() if isinstance(e.stdout,bytes) else (e.stdout or '')
 meta['exit_code']='TIMEOUT_600_SECONDS'
Path(str(prefix)+'.log').write_text(output)
Path(str(prefix)+'.json').write_text(json.dumps(meta,ensure_ascii=False,indent=2))
print(json.dumps(meta,ensure_ascii=False,indent=2)); print(output)
sys.exit(0 if meta['exit_code']==0 else 1)
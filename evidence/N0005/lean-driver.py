from pathlib import Path
import sys, subprocess, runpy, json, hashlib, datetime, shutil
root=Path(__file__).resolve().parents[2]
runtime=root/'lean/local-runtime-n0005'
runtime.mkdir(exist_ok=True)
(runtime/'lakefile.toml').write_text('name = "fns_tree_n0005_attempts"\nversion = "0.1.0"\ndefaultTargets = ["N0005Check"]\n\n[[require]]\nname = "mathlib"\npath = "/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib"\n\n[[lean_lib]]\nname = "N0005Bridge"\n\n[[lean_lib]]\nname = "N0005Check"\nsrcDir = ".."\n')
(runtime/'lean-toolchain').write_bytes((root/'lean/lean-toolchain').read_bytes())
if not (runtime/'lake-manifest.json').exists():
 (runtime/'lake-manifest.json').write_bytes((root/'lean/local-runtime/lake-manifest.json').read_bytes())
env=runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')['child_env']()
mode=sys.argv[1] if len(sys.argv)>1 else 'probe'
source=root/'evidence/N0005'/(sys.argv[2] if len(sys.argv)>2 else 'attempt-api.lean')
if mode=='build':
 shutil.copyfile(source,runtime/'N0005Bridge.lean')
 args=['build','N0005Bridge','N0005Check']
elif mode=='print': args=['env','lean','../N0005Check.lean']
elif mode=='version': args=['env','lean','--version']
else: args=['env','lean',str(source)]
cmd=['/home/sx/xiong-agent/.elan/bin/lake']+args
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
prefix=root/'evidence/N0005'/('lean-'+stamp+'-'+mode)
Path(str(prefix)+'.source.lean').write_bytes(source.read_bytes())
paths=[source,root/'lean/lean-toolchain',root/'notes/nodes/N0005/statement.md']
check=root/'lean/N0005Check.lean'
if check.exists(): paths.append(check)
meta={'utc':stamp,'command':cmd,'cwd':str(runtime),'toolchain':(root/'lean/lean-toolchain').read_text().strip(),'hashes':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},'dependency_commit_expected':'0df444a360eaa60ab8c11dca51a86af692955474','node_promoted':False}
result=subprocess.run(cmd,cwd=runtime,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
meta['exit_code']=result.returncode
Path(str(prefix)+'.log').write_text(result.stdout)
Path(str(prefix)+'.json').write_text(json.dumps(meta,ensure_ascii=False,indent=2))
print(json.dumps(meta,ensure_ascii=False,indent=2)); print(result.stdout)
sys.exit(result.returncode)

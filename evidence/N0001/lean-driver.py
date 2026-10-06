from pathlib import Path
import sys, subprocess, runpy, json, hashlib, datetime
root=Path(__file__).resolve().parents[2]
cwd=root/'lean/local-runtime'
entry=runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')
env=entry['child_env']()
mode=sys.argv[1] if len(sys.argv)>1 else 'build'
command=['/home/sx/xiong-agent/.elan/bin/lake']+({'build':['build'],'print':['env','lean','../FNSTree.lean'],'version':['env','lean','--version']}[mode])
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
prefix=root/'evidence/N0001'/('lean-'+stamp+'-'+mode)
source=root/'lean/FNSTree/N0001.lean'
rootfile=root/'lean/FNSTree.lean'
Path(str(prefix)+'.source.lean').write_bytes(source.read_bytes())
metadata={'utc':stamp,'command':command,'cwd':str(cwd),'toolchain':(root/'lean/lean-toolchain').read_text().strip(),'hashes':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [source,rootfile,root/'lean/lakefile.toml',root/'lean/lake-manifest.json',root/'notes/nodes/N0001/statement.md']}}
metadata['installed_mathlib_commit']=subprocess.check_output(['git','-C','/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib','rev-parse','HEAD'],env=env,text=True).strip()
try:
 result=subprocess.run(command,cwd=cwd,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=600)
 output=result.stdout; metadata['exit_code']=result.returncode
except subprocess.TimeoutExpired as e:
 output=(e.stdout or b'').decode() if isinstance(e.stdout,bytes) else (e.stdout or '')
 metadata['exit_code']='TIMEOUT_600_SECONDS'
Path(str(prefix)+'.log').write_text(output)
Path(str(prefix)+'.json').write_text(json.dumps(metadata,ensure_ascii=False,indent=2))
print(json.dumps(metadata,ensure_ascii=False,indent=2)); print(output)
sys.exit(0 if metadata['exit_code']==0 else 1)
"""Compile an existing TeX source with the available pdflatex and retain evidence."""
import argparse,datetime,hashlib,json,shutil,subprocess,sys
from pathlib import Path
ap=argparse.ArgumentParser();ap.add_argument('--source',required=True);ap.add_argument('--evidence',required=True);a=ap.parse_args()
f=Path(a.source).resolve();e=Path(a.evidence).resolve();e.mkdir(parents=True,exist_ok=True)
tag=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ'); engine=shutil.which('pdflatex')
if not engine:raise SystemExit('Existing pdflatex not found; no installation attempted.')
rec={'source_name':f.name,'source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'engine':engine,'time_utc':tag,'passes':[]}
for i in [1,2]:
    cmd=[engine,'-interaction=nonstopmode','-halt-on-error',f.name]
    r=subprocess.run(cmd,cwd=f.parent,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
    log=e/(tag+'-pass'+str(i)+'.log');log.write_bytes(r.stdout)
    rec['passes'].append({'command':cmd,'exit_code':r.returncode,'log':log.name})
    if r.returncode:break
if rec['passes'][-1]['exit_code']==0:
    pdf=f.with_suffix('.pdf');rec['pdf_sha256']=hashlib.sha256(pdf.read_bytes()).hexdigest();rec['pdf_bytes']=pdf.stat().st_size
(e/(tag+'-build.json')).write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec));sys.exit(rec['passes'][-1]['exit_code'])

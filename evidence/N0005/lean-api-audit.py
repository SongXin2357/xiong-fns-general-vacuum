from pathlib import Path
import re, hashlib, subprocess, runpy, json, datetime
root=Path(__file__).resolve().parents[2]
lib=Path('/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib')
env=runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')['child_env']()
patterns={
 'topological_reflexivity_names':r'IsReflexive|ReflexiveSpace|[Rr]eflexive',
 'lp_dual_and_weak_compactness':r'StrongDual.*Lp|Lp.*StrongDual|isCompact.*WeakSpace|WeakSpace.*isCompact',
 'lp_pairing_surjectivity':r'surjective.*lpPairing|lpPairing.*surjective|denseRange.*lpPairing',
 'available_supporting_apis':r'isCompact_closure_of_isBounded|isSeqCompact_closedBall|ae_eq_of_integral_contDiff_smul_eq|theorem denseRange_toLpCLM|instance Lp.SecondCountableTopology|Milman-Pettis',
}
search_roots=[lib/'Mathlib/Analysis',lib/'Mathlib/MeasureTheory']
files=sorted(p for d in search_roots for p in d.rglob('*.lean'))
results={k:[] for k in patterns}
for p in files:
 for number,line in enumerate(p.read_text().splitlines(),1):
  for key,pattern in patterns.items():
   if re.search(pattern,line): results[key].append({'file':str(p.relative_to(lib)),'line':number,'text':line})
source_paths=[lib/'Mathlib/Analysis/Normed/Module/DoubleDual.lean',lib/'Mathlib/Analysis/Normed/Module/WeakDual.lean',lib/'Mathlib/MeasureTheory/Function/Holder.lean',lib/'Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean',lib/'Mathlib/Analysis/Convex/Uniform.lean',lib/'Mathlib/MeasureTheory/Measure/SeparableMeasure.lean',lib/'Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean']
meta={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'dependency_commit_actual':subprocess.check_output(['git','rev-parse','HEAD'],cwd=lib,env=env,text=True).strip(),'search_files':len(files),'patterns':patterns,'results':results,'read_only_source_hashes':{str(p.relative_to(lib)):hashlib.sha256(p.read_bytes()).hexdigest() for p in source_paths},'inference_limit':'Search non-hits are audit evidence, not a metatheorem that no proof can be built from existing foundations.'}
out=root/'evidence/N0005/lean-api-audit.json'
out.write_text(json.dumps(meta,ensure_ascii=False,indent=2))
print(json.dumps({'path':str(out),'dependency_commit_actual':meta['dependency_commit_actual'],'search_files':len(files),'matches':{k:len(v) for k,v in results.items()}},indent=2))

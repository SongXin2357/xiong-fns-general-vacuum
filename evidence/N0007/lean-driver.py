from pathlib import Path
import sys, subprocess, runpy, json, hashlib, datetime

root = Path(__file__).resolve().parents[2]
runtime = root / 'lean/local-runtime-n0007'
runtime.mkdir(exist_ok=True)
(runtime / 'lakefile.toml').write_text(
    'name = "fns_tree_n0007_aux"\nversion = "0.1.0"\n'
    'defaultTargets = ["N0007AuxCheck"]\n\n'
    '[[require]]\nname = "mathlib"\n'
    'path = "/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib"\n\n'
    '[[lean_lib]]\nname = "FNSTree"\nsrcDir = ".."\n'
    'roots = ["FNSTree.N0001", "FNSTree.N0002", "FNSTree.N0007"]\n\n'
    '[[lean_lib]]\nname = "N0007AuxCheck"\nsrcDir = ".."\n',
    encoding='utf-8')
(runtime / 'lean-toolchain').write_bytes((root / 'lean/lean-toolchain').read_bytes())
if not (runtime / 'lake-manifest.json').exists():
    (runtime / 'lake-manifest.json').write_bytes(
        (root / 'lean/local-runtime-n0002/lake-manifest.json').read_bytes())
env = runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')['child_env']()
mode = sys.argv[1] if len(sys.argv) > 1 else 'build'
commands = {
    'build': ['build', 'N0007AuxCheck'],
    'print': ['env', 'lean', '../N0007AuxCheck.lean'],
    'probe': ['env', 'lean', '../FNSTree/N0007.lean'],
    'version': ['env', 'lean', '--version'],
}
if mode not in commands:
    raise SystemExit('usage: lean-driver.py [build|print|probe|version]')
cmd = ['/home/sx/xiong-agent/.elan/bin/lake'] + commands[mode]
stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
prefix = root / 'evidence/N0007' / ('lean-' + stamp + '-' + mode)
source = root / 'lean/FNSTree/N0007.lean'
Path(str(prefix) + '.source.lean').write_bytes(source.read_bytes())
paths = [
    source, root / 'lean/N0007AuxCheck.lean',
    root / 'lean/lakefile.toml', root / 'lean/lean-toolchain',
    root / 'notes/nodes/N0007/statement.md',
]
meta = {
    'utc': stamp, 'scope': 'Five N0007 auxiliaries only; full exact PDE target OPEN',
    'command': cmd, 'cwd': str(runtime),
    'toolchain': (root / 'lean/lean-toolchain').read_text().strip(),
    'hashes': {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
               for p in paths},
    'dependency_commit_expected': '0df444a360eaa60ab8c11dca51a86af692955474',
    'dependency_commit_actual': subprocess.run(['git', '-C', '/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib', 'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, check=True).stdout.strip(),
}
try:
    result = subprocess.run(cmd, cwd=runtime, env=env, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, text=True, timeout=600)
    output = result.stdout
    meta['exit_code'] = result.returncode
except subprocess.TimeoutExpired as e:
    output = (e.stdout or b'').decode() if isinstance(e.stdout, bytes) else (e.stdout or '')
    meta['exit_code'] = 'TIMEOUT_600_SECONDS'
Path(str(prefix) + '.log').write_text(output, encoding='utf-8')
Path(str(prefix) + '.json').write_text(
    json.dumps(meta, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(meta, ensure_ascii=False, indent=2))
print(output)
sys.exit(0 if meta['exit_code'] == 0 else 1)
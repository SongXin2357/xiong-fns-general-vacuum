from pathlib import Path
import sys, subprocess, runpy, json, hashlib, datetime

root = Path(__file__).resolve().parents[2]
runtime = root / 'lean/local-runtime-n0007'
lakefile = runtime / 'lakefile.toml'
config = lakefile.read_text(encoding='utf-8')
if '"FNSTree.N0007Stress"' not in config:
    config = config.replace('roots = [', 'roots = ["FNSTree.N0007Stress", ', 1)
if 'name = "N0007StressCheck"' not in config:
    config += '\n[[lean_lib]]\nname = "N0007StressCheck"\nsrcDir = ".."\n'
lakefile.write_text(config, encoding='utf-8')
env = runpy.run_path('/home/sx/xiong-agent/scripts/xiong_agent.py')['child_env']()
mode = sys.argv[1] if len(sys.argv) > 1 else 'build'
commands = {
    'build': ['build', 'N0007StressCheck'],
    'print': ['env', 'lean', '../N0007StressCheck.lean'],
    'probe': ['env', 'lean', '../FNSTree/N0007Stress.lean'],
}
if mode not in commands:
    raise SystemExit('usage: stress-driver.py [build|print|probe]')
cmd = ['/home/sx/xiong-agent/.elan/bin/lake'] + commands[mode]
stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
prefix = root / 'evidence/N0007' / ('stress-' + stamp + '-' + mode)
source = root / 'lean/FNSTree/N0007Stress.lean'
Path(str(prefix) + '.source.lean').write_bytes(source.read_bytes())
paths = [
    source, root / 'lean/N0007StressCheck.lean', root / 'lean/lakefile.toml',
    root / 'lean/lean-toolchain', root / 'notes/nodes/N0007/statement.md'
]
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
meta = {
    'utc': stamp,
    'scope': 'N0007 stress-row auxiliary only; full exact PDE target OPEN',
    'command': cmd,
    'cwd': str(runtime),
    'toolchain': (root / 'lean/lean-toolchain').read_text().strip(),
    'hashes': {str(p.relative_to(root)): sha(p) for p in paths},
    'dependency_commit_expected': '0df444a360eaa60ab8c11dca51a86af692955474',
    'dependency_commit_actual': subprocess.run(
        ['git', '-C', '/home/sx/xiong-agent/lean/formalization/.lake/packages/mathlib',
         'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        text=True, check=True).stdout.strip(),
}
try:
    proc = subprocess.run(cmd, cwd=runtime, env=env, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, timeout=600)
    output = proc.stdout
    meta['exit_code'] = proc.returncode
except subprocess.TimeoutExpired as exc:
    output = (exc.stdout or b'').decode() if isinstance(exc.stdout, bytes) else (exc.stdout or '')
    meta['exit_code'] = 'TIMEOUT_600_SECONDS'
Path(str(prefix) + '.log').write_text(output, encoding='utf-8')
Path(str(prefix) + '.json').write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding='utf-8')
print(json.dumps(meta, ensure_ascii=False, indent=2))
print(output)
sys.exit(0 if meta['exit_code'] == 0 else 1)

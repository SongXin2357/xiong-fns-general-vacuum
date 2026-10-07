"""Verify N0007's additional Lean bridges without certifying the PDE node."""
from pathlib import Path
import hashlib
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "evidence/N0007/bridge-evidence-manifest.json"
EXPECTED = "[propext,Classical.choice,Quot.sound]"


def local(relative):
    path = (ROOT / relative).resolve()
    if not path.is_relative_to(ROOT.resolve()) or not path.is_file():
        raise ValueError("missing or nonlocal file: " + relative)
    return path


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_run(data, build_key, print_key, target, module, names):
    build = json.loads(local(data[build_key]).read_text(encoding="utf-8"))
    printed = json.loads(local(data[print_key]).read_text(encoding="utf-8"))
    if build["exit_code"] != 0 or printed["exit_code"] != 0:
        raise ValueError("Lean build or type/axiom run failed for " + target)
    for run in (build, printed):
        if run["dependency_commit_expected"] != run["dependency_commit_actual"]:
            raise ValueError("Mathlib dependency drift for " + target)
        if run["hashes"][module] != digest(local(module)):
            raise ValueError("Lean module no longer matches run: " + module)
        check_file = "lean/" + target + ".lean"
        if run["hashes"][check_file] != digest(local(check_file)):
            raise ValueError("Lean check source no longer matches run: " + check_file)
    if build["command"][-2:] != ["build", target]:
        raise ValueError("wrong build command for " + target)
    if printed["command"][-3:] != ["env", "lean", "../" + target + ".lean"]:
        raise ValueError("wrong type/axiom command for " + target)
    log_rel = data[print_key][:-5] + ".log"
    log = local(log_rel).read_text(encoding="utf-8")
    if "sorryAx" in log:
        raise ValueError("sorryAx in printed proof evidence")
    for name in names:
        qualified = "FNSTree.N0007." + name
        if not re.search(r"theorem " + re.escape(qualified) + r"(?:\.\{[^}]+\})? :", log):
            raise ValueError("missing actual theorem type: " + name)
        match = re.search(
            r"'" + re.escape(qualified) + r"' depends on axioms: (\[[^\]]+\])",
            log,
        )
        if not match or re.sub(r"\s+", "", match.group(1)) != EXPECTED:
            raise ValueError("unexpected or missing transitive axioms: " + name)


def main():
    data = json.loads(MANIFEST.read_text(encoding="utf-8"))
    if data["node"] != "N0007" or data["parent"] != "N0002":
        raise ValueError("node identity mismatch")
    if data["node_gate"] != "OPEN" or data["full_exact_target_Lean"] != "NOT_RUN":
        raise ValueError("partial bridge evidence cannot certify N0007")
    for relative, expected in data["file_sha256"].items():
        if digest(local(relative)) != expected:
            raise ValueError("stale evidence file: " + relative)
    for relative in ("lean/FNSTree/N0007TimeSlice.lean",
                     "lean/FNSTree/N0007Stress.lean"):
        if re.search(r"\b(sorry|admit|axiom)\b",
                     local(relative).read_text(encoding="utf-8")):
            raise ValueError("placeholder or axiom token in Lean module: " + relative)
    time_names = data["new_auxiliary_theorems"][:4]
    stress_names = data["new_auxiliary_theorems"][4:]
    check_run(data, "time_slice_final_build", "time_slice_final_print",
              "N0007TimeSliceCheck", "lean/FNSTree/N0007TimeSlice.lean",
              time_names)
    check_run(data, "stress_final_build", "stress_final_print",
              "N0007StressCheck", "lean/FNSTree/N0007Stress.lean",
              stress_names)
    tree = json.loads(local("notes/tree.json").read_text(encoding="utf-8"))
    node = next(n for n in tree["nodes"] if n["id"] == "N0007")
    if node["gate"] != "open" or node["certificate"] is not None or node["children"]:
        raise ValueError("N0007 tree gate was incorrectly promoted")
    print(json.dumps({
        "node": "N0007",
        "additional_evidence_integrity": "PASS",
        "new_verified_auxiliaries": len(data["new_auxiliary_theorems"]),
        "full_exact_target_Lean": "NOT_RUN",
        "node_gate": "OPEN",
        "mathematical_proof_authority": False,
    }, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print("BRIDGE EVIDENCE FAIL:", exc, file=sys.stderr)
        sys.exit(1)



"""Check N0007's partial execution evidence; never certify the full node."""
from pathlib import Path
import hashlib
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "evidence/N0007/partial-evidence-manifest.json"
EXPECTED_AXIOMS = "[propext, Classical.choice, Quot.sound]"

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def internal(relative):
    path = (ROOT / relative).resolve()
    if not path.is_relative_to(ROOT.resolve()) or not path.is_file():
        raise ValueError("missing or nonlocal path: " + relative)
    return path

def main():
    data = json.loads(MANIFEST.read_text(encoding="utf-8"))
    if data["node"] != "N0007" or data["node_gate"] != "OPEN":
        raise ValueError("node or gate status changed")
    if data["full_exact_target_Lean"] != "NOT_RUN":
        raise ValueError("partial evidence cannot claim full target")
    for rel, expected in data["file_sha256"].items():
        if digest(internal(rel)) != expected:
            raise ValueError("stale file: " + rel)
    source = internal("lean/FNSTree/N0007.lean")
    if re.search(r"\b(sorry|admit|axiom)\b", source.read_text(encoding="utf-8")):
        raise ValueError("placeholder or axiom token in primary source")
    build = json.loads(internal(data["final_build_metadata"]).read_text(encoding="utf-8"))
    printed = json.loads(internal(data["final_print_metadata"]).read_text(encoding="utf-8"))
    if build["exit_code"] != 0 or printed["exit_code"] != 0:
        raise ValueError("actual Lean process did not exit 0")
    if build["dependency_commit_expected"] != build["dependency_commit_actual"]:
        raise ValueError("wrong Mathlib commit")
    if build["hashes"]["lean/FNSTree/N0007.lean"] != digest(source):
        raise ValueError("build source hash mismatch")
    if printed["hashes"]["lean/FNSTree/N0007.lean"] != digest(source):
        raise ValueError("print source hash mismatch")
    if build["hashes"]["lean/N0007AuxCheck.lean"] != digest(internal("lean/N0007AuxCheck.lean")):
        raise ValueError("build check-file hash mismatch")
    if build["command"][-2:] != ["build", "N0007AuxCheck"]:
        raise ValueError("wrong build command")
    if printed["command"][-3:] != ["env", "lean", "../N0007AuxCheck.lean"]:
        raise ValueError("wrong print command")
    log = internal(data["final_print_log"]).read_text(encoding="utf-8")
    for name in data["auxiliary_theorems"]:
        if "theorem FNSTree.N0007." + name + " :" not in log:
            raise ValueError("missing full theorem type: " + name)
        if ("'FNSTree.N0007." + name + "' depends on axioms: " + EXPECTED_AXIOMS) not in log:
            raise ValueError("wrong or missing transitive axioms: " + name)
    if "sorryAx" in log:
        raise ValueError("sorryAx in type/axiom log")
    result = {
        "node": "N0007",
        "partial_evidence_integrity": "PASS",
        "verified_auxiliary_count": len(data["auxiliary_theorems"]),
        "full_exact_target_Lean": "NOT_RUN",
        "full_node_gate": "OPEN",
        "mathematical_proof_authority": False
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))

if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print("PARTIAL EVIDENCE FAIL:", exc, file=sys.stderr)
        sys.exit(1)
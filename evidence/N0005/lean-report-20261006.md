# N0005 Lean attempt report — 2026-10-06

Decision: **OPEN / full theorem not certified**. No `FNSTree.N0005` module exists from this attempt. This report is evidence of a genuine unsuccessful full-target attempt and successfully checked auxiliary analysis, not a replacement theorem.

## Environment

- Actual Lean: 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, x86_64 Linux Release.
- Actual installed Mathlib HEAD: `0df444a360eaa60ab8c11dca51a86af692955474`.
- Dedicated runtime: `lean/local-runtime-n0005`.
- Driver: `evidence/N0005/lean-driver.py`, using the installed `xiong_agent.child_env()` and `/home/sx/xiong-agent/.elan/bin/lake`.
- No existing dependency source/cache was edited or relinked. All probe source snapshots, compiler logs, and per-run metadata belong to N0005. The isolated build compiled `N0005Bridge` and `N0005Check`; existing dependencies were reused.

## Exact target and failed attempts

`attempt-exact-statement.lean` elaborates the complete finite-real-p target with real density, R^m velocity, actual Lebesgue/Bochner integrals, genuine right-time convergence, explicit `MemLp`, and local momentum integrability. This is only a `Prop` definition, not a theorem proof.

`attempt-exact-proof-v1.lean` attempts that precise target. The real compiler discharges norm-boundedness but leaves this analytical goal, for X = L^p(R^2;R^m):

```lean
closure (NormedSpace.inclusionInDoubleDualWeak ℝ X ''
    (toWeakSpace ℝ X '' Metric.closedBall 0 C)) ⊆
  Set.range (NormedSpace.inclusionInDoubleDualWeak ℝ X)
```

The existential representative conclusion consequently remains unproved. This goal cannot be replaced by a supplied hypothesis without changing the theorem. `attempt-weak-compactness-v2.lean` isolates the same failure already for scalar L^p on R^2 and general 1 < p < infinity. Its only error is this unresolved range goal. The earlier v1 snapshot is retained with its missing Euclidean import error; it is not evidence of the final analytic barrier.

Installed Mathlib provides Banach–Alaoglu, sequential Banach–Alaoglu, L^p separability, smooth distribution uniqueness, smooth/continuous density results, and `ContinuousLinearMap.lpPairing`. The audited search found no L^p topological reflexivity theorem or surjectivity/representation theorem for this pairing. A proof of either required interface must be developed; no such fact is assumed in the exact target or the built auxiliaries. Algebraic `Module.IsReflexive` is not a valid replacement.

`lean-api-audit.py` reproduces read-only searches across 1,112 installed Analysis/MeasureTheory source files, records every match and the hashes of key supporting files in `lean-api-audit.json`. Search non-hits do not prove that a long new derivation from foundations is impossible.

## Compiler results

Every timestamp below is UTC; the user-local date is 2026-10-06.

| Retained log prefix | Input/action | Exit | Meaning |
|---|---|---:|---|
| lean-20261006T133705.774252Z-probe | attempt-api.lean | 1 | Genuine API signatures; two attempted names absent |
| lean-20261006T133906.741833Z-probe | attempt-bridges-v1.lean | 0 | Six auxiliary analytic results compile |
| lean-20261006T134125.643104Z-probe | attempt-exact-statement.lean | 0 | Full exact proposition elaborates, no proof asserted |
| lean-20261006T134126.537885Z-probe | attempt-weak-compactness-v1.lean | 1 | Retained first failure including import issue |
| lean-20261006T134212.296103Z-probe | attempt-weak-compactness-v2.lean | 1 | Genuine compactness range obligation only |
| lean-20261006T134410.223475Z-probe | attempt-bridges-v2.lean | 0 | Seven auxiliary analytic results compile |
| lean-20261006T134429.870001Z-probe | attempt-exact-proof-v1.lean | 1 | Exact target remains unproved at compactness/existence |
| lean-20261006T134538.652129Z-build | N0005Bridge + N0005Check | 0 | Actual isolated build, all seven types and axioms printed |
| lean-20261006T134831.882186Z-version | lean --version | 0 | Exact compiler version recorded |

Each prefix has a complete `.log`, a `.json` with command, cwd, source hashes and exit code, and a `.source.lean` snapshot. No elapsed deadline or timeout caused the analytical stop.

## Auxiliary axiom audit

Final auxiliary source: `attempt-bridges-v2.lean`, SHA-256 `cdc4622fc70d1e3f7be35b9541cc0c94c96d939246ec0165f8244c7cefa20eae`.

Check source: `lean/N0005Check.lean`, SHA-256 `a3ad0ce79459c163dc8d88d19001c1d175c01f4d5aa012f55b9449eeeb56ca19`.

The seven printed declarations are `density_error_bound`, `test_velocity_product_integrable`, `test_velocity_product_bound`, `density_error_tendsto`, `density_uniform_error_tendsto`, `momentum_identification`, and `positive_density_transfer`, all under namespace `N0005Attempt`.

Every `#print axioms` list is exactly `[propext, Classical.choice, Quot.sound]`. None contains `sorryAx` or a custom analytic axiom. The complete type and expanded proof output is in the successful build log. The successful build has benign unused-hypothesis/section-variable warnings, not proof holes. These auxiliaries are not the node theorem and cannot unlock a child.

## Reproduction for the parent

From PowerShell, with WSL access:

```powershell
wsl.exe -d Ubuntu-24.04 -u sx -- /home/sx/xiong-agent/.venv/bin/python '/mnt/d/tex/Latex/manuscripts/王雪全局解/xiong-fns-small-energy/research-tree/evidence/N0005/lean-driver.py' build attempt-bridges-v2.lean
wsl.exe -d Ubuntu-24.04 -u sx -- /home/sx/xiong-agent/.venv/bin/python '/mnt/d/tex/Latex/manuscripts/王雪全局解/xiong-fns-small-energy/research-tree/evidence/N0005/lean-driver.py' print attempt-bridges-v2.lean
```

Expected: both exit 0; the print command supplies the final auxiliary types and axiom lists again. For the exact target, run the same driver with `probe attempt-exact-proof-v1.lean`; expected exit 1 with the two substantive unresolved goals shown above.

## Remaining obligations

Develop and kernel-check the actual L^p reflexivity/representation or direct bounded-trace representation theorem; assemble extraction and all actual trace-pairing steps from the stated inputs; then perform full exact semantic review. The independent paper derivation is in `independent-proof-20261006.md`. Manuscript source mapping, physical data checks, compatibility claims, and any global PDE interpretation were not performed here and are not certified by these auxiliary builds.

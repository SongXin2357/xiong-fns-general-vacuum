# N0007 Lean bridge continuation — time slices and stress, still OPEN

Date: 2026-10-07. Parent: the certified N0002 planar divergence theorem. This is
an addition to the earlier [five-auxiliary report](formalization-report-20261007.md),
not a certificate for the exact N0007 PDE application.

## New actual Lean results

The [time-slice module](../../../lean/FNSTree/N0007TimeSlice.lean) contains four
built theorems. The first two are whole-line versions. The two versions that
match the original finite lifespan `(0,T)` prove the following implication:
if each scalar residual `F(i,j,t)` is integrable on `(0,T)` and vanishes
against every compact smooth time test supported inside that interval, then
one common full-measure time set works for both momentum components
`i : Fin 2` and every member `j` of a countable spatial test family.
The [stress module](../../../lean/FNSTree/N0007Stress.lean) proves that
`μ G_i + (μ+bulk)d e_i - P e_i` lies in `L²(R²;R²)` when `G_i,d,P`
already lie in `L²`. These are statements on the same Euclidean plane
as N0002. They introduce no extra PDE hypothesis into the registered target.

The successful actual commands were `lake build N0007TimeSliceCheck` and
`lake env lean ../N0007TimeSliceCheck.lean`, plus the corresponding
`N0007StressCheck` commands. The locked toolchain was Lean 4.33.1 and
Mathlib commit `0df444a360eaa60ab8c11dca51a86af692955474`.
The [time-slice build metadata](../../../evidence/N0007/time-slice-20261007T101416.119727Z-build.json),
[time-slice type/axiom log](../../../evidence/N0007/time-slice-20261007T101447.445579Z-print.log),
[stress build metadata](../../../evidence/N0007/stress-20261007T101913.783222Z-build.json),
and [stress type/axiom log](../../../evidence/N0007/stress-20261007T101937.133417Z-print.log)
record actual exit code zero, the full theorem types, and transitive axioms.
Every new declaration prints only `propext`, `Classical.choice`, and
`Quot.sound`. The source modules contain no `sorry`, `admit`, or custom
analytic axiom. Earlier failed attempts are preserved, including a Lake
dependency-root error, a reserved-name syntax error, and a topology-instance
mismatch during an abandoned notation conversion.

## Semantic limit and exact next obligations

To apply the interval theorem, set
`F(i,j,t) = ∫ f_i(t,x) φ_j(x) dx + ∫ V_i(t,x)·∇φ_j(x) dx`.
The new theorem assumes `F(i,j,·)` is integrable and that its integral
against every supported time test vanishes. It **does not derive** either
fact from the conservative Wang-v1 momentum equation. That derivation
requires the common `u_t` representative, the continuity and momentum
product rules, and a spacetime integrability argument. The theorem also
does not construct a countable `C¹`-dense compact-test family or extend
its equality to *every* compact smooth spatial test.

The stress theorem assumes `G_i,d,P∈L²`; it does not infer these fields
from the original solution class or identify `G_i=∇u_i` and
`d=div u`. The earlier pressure and material-source auxiliaries cover
part of that source-space conversion, but not its complete PDE semantics.

Thus there are ten actual built N0007 auxiliaries in total: five earlier
fixed-time results, four temporal residual results, and one stress result.
The **exact N0007 node is OPEN**: full-target Lean build NOT_RUN, no
certificate, no descendants, and no global-existence conclusion. The
[bridge evidence manifest](../../../evidence/N0007/bridge-evidence-manifest.json)
and [deterministic bridge audit](../../../scripts/audit_n0007_bridges.py) bind
this continuation's source and process logs without upgrading that gate.

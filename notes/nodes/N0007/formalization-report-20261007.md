# N0007 formalization report — five auxiliaries, exact target OPEN

Date: 2026-10-07. N0002 remains verified. The exact N0007 PDE application,
source-regularity translation, spacetime product rule, common exceptional-time
set, and stress identity from the original momentum equation have **not**
been formalized. N0007 cannot unlock children.

The task-owned [primary module](../../../lean/FNSTree/N0007.lean) contains
five Mathlib theorems on the same Euclidean plane as N0002:

1. pressure_memLp_of_bounded_density: nonnegative bounded density and
   weighted temperature in $L^2$ imply pressure in $L^2$.
2. weighted_source_integrable: finite nonnegative mass and a weighted
   velocity/time-derivative component in $L^2$ imply its density-weighted
   source is in $L^1$.
3. weighted_convection_integrable: bounded nonnegative density, weighted
   velocity in $L^2$, and a gradient component in $L^2$ imply the convective
   product is in $L^1$.
4. material_source_integrable: the preceding componentwise conditions
   imply the full two-dimensional material source
   $\rho(v+u_1g_1+u_2g_2)$ is in $L^1$.
5. conditional_material_source_zero_mean: given **as explicit hypotheses**
   an $L^2$ stress $V$ and the spatial weak stress identity for every smooth
   compact test, the preceding integrability and exact N0002 theorem imply
   zero spatial mean.

The fifth theorem does **not** prove the weak stress identity from the
Wang-v1 conservative PDE. The module does not identify $v$ with the
actual $u_t$, $g_j$ with actual spatial derivatives, or infer a common
time null set. Consequently it is not the registered N0007 conclusion.

Actual toolchain: Lean 4.33.1 and installed locked Mathlib commit
0df444a360eaa60ab8c11dca51a86af692955474.
The final [build metadata](../../../evidence/N0007/lean-20261007T093632.210862Z-build.json)
and [full build log](../../../evidence/N0007/lean-20261007T093632.210862Z-build.log)
record the actual command lake build N0007AuxCheck, matching dependency
commit and exit code 0. The separate
[type/axiom metadata](../../../evidence/N0007/lean-20261007T093659.517162Z-print.json)
and [full log](../../../evidence/N0007/lean-20261007T093659.517162Z-print.log)
record lake env lean ../N0007AuxCheck.lean and exit code 0. For every
declaration, the printed transitive axioms are only propext,
Classical.choice, and Quot.sound. The tracked primary module contains no
sorry, admit, or custom analytic axiom.

Failed attempts remain recorded. The original first build failed at an
associativity rewrite. The new bridge's first build failed at a broad
conversion and an unscoped infinity notation; see
[its failed metadata](../../../evidence/N0007/lean-20261007T093554.300484Z-build.json)
and [log](../../../evidence/N0007/lean-20261007T093554.300484Z-build.log).
The corrected final source and both successful runs were preserved with
source snapshots. These are execution records, not a full-target proof.
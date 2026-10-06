# N0005 independent reconstruction — 2026-10-06

Status: the mathematical argument below is an independent draft proof; the full theorem is NOT Lean-verified and N0005 must remain OPEN. Seven genuine auxiliary analytic lemmas compile. The missing existential compactness/representation step is recorded in an actual failed full-target compilation.

## Input boundary and meaning of the statement

The only project mathematical input read was `notes/nodes/N0005/statement.md`, together with `AGENTS.md` for workflow. No candidate derivation, private xiong run, old paper/draft proof, other node proof, or other branch was read. `evidence/N0002/lean-driver.py` and Lean runtime manifests were read only as environment patterns. Installed Mathlib source was searched read-only. The source-to-Wang mapping is deliberately outside this independent reconstruction.

Let 1 < p < infinity, q = p/(p-1), T > 0, and m a finite natural number. All scalar fields and times are real, velocities take values in R^m, the measure is Lebesgue measure on R^2, and vector integrals below are actual Bochner integrals over real finite-dimensional spaces.

Suppose u(t) belongs to L^p(R^2;R^m) and its norm is at most M for every 0 < t < T. Suppose rho_0 is locally essentially bounded and rho(t) converges uniformly on each compact set to rho_0 as t decreases to zero. The phrase "conservative distributional trace rho(t)u(t) -> rho_0 u_0" is unpacked as local integrability of each momentum field, local integrability of rho_0 u_0, and convergence of its integrals against every scalar C_c^infinity test. This local integrability is necessary to interpret ordinary functions as distributions, rather than Lean's totalized nonintegrable integral.

The typed target in `attempt-exact-statement.lean` uses these hypotheses directly. Real p is finite by its type. `MemLp` guards each use of the real-valued norm `(eLpNorm ...).toReal`, so infinity-to-zero totalization cannot provide the uniform bound. Its time filter is the genuine right-hand filter `nhdsWithin 0 (Ioo 0 T)`. No weak subsequence, Lp trace representative, reflexivity axiom, or conclusion-bearing structure is a hypothesis.

## Independent derivation

1. Choose t_n = T/(n+2). Then 0 < t_n < T and t_n -> 0. The family w_n = u(t_n) is bounded in L^p. Since 1 < p < infinity and the target R^m is finite-dimensional, this L^p space is reflexive. Bounded sequences in a reflexive Banach space have weakly convergent subsequences. Therefore there are increasing indices n_k and v in L^p such that w_(n_k) converges weakly to v. This standard functional-analysis step is the principal step not formalized by this attempt. It is a theorem used in the mathematical argument, not an extra hypothesis in the formal target.

2. Fix phi in C_c^infinity(R^2;R), and put K = supp(phi), understood as closed support. K is compact and has finite Lebesgue measure. Since rho_0 is essentially bounded on K and phi is bounded with compact support, rho_0 phi belongs to L^q. In particular each vector test rho_0 phi e_j belongs to L^q(R^2;R^m). Holder gives

   integral |rho_0 phi v| <= ||rho_0 phi||_q ||v||_p < infinity.

   Weak convergence thus gives, component by component and hence in R^m,

   integral phi rho_0 u(t_(n_k)) -> integral phi rho_0 v.

   Multiplication by rho_0 here uses its L-infinity bound only on K. There is no global positive lower bound, no division by rho_0, and no continuity assumption on rho_0.

3. For times sufficiently close to zero let delta_K(t) be the supremum on K of |rho(t)-rho_0|. Local uniform convergence implies it is finite there and delta_K(t) -> 0. Empty K gives the zero test. Holder gives the precise error estimate

   || integral phi (rho(t)-rho_0) u(t) ||
   <= delta_K(t) integral |phi| |u(t)|
   <= delta_K(t) ||phi||_q ||u(t)||_p
   <= delta_K(t) ||phi||_q M -> 0.

   The error integrand is locally a difference of locally integrable momentum fields, multiplied by a smooth compact test. Equivalently, its integrability follows from its measurable domination by delta_K(t)|phi||u(t)|. Each integral is therefore legitimate. This step does not assume any strong unweighted convergence of u(t).

4. Combining steps 2 and 3 gives

   integral phi rho(t_(n_k)) u(t_(n_k)) -> integral phi rho_0 v.

   The assumed conservative trace gives the same sequence limit as integral phi rho_0 u_0. Uniqueness of limits in R^m yields equality of those test integrals for every phi.

5. Both rho_0 v and rho_0 u_0 are locally integrable. For the first claim, on compact K,

   integral_K |rho_0 v|
   <= ||rho_0||_(L-infinity(K)) |K|^(1/q) ||v||_p < infinity.

   The second is exactly the meaning of the stated distributional trace. Equality against all smooth compact scalar tests therefore yields rho_0 v = rho_0 u_0 almost everywhere. This proves existence of the requested L^p representative in the ordinary mathematical argument.

6. If rho_0 > 0 almost everywhere, intersect that full-measure set with the equality set. Scalar multiplication by rho_0(x) is injective on R^m there, so v(x) = u_0(x) almost everywhere. Membership in L^p transfers across almost-everywhere equality. Values on null sets are immaterial. On a genuine vacuum set no such cancellation is claimed.

This proof also works when the norm bound holds only on a full-measure set of admissible times, provided the conservative trace and local uniform convergence are defined consistently on that set: choose t_n in its intersection with shrinking positive intervals. That variant is not silently substituted for the currently typed all-admissible-times statement.

## Actual formal progress

`attempt-bridges-v2.lean` proves:

- `density_error_bound`: integrability and norm bound for the real density perturbation in a genuine Bochner integral.
- `test_velocity_product_integrable`: Holder integrability from `MemLp` assumptions.
- `test_velocity_product_bound`: Holder inequality with real exponents and real integrals.
- `density_error_tendsto`: squeeze convergence of the actual perturbation integral.
- `density_uniform_error_tendsto`: derives that convergence directly from uniform density convergence on the support of the test and a uniform Holder-product bound.
- `momentum_identification`: invokes Mathlib's actual smooth-test distribution uniqueness theorem on R^2, with local integrability explicit.
- `positive_density_transfer`: transfers L^p membership by cancellation under almost-everywhere strictly positive density.

These lemmas neither assume a weakly convergent subsequence nor introduce an assumed L^p representative in an existential theorem. The final transfer lemma explicitly describes only the last step once a representative has been obtained. It cannot unlock N0005 or any descendant.

The full input/output target elaborated successfully, but `attempt-exact-proof-v1.lean` fails. Its first substantive attempted bridge is compactness of the weak closure of the L^p ball. The real compiler leaves the goal that the weak-star bidual closure lies in the natural image of L^p. The existential target also remains open. No custom axiom or `sorry` was inserted to close either goal.

## Exact missing library interface

For X = L^p(R^2;R^m), the available theorem `NormedSpace.isCompact_closure_of_isBounded` requires

    closure (inclusionInDoubleDualWeak R X ''
      (toWeakSpace R X '' closedBall 0 M))
      subset range (inclusionInDoubleDualWeak R X).

Boundedness was discharged by the compiler. This range condition was not. An actual L^p topological reflexivity theorem, or an L^p weak compactness theorem, would discharge it; it must not be supplied as an assumed field.

An alternative is the surjectivity of the canonical real Holder pairing L^p -> (L^q)^*. Mathlib provides `ContinuousLinearMap.lpPairing` and its real integral formula but the audited searches found no surjectivity/representation theorem for it. Banach–Alaoglu for the dual or bidual alone yields a functional; it does not identify that functional with an L^p function. Hahn–Banach plus smooth-test density likewise leaves the same L^p representation theorem to prove.

Algebraic `Module.IsReflexive` is not the needed notion: its evaluation map uses the algebraic dual, and over a field algebraic reflexivity has a finite-dimensional consequence. It must not be synthesized or assumed for infinite-dimensional L^p as a substitute for topological reflexivity.

The audited library contains smooth/continuous density results, distribution uniqueness, L^p separability, the Holder pairing, and sequential Banach–Alaoglu. Thus "test functions are unsupported" or "the library has no compactness" would be inaccurate. The specific unresolved analytic ingredient is representation/reflexivity, followed by the unassembled weak-limit/trace integration steps. Searches establish what was found and not found; they do not prove that a new long proof from existing measure-theoretic foundations is impossible.

## Promotion decision

N0005 remains OPEN. No `lean/FNSTree/N0005.lean` was created, no root import was changed, and no weaker/conditional lemma was relabeled as the target. The seven auxiliary results were built only in the isolated task runtime as `N0005Bridge` and checked by `lean/N0005Check.lean`. All seven printed transitive axioms are exactly `[propext, Classical.choice, Quot.sound]`; there is no custom analytic axiom and no `sorryAx` in the built auxiliary results. The failed full target has no accepted proof certificate. Source mapping and independent semantic review remain separate parent obligations.

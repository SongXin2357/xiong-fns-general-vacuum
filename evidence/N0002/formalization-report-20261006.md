# N0002 formalization report — 2026-10-06

Status: exact registered theorem passed an actual Lean kernel build and separate type/axiom print. Promotion, independent semantic review, parent rerun, registry updates, and publication remain the parent task's responsibility. The FNS application remains a separate obligation.

## Frozen source and entry point

* Primary source: `lean/FNSTree/N0002.lean`.
* Exact theorem: `FNSTree.N0002.zero_integral_of_distributional_divergence` (line 190).
* Separate root: `lean/N0002Check.lean`, importing `FNSTree.N0002`.
* Primary source SHA256: `5ff0beb59d15064127dcbad8f65123aaf9a4782c7cd9a429cc74d5fac1adc82d`.
* Separate root SHA256: `4369b9cbf8eeacdae551d99136f7af3e931e504f82e76a4ea5bb38c35a3675f3`.
* Independent paper proof: `notes/nodes/N0002/independent-proof-20261006.md`, SHA256 `b9d7f11342f65aa4f065a4f08e31c07c0b23af5b25100d774e7cd5bc8e108a2b`.
* N0001 source/root and portable lakefile were not edited. Build products use the separate local runtime `lean/local-runtime-n0002`; it must remain ignored.

## Actual successful runs

All commands used `/home/sx/xiong-agent/.elan/bin/lake`, with the installed `xiong_agent.child_env()` and the separate N0002 runtime. Full command, working directory, hashes, exit code, log, and source snapshot are retained under each prefix:

* `lean-20261006T132735.462060Z-build`: `lake build N0002Check`, exit 0, 8709 jobs, N0002 compiled and N0002Check imported it.
* `lean-20261006T132854.882082Z-print`: `lake env lean ../N0002Check.lean`, exit 0.
* `lean-20261006T132922.259771Z-version`: `lake env lean --version`, exit 0; actual version 4.33.1, commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`.

The locked Mathlib revision requested by the project is `0df444a360eaa60ab8c11dca51a86af692955474`. The driver reuses the existing dependency/cache location without modifying or relinking dependency sources; it records the expected revision rather than running Git. Parent should retain its independently established dependency identity in the final certificate.

Printed transitive axioms for the exact theorem, cutoff energy, annular support, convergence, and inner integrability are exactly `[propext, Classical.choice, Quot.sound]`. There is no `sorryAx` or custom analytic axiom. The passing build has one harmless unused-variable warning: positivity is unnecessary for the gradient chain-rule identity itself; it is essential and used for compact support, norm scaling, and energy cancellation downstream. Source is frozen without cosmetic edits.

## Analytic content actually proved

The theorem assumes only `Integrable f volume`, `MemLp V 2 volume`, and the actual distributional identity for every `ContDiff R infinity` compactly supported scalar test. It does not assume a tail bound, cutoff certificate, scalar proxy, PDE conclusion, or zero total momentum.

The source constructs a genuine `ContDiffBump` with radii 1 and 2, scales it by R inverse, proves smoothness/compact support/bound/inner value, derives its gradient by the Frechet chain rule, proves gradient compact support and square integrability, and proves the exact planar scaling identity by Haar-measure change of variables. It also proves gradient annular support, cutoff convergence, inner-product integrability and Cauchy–Schwarz, then derives the flux-tail inequality using the indicator of the actual Euclidean tail set. The final theorem applies N0001 to the verified tests and derived flux bound.

Default nonintegrable integrals are not used to obtain a false conclusion: both gradient energies have independent integrability proofs; gradient MemLp is built from those proofs; the flux has a separate integrability theorem; and tested f integrability is supplied by the N0001 bound mechanism.

## Relevant Mathlib APIs actually used

* `ContDiffBump.contDiff`, `.hasCompactSupport`, `.one_of_mem_closedBall`, `.zero_of_le_dist`, `.nonneg`, `.le_one`.
* `HasFDerivAt.comp`, `HasFDerivAt.const_smul`, `InnerProductSpace.toDual`, `toDual_gradient`, `Filter.EventuallyEq.gradient_eq`.
* `HasCompactSupport.fderiv`, `.comp_left`, `.comp_homeomorph`; `Continuous.integrable_of_hasCompactSupport`.
* `Measure.integral_comp_inv_smul_of_nonneg`, with `Module.finrank R Plane = 2` proved in the source.
* `memLp_two_iff_integrable_sq_norm`, `MemLp.integrable_norm_pow`, `MemLp.indicator`, `MemLp.integrable_mul`, `integral_mul_norm_le_Lp_mul_Lq`.
* Verified N0001 `zero_mean_from_cutoffs_and_flux_tails`.

Earlier failed API/elaboration attempts are preserved with their source snapshots and nonzero logs. They are not used as certification evidence. No extra agent or external private research run was opened by this worker. No Git operation or publication was performed.
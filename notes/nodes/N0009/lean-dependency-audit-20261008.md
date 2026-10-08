# N0009 exact-target Lean audit, 2026-10-08

Status: **OPEN; exact full target NOT_RUN; partial Lean bridges now built**.
This note is a formalization dependency audit, not a proof certificate. No
`sorry`, custom axiom, assumed PDE estimate, abstract virial wrapper, or proof
of an easier theorem is counted as N0009. The post-audit bridge result is
recorded in [the progress report](lean-bridge-progress-20261008.md).

The pinned environment exists: Lean 4.33.1 through the installed
xiong-agent toolchain, Mathlib commit
`0df444a360eaa60ab8c11dca51a86af692955474`. The dependency tree was read
without modification. Its `Mathlib/Analysis/Distribution/Sobolev.lean`
defines Fourier/Bessel-potential Sobolev spaces; its
`Mathlib/Dynamics/Flow.lean` defines continuous monoid-action flows. Neither
module, by its documented interface alone, is a certificate for the
Caratheodory bi-Lipschitz flow of a time-integrable Lipschitz velocity or for
the Wang-v3 conservative PDE with its exact Bochner and trace class.

The entire exact target would need the following object-level bridges in one
checked import closure, with the original quantifiers and source class:

1. Encode all of v3 (1.1), (1.3) and (1.5)–(1.8), including the natural
   distributional meaning of `u_t`, nonnegative temperature, positive mass,
   strict allowed viscosity subcase, and conservative initial traces. Prove
   non-vacuity through the smooth compatible family.
2. Derive the time-dependent bi-Lipschitz flow and continuity-equation
   transport formula from the displayed regularity, with one common spatial
   and temporal representative. Obtain an open spacetime vacuum set.
3. Slice the thermal equation on a common full-measure time set. Prove the
   two-dimensional exterior nonnegative superharmonic `L^p` lemma, strict
   dissipation rigidity, and fixed support of density, velocity and
   temperature.
4. Recover the *actual* unweighted `u_t` from `∂t∇u∈L²` after fixed support
   by time convolution and Poincare, without a density lower bound. Identify
   the initial kinetic trace from conservative momentum.
5. Justify the kinetic and internal energy equalities, including the
   conservative thermal trace and every cutoff/product limit.
6. Derive the exact virial identity and quadratic lower bound, then the
   contradiction with the fixed-support upper bound.
7. Compile the full theorem and witness family, inspect the elaborated types
   and transitive axioms, perform independent semantic review, then publish
   source/build logs and read the remote GitHub commit back.

The new `lean/FNSTree/N0009.lean` verifies the finite-dimensional strict
viscosity algebra, fixed-support moment integrability and upper bound, and
the finite-interval integrated virial growth and conditional scalar
contradiction. It does **not** derive the hypotheses of those theorems from
the exact Wang-v3 PDE class, and it does not construct the compatible witness
family. The classical-derivative variants in the file assume two-sided
`HasDerivAt` at time zero and cannot be used as a source-class bridge without
additional justification; the integrated variants avoid that mismatch but
still assume the integral representations. Prior verified N0001/N0002 do not
imply the missing PDE hypotheses. The source's initial-condition topology and
construction of the displayed regularity are also not independently
certified by the supplied PDF pages. Accordingly N0009 stays without an
exact-target certificate, promotion, or descendants. The user's original
universal global-existence claim cannot be promoted while a compatible
strict-viscosity compact-support obstruction remains on the table.

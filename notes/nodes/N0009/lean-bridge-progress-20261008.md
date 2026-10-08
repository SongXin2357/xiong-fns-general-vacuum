# N0009 partial Lean bridge, 2026-10-08

**Gate: OPEN. Exact full-target Lean: NOT_RUN. No child node is eligible.**
This file records checked auxiliary mathematics, not a certificate for a
Wang-v3 solution or for the registered N0009 obstruction. The preregistered
target remains [unchanged](statement.md).

The single N0009 source module is [`lean/FNSTree/N0009.lean`](../../../lean/FNSTree/N0009.lean).
It was built with Lean 4.33.1 and Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`; the direct Lean log with
complete displayed theorem types and transitive axioms is
[`evidence/N0009/lean/n0009-bridge-direct.log`](../../../evidence/N0009/lean/n0009-bridge-direct.log).
The [Lake build log](../../../evidence/N0009/lean/n0009-bridge-build.log)
exits zero. Each displayed theorem has only `propext`, `Classical.choice`,
and `Quot.sound`; there is no `sorryAx`. The source contains no `sorry`,
`admit`, or new `axiom` declaration.

The checked statements cover these **conditional** bridges:

1. `strict_viscosity_dissipation_nonneg` and
   `strict_viscosity_dissipation_rigidity` prove the exact two-dimensional
   quadratic-form decomposition for a symmetric strain matrix. Strict
   `mu+lambda>0` is used for rigidity. The theorem does not identify its
   scalar inputs with the PDE's distributional strain on exterior vacuum.
2. `fixed_support_moment_integrable` derives integrability of
   `rho(x)|x|^2` from `rho` integrable and support in the **origin-centered**
   radius-`b` ball. `fixed_support_moment_bound` adds nonnegative density and
   proves `I<=b^2 int rho`. Fixed support and mass conservation are premises
   to be established from the source solution; an arbitrary translated ball
   does not give this unshifted numerical bound.
3. `quadratic_growth_from_integrated_virial` works on `0<=t<T` and assumes
   the two time-integral representations, their integrability, and an almost
   everywhere lower bound for the virial production. It yields
   `I(t)>=I(0)+2J(0)t+c t^2`. Thus `c=2 beta E_0` has the target coefficient.
   `no_global_integrated_virial_profile` combines the same conditional
   assumptions on every finite interval with a uniform moment bound to get
   `False`. The scalar conclusions are mathematically nonvacuous as
   implications; they do not assert the PDE supplies their assumptions.

The module also contains a classical-derivative version. The installed
xiong-agent's [independent semantic audit](../../../evidence/N0009/n0009-lean-bridge-audit-r01/result.md)
correctly noted that `HasDerivAt` at zero is two-sided and everywhere
classical differentiability is stronger than an almost-everywhere PDE
identity. That audit examined an earlier module snapshot. The subsequent
integrated variant removes this temporal interface mismatch at the scalar
stage; it does not resolve the upstream PDE bridge.

**First missing full-target implication.** No Lean theorem currently maps
the exact Wang-v3 strong-solution class and conservative equations to a
common transported open vacuum, fixed support, energy conservation, the
integrated virial identities, and their initial traces. In particular, the
exterior nonnegative superharmonic `L^p` lemma, common full-measure time
selection, strict strain-to-rigid-field passage, recovery of actual `u_t`,
and every conservative product/cutoff limit remain paper arguments. The
smooth fixed-positive-mass compatible small-energy family is also not in
Lean. An exact-target theorem and witness cannot be claimed from the present
types. The source-semantic interpretation of the initial conservative trace
and the endpoint `mu+lambda=0` remain separate questions.

Next legitimate work is to formalize the source class and one of the missing
PDE-to-integral implications **inside N0009**, then rebuild and review the
entire import closure. No verified descendant may be created before the
exact target passes the project gate and GitHub readback.

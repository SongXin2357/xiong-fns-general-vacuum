# N0008 — Wang-v3 final-solution momentum-source application

Preregistered 2026-10-08 before new derivation. Parent: N0002, whose exact
current publication gate passed. Explicit additional mathematical dependencies:
none. Status: EXPLORING; exact full-target Lean NOT_RUN; no certificate or
descendants. This is a sibling of the Wang-v1 N0007 route, not its child.

## Exact source and hypotheses

Source: the user-supplied 36-page Wang arXiv:2212.13343v3 PDF, SHA-256
3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a.
Use the conservative system (1.1) (PDF p.1), Definition 1.1 and Theorem 1.1
(1.5)-(1.8) (PDF p.3), and the final solution obtained by the source's
two-level approximation (whole-space limit, PDF p.34; vanishing damping,
PDF p.20). The analogous Wang-v1 node remains N0007 and is not promoted.

Let mu>0, mu+lambda>=0, R,c_v,kappa>0, a>1, q>2, eta_0>0 and
alpha=min(a/2,1). Take every initial datum allowed by Wang-v3 Theorem 1.1:
nonnegative density and temperature, weighted density in L1∩H1∩W1q,
sqrt(rho_0)u_0 and sqrt(rho_0)theta_0 in L2, grad u_0 in H1, grad theta_0
in L2, and the displayed compatibility equation with g in L2. Let
(rho,u,theta) be the resulting local final strong solution in precisely its
(1.7)-(1.8) class on R2×(0,T*). This quantifies over zero as well as positive
total initial mass and allows compactly supported density. No pointwise
positive-density lower bound, added moment, zero momentum, small high norm,
extra far-field condition, or stronger time regularity may be assumed.

## Exact mathematical conclusion

For every finite 0<T<T*, prove the existence of a single locally integrable
vector function U on R2×(0,T) which is the distributional time derivative
partial_t u and whose weighted product sqrt(rho)U and spatial weak gradient
grad_x U are the *same* two quantities listed as sqrt(rho)u_t and grad u_t
in Wang-v3 (1.7). This identification must be obtained from the source's
actual solution meaning and/or justified passage through both approximation
levels; it is part of the target, not a new hypothesis.

Prove that there is one null set E⊂(0,T), independent of the component and
test function, such that for every t outside E and each i∈{1,2}, with
P=R rho theta, d=div u,

    f_i = rho (U_i + u·grad u_i),
    (V_i)_j = mu partial_j u_i + (mu+lambda)d delta_ij - P delta_ij,

the spatial fields satisfy f_i∈L1(R2), V_i∈L2(R2;R2), and

    integral f_i phi dx = - integral V_i·grad phi dx

for every real compactly supported smooth phi. Then apply the *exact*
published N0002 result to conclude integral f_i dx = 0 for both components
at every time outside E. The conclusion is almost-everywhere in time,
not an all-time identity, and it gives no global-existence or continuation
estimate by itself.

## Predeclared proof obligations and non-vacuity

Separate the zero-total-mass case from the positive-mass case. For positive
mass, derive a fixed-ball positive mass anchor from continuity and L1
continuity, then justify uniform local coercivity for the *smooth
approximants* and identify a common U after r→infinity and delta→0.
Do not use Wang-v3 Lemma 2.4 on the final U before its H1_loc premise
has been proved. Establish density and pressure bounds, weak temporal and
spatial product rules, the conservative-to-material equation, a common
time exceptional set, and extension from a countable test family to all
compact smooth tests. The approximate cancellation calculation on PDF
pp.10-11 is only source context, not a certificate for the final solution.

The data class is nonempty: choose nonzero smooth compactly supported
rho_0≥0 and u_0=theta_0=g=0. This witness does not restrict the theorem's
quantifier. Any route requiring a stronger hypothesis remains conditional
and cannot pass this node. Full Lean type/build/axiom and independent
semantic checks are required before any descendant may be registered.

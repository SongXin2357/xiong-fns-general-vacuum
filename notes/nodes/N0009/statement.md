# N0009 — Wang-v3 compact-support obstruction (immutable preregistration)

Registered 2026-10-08 before the v3-specific derivation and agent audit.
Parent: administrative ROOT. No mathematical dependencies: in particular, the
open Wang-v1 N0006 is historical motivation, **not** an imported lemma.
Status: EXPLORING; exact full-target Lean NOT_RUN; no certificate or child.

## Exact source, parameters, and scope

User-supplied Xue Wang arXiv:2212.13343v3, 36-page PDF, SHA-256
`3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a`.
Use its conservative (1.1), viscosity (1.2), conservative initial traces (1.3),
Definition 1.1 and Theorem 1.1 (1.5)-(1.8), PDF pp.1-3.

Fix `mu>0`, `mu+lambda>0` (an allowed strict subcase of (1.2)),
`R,c_v,kappa>0`, `a>1`, `q>2`, and `eta_0>0`; let
`alpha=min(a/2,1)`, `q_1=4/alpha`, `q_2=6/(2alpha-1)` as in v3.
Take smooth nonnegative initial data satisfying the *exact* v3 (1.5)-(1.6),
with `rho_0` compactly supported, `M=int rho_0>0`, and physical energy
`E_0=int (rho_0 |u_0|^2/2 + c_v rho_0 theta_0)>0`.
No lower bound on rho, zero total momentum, added moment for all data,
small high norm, stronger far field, or new solution class may be assumed.

## Exact candidate conclusion to prove or refute

There is no global-in-time strong solution of Wang-v3 (1.1), (1.3)-(1.4)
which belongs to the **whole** v3 (1.7)-(1.8) class on every finite
interval. More quantitatively, if such a solution exists on `(0,T)`,
prove, for `0<=t<T`, with `B_b` any closed ball containing `supp rho_0`,

    I_0 + 2 J_0 t + 2 beta E_0 t^2 <= I(t) <= M b^2,
    I(t)=int rho(t,x)|x|^2 dx,
    J_0=int rho_0 u_0 dot x dx,  beta=min(1,R/c_v)>0.

Also construct a fixed-positive-mass smooth compatible family with all v3
initial norms uniformly bounded, positive physical energies tending to zero,
and compactly supported density. A verified obstruction for this allowed
strict-viscosity subcase would refute a universal global-existence theorem
quantified over every datum in the user's original general-density class.
It would **not** prove that the v3 local construction is source-faithful or
independently construct a finite-time singular solution.

## Obligations before any promotion

Audit the v3 source against every regularity, sign, trace and viscosity
property used in the exterior-vacuum, superharmonic-temperature, rigid-velocity,
fixed-support, energy, virial and initial-trace steps. Derive the v3 argument
independently; do not cite N0006 as proved. Check the `mu+lambda=0` endpoint
separately and do not promote the strict argument to it. Use the installed
xiong-agent for blind reconstruction and adversarial review. The **entire**
exact target, including source-class mapping and witness family, needs an
actual locked Lean build, complete theorem type, transitive axioms, semantic
review and GitHub readback before this node can pass or have descendants.
A mathematical counterexample to the candidate must be recorded with the
precise first failed implication; no partial lemma certifies this statement.

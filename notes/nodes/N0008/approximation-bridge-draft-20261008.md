# N0008 paper-level bridge attempt: identify the final time derivative

Date: 2026-10-08. Status: DRAFT, NOT A LEAN CERTIFICATE. This is an
independent reconstruction for the preregistered Wang-v3 exact target.
Source: user-supplied arXiv:2212.13343v3 PDF, SHA-256
3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a.
The v3 estimates quoted below still require exact source-fidelity and Lean
formalization; the paper's words "standard compactness arguments" are not a
proof of this passage.

## Positive total mass: a candidate two-level passage

Write m_0=integral rho_0>0 and w=bar x^a. If a source estimate was stated
after normalizing mass to one, the transformation

    tilde rho(x,t)=m_0 rho(m_0 x,m_0 t),
    tilde u(x,t)=u(m_0 x,m_0 t),
    tilde theta(x,t)=theta(m_0 x,m_0 t)

preserves the undamped full equations and makes integral tilde rho_0=1.
For the damped approximate system, tilde delta=m_0^2 delta. The compatibility
datum transforms as tilde g(x)=m_0^(3/2) g(m_0 x). Thus normalization can
address each fixed m_0>0, with constants allowed to depend on m_0; it cannot
address m_0=0. The weighted data class remains finite after this fixed
spatial scaling. Every source estimate used below still needs its precise
parameter and common-time applicability checked.

At either approximation level, index the smooth approximants by n.
The proposed input bounds on a common interval (0,T), T<T*, are

    0<=rho_n<=K,  integral rho_n(t)>=m_0/2,
    sup_t integral w rho_n<=C_w,
    ||sqrt(rho_n) partial_t u_n||_(L-infinity_t L2_x)<=C,
    ||grad partial_t u_n||_(L2_t L2_x)<=C,
    ||grad u_n||_(L-infinity_t H1_x)
       +||sqrt(rho_n)u_n||_(L-infinity_t L2_x)<=C,
    ||rho_n||_(L-infinity_t W1q_x)<=C, q>2.

The source claims the r-uniform fixed-delta estimates in Proposition 5.1
(PDF p.30) and the delta-uniform estimates in Proposition 3.1 (PDF p.8);
their hypotheses and transformations must be audited, not merely cited.
On B_r, mass conservation uses u_n=0 on the boundary; on R2 it uses a
spatial cutoff and rho_n u_n in L1. Since w(x) tends to infinity, choose
N so that C_w / inf_{|x|>=N} w(x)<m_0/4. Then, for large n and every t,

    integral_(B_N) rho_n(t)>=m_0/4=:c>0.

This derives the fixed-ball anchor from the source's weighted density
estimate rather than adding a positive-density assumption.

For any L, set D=B_max(L,N), and let c_n(t) be the average of
v_n=partial_t u_n over D. The approximants are smooth, so ordinary
Poincare gives ||v_n-c_n||_(L2(D))<=C_D||grad v_n||_(L2(D)).
The mass anchor and 0<=rho_n<=K imply

    c |c_n(t)|^2
      <=2||sqrt(rho_n)v_n||_2^2
        +2K C_D^2||grad v_n||_(L2(D))^2.

Hence ||partial_t u_n||_(L2(0,T;H1(B_L))) is bounded independently of n.
The same argument for u_n, with grad u_n in L-infinity_t H1_x,
gives a uniform L-infinity_t H2(B_L) bound. This coercivity is used only
on smooth approximants; it does not assume H1_loc of the final u_t.

Extract a diagonal subsequence over integer L. Local Aubin-Lions
compactness gives u_n->u strongly in L2(0,T;H1(B_L)), while
partial_t u_n weakly converges to U in L2(0,T;H1(B_L)). Testing against
compact space-time functions and integrating by parts in time identifies
U=partial_t u as a distribution; overlap uniqueness gives one global
locally square-integrable representative. Weak spatial integration by
parts identifies grad U with the limit of grad partial_t u_n.

The continuity equation yields
rho_{n,t}=-u_n·grad rho_n-rho_n div u_n. The local H2 bound gives
u_n in L-infinity_t L-infinity_x(B_L), and the stated W1q/H1 bounds
give rho_{n,t} bounded in L2_t Lq_x(B_L). The compact embedding
W1q(B_L) into Lq(B_L), together with the time derivative bound,
gives rho_n->rho strongly in local L2_tLq_x. Thus
sqrt(rho_n)->sqrt(rho) strongly in local L2 space-time by
|sqrt(a)-sqrt(b)|^2<=|a-b|. A global weak-star subsequence of
sqrt(rho_n) partial_t u_n exists in L-infinity_tL2_x. For any bounded
compact space-time test psi,

    integral sqrt(rho_n) partial_t u_n psi
      = integral partial_t u_n (sqrt(rho_n) psi)
      -> integral U sqrt(rho) psi.

Consequently that weak-star limit is sqrt(rho)U, and the global
weighted bound passes by lower semicontinuity. Perform this argument
first for r->infinity at fixed delta and then for delta->0, using the
delta-uniform estimates. The second-level approximants already have
the genuine local time derivative furnished by the first-level passage.

Once U is identified, the source's final bounds give rho U_i and
rho u·grad u_i in L-infinity_t L1_x, and P=R rho theta and the stress row
V_i in L-infinity_t L2_x. Locally rho_t and U are functions in the
spaces above, so temporal and spatial Sobolev product rules yield

    partial_t(rho u_i)+div(rho u_i u)
      =rho(U_i+u·grad u_i)
         +u_i(rho_t+div(rho u))
      =rho(U_i+u·grad u_i)

in distributions. The conservative momentum equation gives
f_i=div V_i in space-time. Use one countable C1-dense family of
compact spatial tests on each integer ball and both components,
then extend by L1/L2 continuity, to obtain one exceptional time
set independent of test and component. The exact N0002 statement
then yields integral f_i=0 at each remaining time.

## Zero total mass: separate direct route

The source's fixed positive mass normalization on PDF pp.19 and 33 cannot
cover rho_0=0. Indeed its p.33 approximants cannot both converge to zero
in weighted L1 and retain a fixed positive mass in a fixed ball. This is
a source-proof coverage gap, not by itself a counterexample to the
displayed Theorem 1.1.

For any final solution in the displayed class, cutoff testing of
continuity and the bound ||rho u||_1<=||sqrt(rho)||_2
||sqrt(rho)u||_2 show that total mass is conserved. If m_0=0 and
rho>=0, then rho=0 almost everywhere. Momentum becomes the homogeneous
Lamé equation. Since mu>0 and 2mu+lambda>0, its Fourier symbol is
invertible off frequency zero. For almost every t, u(t) is an L^{q1}
solution and therefore zero; the distributional U=partial_t u is zero.
The heat equation then gives Delta theta=0, and theta(t) in L^{q2}
forces theta=0. Conversely (rho,u,theta)=(0,0,0) satisfies the
conservative system, weighted initial traces (rho_0,rho_0u_0,
rho_0theta_0)=(0,0,0), far-field condition, and all listed bounds
for any allowed zero-density datum. This is a direct construction,
not the p.33 approximation.

## Open checks before promotion

1. Confirm all five uniform approximation estimates, the weighted
   density bound, and a common interval at both levels under exactly
   the v3 hypotheses. Track dependence on m_0 and delta; do not
   substitute a fixed lower bound m_0>=1/2.
2. Reconstruct the local compactness and product-rule limits in full;
   source pp.20 and 34 omit them. Check the zero-mass initial-trace
   interpretation if an unweighted u_0 or theta_0 trace is intended.
3. Independently red-team the scaling, zero-mass Lamé/Lp argument,
   cutoff boundary terms, common null set, and exact N0002 match.
4. Formalize the entire N0008 target in locked Lean, including
   approximation-to-U identification and the source-class mapping.
   No exact-target Lean theorem has been built. The node remains OPEN;
   no child may descend from it.

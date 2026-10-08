# N0008 direct momentum-anchor reconstruction and remaining source gate

Date: 2026-10-08. Status: proved-draft **conditional analytic bridge** after
an independent nonblind xiong-agent red-team; exact N0008 remains OPEN and its
full-target Lean verification has NOT_RUN. This note does not replace the
immutable [statement](statement.md) or certify Wang-v3's omitted continuation.

## Source facts checked against the supplied Wang-v3 PDF

The PDF has SHA-256
`3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a`.
Its p.1 (1.1) is conservative. P.2 (1.3) gives the initial trace of
`(rho,rho u,rho theta)`, not a separate unweighted `u_0` or `theta_0` trace.
P.3 Definition 1.1 calls a solution strong when the derivatives *in (1.1)*
are regular distributions and the conservative equations hold a.e. Thus the
definition alone does not explicitly construct an unweighted `u_t`. Theorem
1.1 (1.7) additionally displays `sqrt(rho)u_t` and `grad u_t`.

P.5 (2.1) has damping `+delta theta` only in the thermal equation. The
positive-mass scaling in the earlier [approximation draft]
(approximation-bridge-draft-20261008.md) is correct, including
`tilde delta=m_0^2 delta`; the p.2 conservative initial trace also confirms
the direct zero solution is admissible when `rho_0=0`. P.6 (2.8) lists the
analogous damped-solution derivatives. Pp.30-34 Proposition 5.1 and Lemma
2.2 give a radius-independent first-level interval `T_delta`, depending on
delta. Pp.8-9 and 17 Proposition 3.1 claim a delta-independent `T*` for
the whole-space damped solutions and mention a "standard extension method"
when `T_delta*<T_1`; p.20 then uses `T*` for `delta -> 0`. The supplied text
does not expand that continuation or the final derivative-product limit.
The first-level ball compactness argument therefore cannot simply be run on
all of `(0,T*)`.

## A direct positive-mass lemma on an already existing final interval

Assume the *actual* final conservative equations, the bounds in (1.7),
`m_0=int rho_0>0`, and the independently meaningful distribution identity
`partial_t grad u=G in L2((0,T) x R2)`. The latter is the natural reading of
the displayed `grad u_t` bound; it must not be replaced by an unrelated
weak-limit label. Then a unique distributional time derivative
`U=partial_t u` belongs to `L2(0,T;H1(B))` for every bounded ball B, and
`grad U=G`. This conclusion does not use the unidentified weighted field.

Here is the complete paper-level argument. On every fixed ball B, the
finite `L^q1(R2)` bound on u and the global `grad u in H1` bound imply
`u in L-infinity_t H2(B)`, hence `u in L-infinity_t L-infinity(B)` in two
dimensions. Since `rho in L-infinity_t W1q` with q>2, the conservative
continuity equation gives

    rho_t = -u dot grad rho - rho div u
           in L-infinity(0,T;L2(B)).

Let `V_B` be the mean-zero `H1(B)` space. By ordinary Poincare,
`grad:V_B -> L2(B)` has closed range and a bounded inverse on its range.
Integrate `partial_t grad u=G` in time and apply this inverse to obtain
`w in W1,2(0,T;H1(B))` with `grad w=grad u` and `grad w_t=G`.
Consequently `u=w+c(t)` on B for some spatially constant vector
`c in L-infinity(0,T)`; its time regularity is the only missing part.

Choose a nonnegative smooth cutoff `phi` supported inside B and put

    a(t)=int rho phi,  m_i(t)=int rho u_i phi,
    b_i(t)=int rho w_i phi.

The density equation gives `a in W1,infinity(0,T)`. The conservative
momentum equation gives

    m_i' = int rho u_i u dot grad phi
           -mu int grad u_i dot grad phi
           -(mu+lambda) int (div u) partial_i phi
           +int P partial_i phi,

with `m_i in W1,infinity(0,T)`. The convective term is integrable using
`sqrt(rho)u in L-infinity_t L2`; the pressure term obeys
`||rho theta||_1 <= ||sqrt(rho)||_2 ||sqrt(rho)theta||_2`.
The Bochner product rule for
`rho in W1,infinity_t L2(B)` and `w in W1,2_t L2(B)` gives

    b_i' = int rho_t w_i phi + int rho w_{i,t} phi in L2(0,T).

The positive mass and density initial trace give a single cutoff with
`a(t)>=c_0>0` throughout the finite interval. Explicitly, choose a large
cutoff `chi_R` whose initial mass exceeds `m_0/2`; the continuity equation
and `||rho u||_1 <= ||sqrt(rho)||_2 ||sqrt(rho)u||_2` imply

    |a_R(t)-a_R(0)| <= C T R^-1
      sup_t ||sqrt(rho)||_2 sup_t ||sqrt(rho)u||_2.

Increase R so this is less than `m_0/4`, and choose B containing both its
support and the original compact region. Since `m_i=b_i+a c_i`, the quotient
rule yields `c_i=(m_i-b_i)/a in W1,2(0,T)`. Thus `U=w_t+c'` is in
`L2_t H1(B)`. Distributional uniqueness patches the constructions on
larger balls. This avoids applying Wang's Lemma 2.4 to an unidentified
final derivative. The independent red-team found no invalid analytic step
under these stated assumptions.

## What this does and does not identify

If the theorem's notation `sqrt(rho)u_t` means the weighted **actual**
distributional derivative, the lemma constructs that derivative without
circularity; the source's displayed bound then applies to `sqrt(rho)U`.
If instead the notation names a separately extracted weak-limit field W,
the lemma alone proves neither `W=sqrt(rho)U` nor the global
`L-infinity_t L2_x` bound on `sqrt(rho)U`. Equality of `rho U` and
`sqrt(rho) W` does not determine W on vacuum. A sufficient sequence-level
repair is local weak convergence of the genuine `u_{n,t}` to U plus local
strong convergence of `sqrt(rho_n)` and a global weak-star bound on
`sqrt(rho_n)u_{n,t}`. The earlier approximation draft derives this
conditionally on a common interval. At the second level, Proposition 3.1
claims such an interval, but the first-level continuation and the exact
field-identification step are not written out in the source excerpts.

Once `sqrt(rho)U in L-infinity_tL2_x` is established, the rest of N0008
has the conditional proof in the approximation draft and independent
red-team review: `f_i in L1`, stress row `V_i in L2`, the local temporal
and spatial product rules, one countable common time-null set, and the
exact N0002 divergence lemma. N0002's *current* certificate and
`can-extend` gate passed; a historical `statement.md` registration line
saying Lean NOT_RUN is not its current status. None of this promotes N0008.

For zero total mass, mass conservation and nonnegativity imply `rho=0`.
The conservative momentum equation reduces to homogeneous Lame. Under
`mu>0, mu+lambda>=0`, its Fourier symbol is invertible off zero, and
`u(t) in L^q1(R2)` forces `u=0` a.e. The thermal equation then gives
`theta=0` using finite `L^q2`. The zero triple satisfies the **displayed
conservative** initial trace for any allowed zero-density datum. The
source's p.33 positive-mass approximation does not construct it, so this
is a separate direct argument; source construction coverage must not be
claimed from p.33.

## A failed shortcut, retained as evidence

The two bounds `u in L-infinity_t L^p(R2)` and
`partial_t grad u in L2_tL2_x` alone do **not** give `u_t in L1_loc`.
An independently checked counterexample uses logarithmic cutoffs
`f_R=1` on `B_1`, `f_R=log(R/|x|)/log R` on `1<|x|<R`, and zero outside.
They have `||grad f_R||_2^2=2pi/log R` and
`||f_R||_p <= C_p R^(2/p)`. Put consecutive triangular time pulses of
amplitude `a_n=1/(n log n)`, spatial radius `R_n=a_n^(-p/4)`, and time
length `ell_n=c a_n/sqrt(log R_n)`, accumulating at an interior time.
Then the global Lp supremum and `L2_tL2_x` gradient-derivative energy
are finite, while spatial averaging on `B_1` has infinite local time
variation (`sum a_n=infinity`). The profile is not globally H2; this
counterexample refutes precisely the two-norm shortcut, not the full
Wang class or the momentum-anchor lemma.

## Gate

Exact N0008 full-target Lean: NOT_RUN. No semantic certificate, no child,
no global theorem. Remaining first obligations are to establish the
source-level meaning/identification of its weighted derivative on the
common final interval and to formalize the **entire** N0008 statement
in locked Lean without adding that identification as a premise.

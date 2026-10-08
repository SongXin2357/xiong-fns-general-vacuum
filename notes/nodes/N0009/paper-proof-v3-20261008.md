# N0009 paper reconstruction in the Wang-v3 class

Date: 2026-10-08. Status: **paper proof draft**, independently blind-reconstructed
and adversarially reviewed. It is **not** a Lean proof, source-construction
certificate, or authorization to extend N0009. The source-scope comparison is
[separate](../../source-fidelity/wang-v3-compact-obstruction-matrix-20261008.md).
The exact target is the immutable [statement](statement.md). In that statement
`B_b` has its standard origin-centered meaning `{x: |x|<=b}`. If one instead
reads “any closed ball” as permitting arbitrary centers while retaining the
origin-centered moment `I=int rho |x|^2`, the numerical bound `I<=Mb^2` is
false already at time zero after translating the density. That alternative
reading is explicitly rejected; no such bound is claimed.

Write `d=div u`, `S=2mu D(u)+lambda d Id`, `Q=S:grad u` and
`P=R rho theta`. Let a putative Wang-v3 solution exist on every finite
interval and satisfy the complete (1.7)-(1.8) class. Assume for contradiction
that `rho_0` is supported in `B_b`, has mass `M>0`, and has physical energy
`E_0>0`; use only the allowed strict subcase `mu+lambda>0`.

## 1. Flow and open spacetime vacuum

On each finite `(0,T)`, `alpha=min(a/2,1)>1/2`, so the source's velocity
exponent `q_1=4/alpha` is finite. The local planar `H2 -> L-infinity`
embedding on unit balls, together with `u in L-infinity_t L^{q_1}_x` and
`grad u in L-infinity_t H1_x`, gives a global `L-infinity_t L-infinity_x`
bound for u. Since `grad u in L2_t W1q_x`, `q>2`, the embedding
`W1q(R2) -> L-infinity(R2)` gives

    int_0^T (||u(t)||_infinity+||grad u(t)||_infinity) dt < infinity.

The Caratheodory flow `X_t=u(t,X)`, `X(0,y)=y`, is therefore defined for
every y and t, spatially bi-Lipschitz with inverse, and has bounded
displacement on every finite interval. In particular, the transported
exterior `Omega_t=X(t,R2\B_b)` is connected, open, unbounded, and contains
`R2\B_{b+D_T}`, where `D_T=int_0^T ||u||_infinity dt`.

The continuity equation and `rho in C_tW1q_x` give, along this flow,

    rho(t,X(t,y)) = rho_0(y)
       exp(-int_0^t d(s,X(s,y)) ds).

One justification is to mollify rho in space. The transport commutator
converges in `L1_tLq_loc` because `u in L1_tW1,infinity_x` and
`rho in C_tW1q_x`; the `d rho` commutator converges by strong local
translation continuity and is dominated by `||d||_infinity||rho||_q`.
Integrating the mollified equation along the bi-Lipschitz flow and
passing to the limit gives the identity for a.e. y. Both sides have
continuous spatial representatives (`W1q` with q>2), so it holds for
every y and t. It follows that rho=0 on the **open spacetime set**

    O={(t,X(t,y)):0<t<T, |y|>b}.

This open-set assertion is essential: a time derivative of `rho theta`
cannot be discarded solely from a zero-density time slice.

## 2. Exterior temperature and velocity vanish

On O the conservative mass, momentum and thermal density products vanish
as distributions. The thermal equation gives `-kappa Delta theta=Q` there.
In two dimensions,

    Q=2mu |D(u)-d Id/2|^2+(mu+lambda)d^2 >=0.

Use countably many rational spacetime boxes compactly contained in O,
and on each box a countable dense set of spatial tests. Fubini and density
supply **one** full-measure time set on which, simultaneously with all the
source spatial bounds, `-kappa Delta theta(t)=Q(t)` on all of `Omega_t`.
The source has `grad theta in L2_tH1_x` and `theta in L2_tL^{q_2}_x`
with finite `q_2=6/(2alpha-1)`. Hence at every such time
`theta(t) in H2_loc cap L^{q_2}` and has a continuous representative.

Here is the needed planar exterior lemma. If `h>=0` is continuous on a
connected open set containing a full exterior region, `h in L^p` for
`1<=p<infinity`, and `-Delta h>=0` distributionally, then h=0. On the exterior,
let `m(r)` be its circular mean and `F(s)=m(e^s)`. The polar Laplacian,
first for mollifications and then in distributions, gives `F''<=0`.
A nonnegative concave function on a right half-line is nondecreasing:
a negative secant slope would eventually make it negative. Jensen gives

    2pi int_A^infinity m(r)^p r dr
      <= int_{|x|>A} h(x)^p dx < infinity.

A nonnegative nondecreasing m satisfying this must be zero. Then h=0
on the exterior by nonnegativity and continuity. At any zero point of a
nonnegative superharmonic function, the local superharmonic mean inequality
forces it to vanish on a neighborhood; the zero set is open and closed in
the connected domain. This proves h=0 throughout.

Apply the lemma to theta(t) on `Omega_t`. Thus theta=0 there and hence
Q=0 there. Strict `mu+lambda>0` and `mu>0` imply D(u)=0. The distributional
identity

    partial_j partial_k u_i
       =partial_j D_{ik}+partial_k D_{ij}-partial_i D_{jk}

then gives zero Hessian of u, so on connected `Omega_t` it is an affine
rigid motion `A(t)x+c(t)` with A skew. `Omega_t` contains an exterior
region, and a nonzero affine field there has infinite `L^{q_1}` norm.
Thus u=0 on `Omega_t` for the same full-measure time set. The spatial
representative is continuous, so this equality holds at **every point**
of `Omega_t` at each good time, not merely a.e. x.

For every exterior label y, `X(t,y)` remains in `Omega_t`, and therefore
`X_t(t,y)=u(t,X(t,y))=0` for a.e. t on the **same** good-time set, which
does not depend on y. Absolute continuity yields `X(t,y)=y` for all t.
The homeomorphism fixes the initial exterior and maps its complement
`B_b` to itself. Therefore rho(t) is supported in `B_b` for every t,
and u(t)=theta(t)=0 outside `B_b` for a.e. t. This is a fixed ball,
not a ball whose radius grows with T.

## 3. Recover the time derivative and initial kinetic trace

The source displays `grad u_t in L2(R2 x (0,T))`. Read this minimally as
the distribution identity `partial_t grad u=G in L2`; do not assume an
unweighted `u_t` function in advance. The fixed support of u now supplies
one. On any compact time subinterval, convolve u in time. The smooth-time
`u^epsilon` still vanishes outside `B_b`; its time derivative is in
`H1_0(B_{b+1})` and
`grad partial_t u^epsilon=G^epsilon`. Spatial Poincare gives

    ||partial_t u^epsilon||_{L2_tL2_x}
       <= C_b ||G^epsilon||_{L2_tL2_x}
       <= C_b ||G||_{L2((0,T)xR2)}.

Exhaust the interval, pass weakly, and identify the distributional limit.
This yields the **actual** `U=partial_tu in L2(0,T;H1(R2))`, with
`grad U=G`, without division by rho or use of a positive density lower
bound. Compact support and the source's spatial bounds also give
`u in L-infinity(0,T;H2(R2))`. Hence u has a strong H1 initial trace u*.

The source gives `rho in C([0,T];W1q cap L1)`, so rho(t) converges locally
uniformly to rho0, while u(t) converges strongly in H1 to u*. The
conservative momentum initial trace implies `rho0 u*=rho0 u0`
distributionally, hence a.e. This identifies the initial kinetic energy:

    lim_{t downarrow0} K(t)
      = (1/2)int rho0 |u*|^2
      = (1/2)int rho0 |u0|^2,
    K(t)=(1/2)int rho |u|^2.

The finite weighted initial norm makes the last integral meaningful even
if u0 is unspecified in vacuum. This route avoids the blind candidate's
compressed weighted material-flow chain rule; the red-team identified
that compression as its first substantial missing argument.

## 4. Energy equality and its initial value

Because rho is supported in B_b and `u in H1_tH1_x cap L-infinity_tH2_x`,
the continuity equation gives `rho_t in L2_tLq(B_b)`. Time-mollified
product rules in `L2(B_b)` justify differentiation of `rho|u|^2/2`.
Testing the conservative momentum equation by u and integrating in space
gives

    K' = -int Q + int P d.

For clarity, the time derivative of momentum contributes
`+(1/2)int rho_t|u|^2` beyond K', while the convection term contributes
`-(1/2)int rho_t|u|^2`; the two cancel;
`int div S dot u=-int S:grad u=-int Q`; and
`-int grad P dot u=int P d`. All products are integrable:
`Q in L1_{t,x}`, `P in L-infinity_tL2_x` from bounded rho and
`sqrt(rho)theta in L-infinity_tL2_x`, and `grad u in L-infinity_tL2_x`.
No unknown boundary condition on the support interface is used; the
global Sobolev functions are tested with a fixed cutoff equal to one on
a neighborhood of B_b.

The conservative thermal equation, tested with the same cutoff, gives
for `H(t)=c_v int rho theta`,

    H' = int Q - int P d.

The conductivity term vanishes because theta is zero outside B_b and
`<Delta theta,chi>=<theta,Delta chi>=0`; all other cutoff errors vanish
similarly. The right side is in L1_t, so H has an absolutely continuous
representative down to zero. Its value at zero is exactly
`c_v int rho0 theta0` by the conservative thermal initial trace. Thus

    E(t)=K(t)+H(t)=E0>0,

for the continuous energy representative, with `K,H>=0` because rho and
theta are nonnegative. No unweighted temperature initial trace is used.

## 5. Virial identity and obstruction

Define `I=int rho|x|^2` and `J=int rho u dot x`. Replace the unbounded
weights by compact smooth functions that agree with them on a
neighborhood of B_b. The conservative equations give

    I'=2J,
    J'=int rho|u|^2 + 2 int P - int tr S.

In two dimensions `tr S=2(mu+lambda)d`. Since u has fixed compact support
and is globally Sobolev, `int d=0`. Thus

    J'=2K+2(R/c_v)H,
    I''=4K+4(R/c_v)H >= 4 beta E0,
    beta=min(1,R/c_v)>0.

The conservative mass and momentum traces give `I(0)=I0` and `J(0)=J0`.
Integrating twice yields

    I0+2J0 t+2 beta E0 t^2 <= I(t) <= M b^2.

The upper bound follows from rho>=0, conserved mass M, and fixed
origin-centered support B_b. Since E0>0, the quadratic lower bound exceeds
M b^2 at finite t. Hence no global solution in the exact displayed v3
class exists for these data in the strict viscosity subcase. This does
not assert that the source's local-existence construction has been
independently verified.

## 6. Smooth small-energy witness and endpoint

Choose a nonnegative `psi in C_c^infinity(R2)` supported in the closed
unit ball, positive at every point of the open unit ball, and scaled so
`int psi^2=M` (for example a multiple of the standard flat radial bump). Put `rho0=psi^2`, `u0=0`, and choose a nonzero
nonnegative `phi in C_c^infinity(B_{1/2})`. For `0<epsilon<=1`, set
`theta0=epsilon phi` and

    g_epsilon=R epsilon(2 phi grad psi+psi grad phi).

Then `sqrt(rho0)g_epsilon=R grad(rho0 theta0)`, exactly the source's
compatibility equation. The density, velocity, weighted thermal, thermal
gradient and g norms in v3 (1.5)-(1.6) are uniformly bounded; the mass
is M and `E0=c_v epsilon int psi^2 phi>0` tends to zero. The witness
places no restriction on the theorem's general momentum quantifier.

At `mu+lambda=0`, the implication Q=0 -> D(u)=0 fails; the exterior field
`u=(x1,-x2)/|x|^2` has Q=0 and finite admissible exterior L^p norms.
This is only a counterexample to that implication, not a full-system
solution. N0009 makes no endpoint claim.

## Certificate boundary

The argument is a **paper draft**. The source's two-level construction
has not been independently shown to realize every displayed derivative.
The full flow/Bochner/distribution/elliptic chain has not been formalized
in locked Lean; no `#print axioms` or exact-target certificate exists.
N0009 remains OPEN with no descendants. If the v3 strong-solution
notation is read differently from its natural distributional meaning,
that source-semantic issue must be resolved before promoting the exact
Wang-v3 claim. The global *existence* target is contradicted by this
paper-level obstruction but is not marked formally refuted under the
user's Lean gate.

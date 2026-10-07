# Wang-v1 two-limit $u_t$ identification: corrected positive-mass draft

Date: 2026-10-07. Source: user-provided Wang-v1 PDF, SHA-256
a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d.
This reconstruction was revised after an independent installed xiong-agent
[source-limit audit](../../evidence/N0007/xiong-limit-r04/result.md).
The [pre-review snapshot](wang-v1-two-limit-ut-pre-review-20261007.md)
is preserved. This is not a Lean proof or a complete audit of Wang's
existence theorem. It addresses compatible $u_t$ representatives on the
**positive-total-mass** approximation branch.

## Source facts and exact limitations

PDF p.5 (2.7) gives classical $u_t^r$ on each finite approximation
ball. PDF p.5 Lemma 2.2 defines $\widetilde D^{1,2}$ as
$H^1_{\rm loc}$ with global $L^2$ gradient. PDF pp.5–6 Lemma 2.3
and (2.11) prove weighted local Poincare, but only for a function
already in that class. PDF p.7 defines $\psi$ with
$\sqrt\rho u_t$ and $\nabla u_t$; p.8 (3.5) bounds it uniformly
in ball radius $r$ for fixed damping. PDF p.9 (3.10) gives a
radius-uniform local-mass anchor on a sufficiently short interval.

PDF p.17 reports the $r\to\infty$ passage and (3.1), but leaves
identification of the limiting time derivative implicit. PDF p.18
(4.6) gives a damping-uniform local-mass anchor. PDF pp.17,21–22
(4.2) and the closed Proposition 4.1 bounds control the derivative
terms uniformly in $\delta$; Lemma 4.5 alone is only an intermediate
bootstrap inequality. PDF p.23 asserts the $\delta\to0$ limit
satisfies (1.8), using the phrase standard compactness arguments.

The estimates and anchors must hold on **one common interval**.
Equation (3.10) is conditional on kinetic-energy bound (3.8);
(4.6) likewise depends on its stated earlier bounds. The full
continuation of all ball and damped solutions to that interval is
asserted in the paper's Proposition 3.1 / Proposition 4.1 proof,
but not expanded in the excerpts audited by the independent agent.
The steps below accept a common interval only where those source
assertions and their hypotheses apply.

## Uniform mass anchor, with no added density lower bound

Let $\chi_N=1$ on $B_N$, supported in $B_{2N}$, with
$\|\nabla\chi_N\|_\infty\le C/N$. If nonnegative $\rho$ obeys
continuity, total mass at most $M$, and
$\sup_t\|\sqrt\rho\,u\|_2\le U$, then
$$
\left|\int\rho(t)\chi_N-\int\rho(0)\chi_N\right|
 \le \frac{C}{N}\int_0^t\int\rho|u|
 \le \frac{C}{N}M^{1/2}Ut.
$$
An initial cutoff mass at least $1/2$ therefore gives a fixed
positive mass in $B_{2N}$ for
$t\le N/(4CM^{1/2}U)$. For finite approximation balls take the
cutoff inside $B_r$. This recovers the mechanism of (3.10) and
(4.6), once the kinetic bound and common lifespan are fixed.
No pointwise positive density lower bound is assumed.

## First limit: expanding balls, fixed damping

Fix $\delta$, a common interval $(0,\tau)$ satisfying (3.5) and
the anchor, and a compact $K$. Enlarge $K$ and the anchor ball into
one fixed ball $B_L$. The proof of (2.11), with its average over
$B_L$, gives for classical $w=u_t^r$ and $w=u^r$:
$$
\|w\|_{L^2(B_L)}
 \le C_L\bigl(\|\sqrt{\rho^r}\,w\|_2+
  (1+\|\rho^r\|_{L^\infty(B_L)}^{1/2})
  \|\nabla w\|_2\bigr).
$$
One cannot directly replace the anchor ball on the left of the
printed (2.11) by an arbitrary $K$; enlargement or (2.9) is needed.
The classical $u_t^r$ satisfies its $H^1$ premise by (2.7).
The radius-uniform $\psi$ bound yields
$u_t^r$ uniformly in $L^2(0,\tau;L^2(K))$ and $u^r$
uniformly in $L^\infty(0,\tau;L^2(K))$.
Together with the $\nabla u^r$ bound, the latter gives
$u^r$ uniformly in $L^\infty_tH^2(K)$, hence locally
$L^\infty_{t,x}$. No global unweighted $L^2$ or $L^{q_2}$
velocity bound is used.

The density bounds give $\rho^r$ uniformly in
$L^\infty_t(H^1\cap W^{1,q})(K)$; continuity yields
$$
\rho_t^r=-u^r\cdot\nabla\rho^r
          -\rho^r\operatorname{div}u^r
$$
uniformly in $L^\infty_tL^2(K)$. The derivative bounds imply
$L^2(K)$ time moduli $C|t-s|^{1/2}$ for $u^r$ and
$C|t-s|$ for $\rho^r$. Rellich compactness of bounded
$H^2(K)$ and $H^1(K)$ sets, metric Arzela–Ascoli, and a
diagonal subsequence give strong
$C([0,\tau];L^2(K))$ convergence for both fields.
Use the time-continuous representatives supplied by their
local derivative bounds. For fixed $K$, the time-independent
cutoffs in (3.62) equal one on $K$ for large $r$; do not
discard their extra terms in a global cutoff PDE.

Extract, on one subsequence, local weak $L^2$ limits
$v$ of $u_t^r$, global weak $L^2$ limits $G$ of
$\nabla u_t^r$, and $z$ of $\sqrt{\rho^r}u_t^r$.
Integration by parts against compact space-time tests and
strong $u^r$ convergence give
$v=\partial_tu$ as a regular distribution; spatial testing gives
$G=\nabla v$. The square-root estimate must be in space-time:
$$
\|\sqrt{\rho^r}-\sqrt\rho\|_{L^2((0,\tau)\times K)}^2
 \le\|\rho^r-\rho\|_{L^1((0,\tau)\times K)}
 \longrightarrow0.
$$
Test the weak $u_t^r$ limit against
$\sqrt{\rho^r}\psi$ for bounded compact $\psi$. Its strong
$L^2$ convergence identifies $z=\sqrt\rho\,v$ locally;
density extends the identification to global $L^2$ tests.
The global weak bound puts this product in $L^2$.
To recover the **temporal** $L^\infty_tL^2_x$ bound, use weak
lower semicontinuity on every measurable time set $A$:
$\int_A\|z(t)\|_2^2dt\le C^2|A|$. Hence
$\|z(t)\|_2\le C$ almost everywhere. This proves the
compatibility of the time derivative, spatial gradient, and
weighted product for the damped limit.

## Second limit: vanishing damping

After the first limit, $u_t^\delta$ is a genuine local $H^1$
function with the listed weighted product and gradient, so
Lemma 2.3 may now be applied to it. Use the $\delta$-uniform
initial bounds (4.25), (4.27), (4.29), a common interval
as asserted in Proposition 4.1, its closed bound (4.2),
and the uniform anchor (4.6). These yield
$u_t^\delta$ uniformly in local $L^2_{t,x}$.
Local $L^2$ for $u^\delta$ follows by applying the same
weighted inequality to $u^\delta$; with the $\nabla u^\delta$
bound this gives local $H^2$ and a local $L^\infty$ bound.
The continuity equation gives uniform local $\rho_t^\delta$,
so repeat the strong compactness and weak-limit
identifications above. The representative reconstruction
itself does **not** need (4.3), whose derivation uses the
cancellation (4.16); this avoids a circular source argument.
The closed estimate (4.2) already belongs to the source's
a priori proposition and its common-lifespan assertion.

The displayed a priori estimates alone do not prove
continuation of each initially short-lived damped solution to
that common interval. Nor does this reconstruction cover
temperature limits, all nonlinear terms, initial traces,
uniqueness, or the full existence theorem.

## Cancellation and zero-mass boundary

PDF p.19–20 (4.16) is a **damped** solution claim for every
time. Its cutoff tends to one as $r\to\infty$. The p.20
printed phrase “letting $r\to0$” is the wrong direction:
that would make the cutoff tend to zero almost everywhere
and prove nothing about $\int\rho\dot u$. The corrected
cutoff argument gives almost-everywhere-time cancellation
from $f\in L^1$ and stress $V\in L^2$, without first using
the later $L^{q_2}$ velocity estimate. An every-time claim
needs more temporal representative justification.

The paper normalizes positive mass on p.16. This candidate
does not establish its existence theorem for zero-mass
initial data. Registered N0007 assumes an existing final
solution and handles zero mass directly through conservative
momentum, without a positive-mass anchor. Full N0007 Lean
formalization and the original global theorem remain OPEN.
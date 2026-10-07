# Wang-v1 two-limit $u_t$ identification: positive-mass reconstruction

Date: 2026-10-07. Source: user-provided Wang-v1 PDF, SHA-256
a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d.
This is a candidate source-fidelity reconstruction, not an assertion that
the paper itself writes the limit argument. It concerns the **positive
total mass** approximation branch only. Zero-mass data remain separately
untreated by the paper's mass normalization and are not excluded from the
registered N0007 conditional statement.

## Page-level facts

- PDF p.5, Lemma 2.2 defines $\widetilde D^{1,2}(\Omega)$ as
  $H^1_{\rm loc}$ functions with global $L^2$ spatial gradient.
  PDF pp.5–6, Lemma 2.3 and (2.11), prove exactly the positive-local-mass
  weighted Poincare estimate needed to control a function's $L^2$ norm
  on a fixed ball by $\|\sqrt\rho\,v\|_2$ and $\|\nabla v\|_2$.
  The lemma requires $v\in\widetilde D^{1,2}$; it cannot be applied
  directly to an arbitrary distribution.
- PDF p.5, (2.7), gives classical $u_t^r\in C_tH^1$ on each finite
  approximation ball. PDF p.8, Proposition 3.1 and the definition of
  $\psi$ on p.7 provide the relevant bounds uniformly in ball radius
  $r$ for fixed damping $\delta$. PDF p.9, (3.10), gives a positive
  local mass bound uniform in $r$ on its common short time interval.
- PDF p.17 summarizes the $r\to\infty$ passage by weak convergence,
  Poincare and standard arguments; it states the damped limit satisfies
  (3.1) but does not exhibit a common $u_t$ identification.
- PDF p.18, (4.6), gives a positive local mass bound uniform in
  $\delta$. PDF pp.17,21–22, (4.2) and Lemma 4.5, give uniform
  $\sqrt\rho u_t$ and $\nabla u_t$ bounds through $\psi$ on the
  common interval. PDF p.23 asserts the $\delta\to0$ limit has (1.8)
  by standard compactness arguments, without displaying the
  time-derivative identification.

## First limit, expanding balls at fixed damping

On any compact $K\Subset\mathbb R^2$ and any common short time
interval, the classical $u_t^r$ satisfies
$$
\int_0^T\|u_t^r(t)\|_{L^2(K)}^2\,dt
 \le C_K\int_0^T
  \bigl(\|\sqrt{\rho^r}u_t^r\|_2^2
       +\|\nabla u_t^r\|_2^2\bigr)\,dt
 \le C_{K,\delta}.
$$
The first inequality uses (2.11) and (3.10); the second uses the
radius-uniform $\psi$ estimate (3.5). For a fixed $K$, the cutoff
extensions (3.62) agree with the original fields on $K$ once $r$
is large, so their temporal derivatives have the same local bound.

The source density estimates control $\rho^r$ in
$L^\infty_t(H^1\cap W^{1,q})$ on $K$. The velocity estimates control
$u^r$ in $L^\infty_tH^2(K)$: local $L^2$ follows from the weighted
inequality (3.11) applied to the classical velocity, while
$\nabla u^r$ is uniformly bounded in $H^1$ by Proposition 3.1.
No global unweighted $L^2$ velocity norm is used.
Consequently $u^r$ is uniformly bounded locally and
$$
\rho_t^r=-u^r\cdot\nabla\rho^r-\rho^r\operatorname{div}u^r
$$
is uniformly bounded in $L^\infty_tL^2(K)$. Rellich compactness and
time equicontinuity therefore give, after a diagonal subsequence,
strong convergence of $\rho^r$ in $C_tL^2(K)$ and of $u^r$ in
$C_tL^2(K)$. The latter uses the local $L^2_tL^2(K)$ derivative
bound just obtained. The weaker strong convergence needed below
would suffice.

Let $v$ be a weak local $L^2$ limit of $u_t^r$. For every compact
space-time test $\psi$,
$$
\int v\psi
 =\lim_r\int u_t^r\psi
 =-\lim_r\int u^r\partial_t\psi
 =-\int u\partial_t\psi.
$$
Hence $v=\partial_tu$ as a regular distribution. A weak limit of
$\nabla u_t^r$ is $\nabla v$ by the same distributional test.
Since nonnegative $\rho^r\to\rho$ strongly in local $L^1$,
$$
\|\sqrt{\rho^r}-\sqrt\rho\|_{L^2(K)}^2
 \le\|\rho^r-\rho\|_{L^1(K)}\to0.
$$
Testing $u_t^r\rightharpoonup v$ against
$\sqrt{\rho^r}\psi$ for bounded compact $\psi$ identifies the weak
limit of $\sqrt{\rho^r}u_t^r$ with $\sqrt\rho\,v$. Density of such
tests and the uniform $L^2$ bound extend the identification to
all $L^2$ tests. Thus the three limiting fields use one derivative.

## Second limit, vanishing damping

Repeat the same argument for the whole-plane damped solutions
indexed by $\delta$, now using the $\delta$-uniform mass anchor
(4.6), the $\delta$-uniform bounds (4.2)–(4.3), and the
$\sqrt\rho u_t,\nabla u_t$ terms in $\psi$. The local weighted
Poincare inequality first makes $u_t^\delta$ uniformly
$L^2_{t,x,\rm loc}$. The continuity equation and local $H^2$
velocity bound then give uniform local density time derivatives;
Rellich and time equicontinuity supply the needed strong local
density and velocity convergence. Distributional integration by
parts identifies the weak derivative, and strong local square-root
density convergence identifies the weighted derivative, exactly
as in the first limit. This fills a *candidate* route behind the
source's summarized statement that the final solution satisfies
(1.8).

## Scope and further check

The source's p.19–20 (4.16) claims $\int\rho\dot u=0$ for **every**
time of the damped solution. Its cutoff computation on p.20 ends
with the printed phrase “letting $r\to0$”; because its cutoff
equals one on $B_{r/2}$, the required limit is $r\to\infty$.
This appears to be a direction typo. It is not imported as a
certificate for the final undamped solution; registered N0007
asks only an almost-everywhere-time result and proves the
distributional-to-slice step separately.

The reconstruction still needs an independent line-by-line audit
that the first-stage weighted-velocity bound and all local
time-uniform constants have the cited radius dependence, and
that the second-stage bounds are truly uniform in $\delta$ for
the same interval. The zero-mass source existence case is
uncovered by this positive-mass argument. No Lean formalization
of either compactness limit has been run. N0007 remains OPEN.

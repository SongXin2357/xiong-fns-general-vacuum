# N0007: direct proof reconstruction from the asserted Wang-v1 solution class

Date: 2026-10-07. This is a mathematical proof draft for the registered
almost-everywhere-time statement, not a Lean certificate or a claim that the
source paper supplied every approximation-limit detail. The independent
source audit is in ../../sources/wang-v1-ut-representative-20261007.md.

## Interpretive boundary

The exact registered target assumes a final strong solution with Wang-v1
(1.8), rather than asking us to reprove Wang's existence theorem. On the
standard weak-derivative reading of (1.8), the same distributional time
derivative $u_t$ occurs in both $\sqrt\rho\,u_t$ and $\nabla u_t$. This is
not an additional regularity hypothesis. It is the meaning of the displayed
derivative notation. The source gives no separate construction of that common
representative through its two compactness limits. If one declines this
standard reading, the first step below is conditional and the paper's
approximation-limit identification must be supplied independently.

Fix $0<T<T_*$, and write all bounds on $(0,T)$.

## Density bounds and a positive-mass anchor

From $\rho\in C_t(L^1\cap W^{1,q})$, $q>2$, planar Sobolev embedding gives
$\rho\in L^\infty_{t,x}$ and $\sup_t\|\rho(t)\|_1<\infty$.
Moreover,
$$
\|\rho u\|_{L^1_x}
 \le \|\sqrt\rho\|_{L^2_x}\|\sqrt\rho\,u\|_{L^2_x},
$$
so the mass flux lies in $L^\infty_tL^1_x$. Test continuity against
$\eta(t)\chi(x/R)$, with a standard cutoff $\chi=1$ near the origin.
The flux error is bounded by
$C R^{-1}\|\eta\|_{L^1_t}\|\rho u\|_{L^\infty_tL^1_x}$ and tends to zero.
The density term tends to the distributional derivative of
$m(t)=\int\rho(t,x)\,dx$ by dominated convergence. Thus $m$ is constant;
continuity into $L^1$ upgrades this to every $t\in[0,T]$.

If $m=0$, nonnegativity yields $\rho(t)=0$ a.e. for every $t$.
Consequently $P=f_i=0$. The original conservative momentum equation,
tested with time-space separated compact tests, gives
$\operatorname{div}V_i=0$ for almost every time, where $V_i$ is the
viscous stress row. The common-time argument below applies directly.

Suppose $m>0$. The image of $[0,T]$ under $t\mapsto\rho(t)$ is compact
in $L^1(\mathbb R^2)$, hence uniformly tight. Select a fixed ball $B_0$
and $c>0$ such that
$\int_{B_0}\rho(t)\ge c$ for every $t$.

## Local weighted Poincare estimate for the time derivative

Let $B\supset B_0$ be a bounded ball, $r\ge0$ with
$\|r\|_{L^\infty(B)}\le M$ and $\int_Br\ge c$, and let $v\in H^1(B)$.
Write $v_B=|B|^{-1}\int_Bv$. Ordinary Poincare gives
$\|v-v_B\|_2\le C_B\|\nabla v\|_2$. Then
$$
c|v_B|
 \le \left|\int_Brv\right|+\int_Br|v-v_B|
 \le \left(\int_Br\right)^{1/2}\|\sqrt r\,v\|_2
      +M^{1/2}\left(\int_Br\right)^{1/2}
        C_B\|\nabla v\|_2.
$$
Since $\int_Br\le M|B|$, this and
$\|v\|_2\le\|v-v_B\|_2+|B|^{1/2}|v_B|$ imply
$$
\|v\|_{L^2(B)}
 \le C(B,c,M)
   \bigl(\|\nabla v\|_{L^2(B)}
         +\|\sqrt r\,v\|_{L^2(B)}\bigr). \tag{A}
$$
The standard distributional Sobolev interpretation first supplies a
locally integrable representative of $u_t$ whose spatial weak gradient
is the listed $\nabla u_t$. If the source notation is taken only as
three unrelated weak limits, (A) cannot be applied; this is exactly the
source-semantic gap documented separately. With the common representative,
apply (A) componentwise to $u_t(t)$ and integrate in time. The two bounds
in (1.8) yield $u_t\in L^2(0,T;H^1_{\mathrm{loc}})$.

## The conservative-to-material product rule

The finite exponent $q_2=4/\alpha$ in (1.9), together with
$u\in L^\infty_tL^{q_2}_x$ and
$\nabla u\in L^\infty_tH^1_x$, gives
$u\in L^\infty_tH^2_{\mathrm{loc}}$ and hence
$u\in L^\infty_{t,x,\mathrm{loc}}$ in dimension two.
Continuity, initially interpreted in distributions, therefore gives
$$
\rho_t=-u\cdot\nabla\rho-\rho\,\operatorname{div}u
       \in L^\infty(0,T;L^2_{\mathrm{loc}}).
$$
Indeed $\nabla\rho\in L^\infty_tL^2_x$ and the other factors are
locally bounded or in $L^\infty_tL^2_x$. Thus on each compact spatial
set, $\rho\in W^{1,1}_tL^2_x$ and
$u\in W^{1,2}_tL^2_x$, while both fields are locally essentially
bounded. Time mollification and the ordinary product rule, followed
by convergence in local $L^1_{t,x}$, give
$$
\partial_t(\rho u_i)=\rho_tu_i+\rho u_{i,t}
$$
in spacetime distributions. The spatial Sobolev product rule similarly
gives
$$
\operatorname{div}(\rho u_i u)
 =\rho u\cdot\nabla u_i+u_i\operatorname{div}(\rho u).
$$
Subtract $u_i[\rho_t+\operatorname{div}(\rho u)]=0$ from the original
conservative momentum equation. For each $i=1,2$,
$$
f_i=\rho\bigl(u_{i,t}+u\cdot\nabla u_i\bigr)
     =\operatorname{div}V_i
$$
as a spacetime distribution, with
$V_{ij}=\mu\partial_j u_i+(\mu+\lambda)(\operatorname{div}u)
\delta_{ij}-P\delta_{ij}$.

## Source and stress integrability

For almost every time, the exact estimates are
$$
\|P\|_2
 \le R\|\rho\|_\infty^{1/2}\|\sqrt\rho\,\theta\|_2,
\qquad
\|\rho u_{i,t}\|_1
 \le \|\rho\|_1^{1/2}\|\sqrt\rho\,u_t\|_2,
$$
and
$$
\|\rho u\cdot\nabla u_i\|_1
 \le \|\rho\|_\infty^{1/2}
      \|\sqrt\rho\,u\|_2\|\nabla u_i\|_2.
$$
Hence $f_i\in L^\infty_tL^1_x$ and
$V_i\in L^\infty_tL^2_x$. These bounds do not require unweighted
$u,\theta\in L^2(\mathbb R^2)$.

For fixed $\phi\in C_c^\infty(\mathbb R^2)$, the spacetime identity
tested by $\eta(t)\phi(x)$ gives
$$
\int f_i(t)\phi\,dx
 =-\int V_i(t)\cdot\nabla\phi\,dx
$$
for almost every $t$. On each bounded ball choose a countable
$C^1$-dense family of smooth compactly supported tests. Intersect the
corresponding full-measure time sets for both components and all balls.
At each remaining time, $L^1$ continuity of the source pairing in
the uniform norm and $L^2$ continuity of the stress pairing in the
gradient $L^2$ norm extend the identity to every compactly supported
smooth test. This constructs one null set independent of $i$ and
$\phi$. The exact certified N0002 theorem then yields
$\int_{\mathbb R^2}f_i(t,x)\,dx=0$ for both components at every such
time.

## Gate status

The five current Lean declarations certify three source-space
integrability estimates, full fixed-time material-source integrability,
and the conditional application of N0002. They do not formalize (A),
the source interpretation of $u_t$, the spacetime product rule,
stress regularity from the PDE data, or the common time null set.
No complete N0007 Lean target has been built. The node remains OPEN,
has no descendants, and gives no global-existence estimate.

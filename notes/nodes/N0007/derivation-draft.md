# N0007 — parent derivation draft (paper candidate only)

The blind xiong-agent input was frozen before this draft was written. This note does not promote N0007, prove global existence, or provide a Lean certificate. The [independent review](review-20261007.md) identifies a source-semantic obligation at the $u_t$ representative.

## Source-space estimates

Fix $0<T<T_*$ and let $p=q_2=4/\alpha\ge4$. Wang-v1 (1.8) gives
$\rho\in C([0,T];L^1\cap W^{1,q})$, $q>2$, so
$\sup_{t\le T}\|\rho(t)\|_1<\infty$ and
$\sup_{t\le T}\|\rho(t)\|_\infty<\infty$ by the planar Sobolev embedding.
For almost every $t$,
$$
\|P(t)\|_2
 \le R\|\rho(t)\|_\infty^{1/2}
       \|\sqrt\rho\,\theta(t)\|_2,
$$
$$
\|\rho u_{i,t}\|_1
 \le \|\rho\|_1^{1/2}\|\sqrt\rho\,u_t\|_2,\qquad
\|\rho u\cdot\nabla u_i\|_1
 \le \|\sqrt\rho\,u\|_2\|\rho\|_\infty^{1/2}
       \|\nabla u_i\|_2.
$$
Consequently $f_i\in L^1$ and
$V_i=\mu\nabla u_i+(\mu+\lambda)(\operatorname{div}u)e_i-Pe_i\in L^2$.
Neither $u\in L^2$ nor $\theta\in L^2$ is added.

## Conservative-to-material derivative step

The flux $\rho u$ lies in $L^\infty_tL^1_x$ by weighted Cauchy–Schwarz.
Testing continuity with expanding cutoffs, then using
$\rho\in C_tL^1_x$, shows that $m(t)=\int_{\mathbb R^2}\rho(t)$ is
constant. If $m=0$, nonnegativity gives $\rho=P=f_i=0$ and the original
conservative momentum equation gives the weak stress identity directly.

If $m>0$, compactness of $\{\rho(t):0\le t\le T\}$ in $L^1$ gives a
fixed ball $B_0$ and $c>0$ with
$\int_{B_0}\rho(t)\ge c$ for all $t$.
For $B\supset B_0$ and $v\in H^1(B)$, subtracting its ordinary mean,
using Poincaré, and recovering the mean from the weighted integral gives
$$
\|v\|_{L^2(B)}
 \le C_{B,B_0,c,\sup_t\|\rho(t)\|_\infty}
 \bigl(\|\nabla v\|_{L^2(B)}
      +\|\sqrt\rho\,v\|_{L^2(B_0)}\bigr).
$$
Applying this to $v=u_t$ would give
$u_t\in L^2(0,T;L^2_{\rm loc})$.
**This application first requires** that (1.8)'s
$u_t$, $\sqrt\rho\,u_t$, and $\nabla u_t$ refer to the same locally
integrable weak-time-derivative function and to its spatial weak
gradient. An arbitrary time distribution cannot simply be inserted
into this inequality. This is the explicit source-semantic obligation
identified by the red-team.

Under that conventional interpretation, $u\in L^\infty_tL^p_x$
and $\nabla u\in L^\infty_tH^1_x$ imply
$u\in L^\infty_tH^2_{\rm loc}\subset L^\infty_tL^\infty_{\rm loc}$.
The continuity equation and the local spatial product rule give
$$
\rho_t=-u\cdot\nabla\rho-\rho\operatorname{div}u
       \in L^\infty_tL^2_{\rm loc}.
$$
Time mollification of $\rho$ and $u_i$ then justifies
$\partial_t(\rho u_i)=\rho_tu_i+\rho u_{i,t}$ in distributions.
The spatial product rule gives
$$
\operatorname{div}(\rho u_i u)
 =\rho u\cdot\nabla u_i+u_i\operatorname{div}(\rho u).
$$
Continuity cancels the two terms with $u_i$, so the original
conservative momentum equation yields
$f_i=\operatorname{div}V_i$ in spacetime distributions.

For a fixed spatial $\phi\in C_c^\infty(\mathbb R^2)$, test with
$\eta(t)\phi(x)$ and apply Fubini to obtain
$$
\int_{\mathbb R^2}f_i(t,x)\phi(x)\,dx
 =-\int_{\mathbb R^2}V_i(t,x)\cdot\nabla\phi(x)\,dx
$$
for almost every $t$. Choose countable $C^1$-dense families of smooth
tests on each bounded ball and intersect their full-measure time sets
for both $i=1,2$. At a good time, the $L^1$ bound on $f_i$ and $L^2$
bound on $V_i$ extend the identity to every compactly supported smooth
test. The certified general lemma N0002 then gives
$\int_{\mathbb R^2}f_i(t,x)\,dx=0$.

## Open gates

The source representative, local weighted-Poincaré application, and
time product rule still require final source-faithful proof wording.
The exact N0007 target has no Lean build, type/axiom log, semantic
certificate, or eligible child. No global-existence estimate follows.
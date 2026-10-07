# N0007 — parent derivation draft (awaiting independent review and Lean)

Status on 2026-10-07: paper candidate only. This text does not promote N0007, prove the global theorem, or supply a Lean certificate. The blind xiong-agent input was frozen before this draft was written.

## Space norms for almost every time

Fix (0<T<T_*), put (p=q_2=4/\alpha\ge4), and use Wang-v1 (1.8). Since (q>2) in two dimensions, (\rho(t)\in W^{1,q}(\mathbb R^2)\hookrightarrow L^\infty(\mathbb R^2)) for each (t), with a uniform bound on ([0,T]). Also (m(t)=\int\rho(t)<\infty). The pressure obeys
[
\|P(t)\|_2\le R\|\rho(t)\|_\infty^{1/2}\|\sqrt\rho\,\theta(t)\|_2.
]
Hence each (V_i=\mu\nabla u_i+(\mu+\lambda)(\operatorname{div}u)e_i-Pe_i) belongs to (L^2). Moreover
[
\|\rho u_{i,t}\|_1
 \le m(t)^{1/2}\|\sqrt\rho\,u_t\|_2,
\qquad
\|\rho u\cdot\nabla u_i\|_1
 \le\|\sqrt\rho\,u\|_2\|\rho\|_\infty^{1/2}\|\nabla u_i\|_2.
]
Thus (f_i\in L^1). These estimates add no (u\in L^2) or (\theta\in L^2) assumption.

## Spacetime product rule requiring careful justification

The source gives (u\in L^\infty_tL^p_x), (\nabla u\in L^\infty_tL^2_x), (\nabla u_t\in L^2_{t,x}), and (\sqrt\rho\,u_t\in L^\infty_tL^2_x), but does not directly list unweighted (u_t\in L^2_{t,x}). The needed *local* version can be reconstructed if the source's (u_t) is indeed the distributional time derivative represented by the fields in (1.8). This representative point must be checked in the independent review.

First, (\rho u\in L^\infty_tL^1_x) by Cauchy–Schwarz. Testing continuity with expanding cutoffs and using (\rho\in C_tL^1_x) shows that (m(t)=m(0)) on ([0,T]). If (m=0), nonnegativity gives (\rho=P=f_i=0); the original momentum equation gives the desired weak stress identity directly, so no anchoring of (u_t) is needed.

If (m>0), compactness of (\{\rho(t):0\le t\le T\}\subset L^1) gives a fixed ball (B_0) and (c>0) with (\int_{B_0}\rho(t)\ge c) for all (t). For every larger bounded ball (B\supset B_0), the weighted local Poincaré estimate
[
\|v\|_{L^2(B)}
 \le C_{B,c,\sup_t\|\rho(t)\|_\infty}
       (\|\nabla v\|_{L^2(B)}+\|\sqrt\rho\,v\|_{L^2(B_0)})
]
follows by subtracting the ordinary mean (v_B), bounding (v-v_B) by its gradient, and solving for (v_B) from the positive weighted mass. Applied to (v=u_t) and integrated in time, it yields (u_t\in L^2(0,T;L^2_{\rm loc})). For (v) known initially only as a distribution, one needs the standard homogeneous-Sobolev representative lemma before applying this inequality; this is an explicit proof obligation.

The continuity equation and local spatial product rule give
[
\rho_t=-u\cdot\nabla\rho-\rho\operatorname{div}u.
]
Because (1/q+2/p<1), both (u_i\rho_t) and (u_i\operatorname{div}(\rho u)) are locally integrable in spacetime. The local time product rule for (\rho u_i) and spatial product rule for (\rho u_i u) therefore give
[
\partial_t(\rho u_i)+\operatorname{div}(\rho u_i u)
 =\rho u_{i,t}+\rho u\cdot\nabla u_i
  +u_i[\rho_t+\operatorname{div}(\rho u)]
 =f_i
]
in spacetime distributions. This step needs a written approximation argument using the stated mixed Lebesgue exponents, not an appeal to smooth solutions.

The original conservative momentum equation (1.1), with the displayed definition of (V_i), then implies (f_i=\operatorname{div}V_i) in spacetime distributions. For each fixed spatial test (\phi\in C_c^\infty(\mathbb R^2)), testing with (\eta(t)\phi(x)) and using Fubini yields
[
\int f_i(t,x)\phi(x)\,dx=-\int V_i(t,x)\cdot\nabla\phi(x)\,dx
]
for almost every (t). Choose a countable set of compactly supported smooth tests dense in the (C^1) norm on every fixed compact support, and intersect the corresponding full-measure time sets for both components. The (L^1) bound on (f_i(t)) and (L^2) bound on (V_i(t)) extend the identity from the countable set to every compactly supported smooth test, on one common full-measure set. N0002 then gives (\int f_i(t)=0).

## Gates still open

The independent blind reconstruction and nonblind red-team must check the representative/local Poincaré argument, the mixed-exponent product rule, the source's exact interpretation of (u_t), and the all-tests null-set construction. The exact N0007 theorem has no Lean implementation or passing build. No N0007 child may start.
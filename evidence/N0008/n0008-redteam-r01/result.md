Adversarial review of N0008 (paper-level DRAFT; exact-target Lean NOT_RUN).

1. First unsupported implication and source scope.
The first unsupported assertion is the claimed transformation of the damped system: equation (2.1) is not included in the authorized excerpts. For the undamped system the proposed scaling is correct. Put s=m_0>0 and (\widetilde\rho,\widetilde u,\widetilde\theta)(x,t)=(s\rho,u,\theta)(sx,st). Every term of the continuity equation scales by s^2, and every term of each momentum and temperature equation also scales by s^2. Moreover, \int\widetilde\rho\,dx=s^{-1}\int\rho\,dx=1, and the compatibility left-hand side scales by s^2, giving \widetilde g(x)=s^{3/2}g(sx). Fixed spatial dilation preserves the stated weighted spaces, with constants depending on s and the weight parameters. If, and only if, the damping is a term +\delta\theta with no additional coefficient being rescaled, its transformed coefficient is \widetilde\delta=s^2\delta. The exact damped equation and boundary conditions must be supplied before declaring source fidelity.

The first substantive unsupported bridge is the sentence assuming both approximation levels on a common arbitrary interval (0,T), T<T*. Proposition 5.1 supplies an r-independent interval T_\delta that may depend on \delta; Proposition 3.1 supplies a \delta-independent interval for the whole-space solutions, subject to its hypotheses and uniformly bounded \psi_0. Neither excerpt states that the original ball solutions exist with the required uniform bounds up to that latter interval. Thus one cannot simply run the ball compactness argument on every T<T*. This is an interval-coverage gap, not a counterexample to the PDE conclusion. Smallest repair: identify the derivative for the first-level limits on their actual intervals, then prove continuation of that identification and the required local time regularity throughout the interval where Proposition 3.1 applies. Alternatively prove uniform ball estimates and extension on that entire interval. Renaming or shrinking T* without establishing its relation to the preregistered final solution does not prove the exact target.

The excerpts verify the displayed statements of Propositions 3.1 and 5.1, including their dependence on N_1 or N_2 and \psi_0. They do not verify their complete proofs, Lemma 2.2's class (2.8), the smooth-data hypotheses (2.5), or the cutoff (3.24). Page 34's reference to estimates in Proposition 3.1 does not by itself upgrade Proposition 5.1 to a \delta-uniform ball result. For the second level, pages 19–20 do explicitly state the initial bounds needed to bound \psi_0 uniformly in \delta. Those statements are source assertions; their elliptic approximation proofs are not supplied in full.

2. Anchor and local coercivity: independently valid under the stated bounds.
Suppose the proposed bounds and conserved approximate mass are actually available. Since w tends to infinity, \int_{|x|\ge N}\rho_n\le C_w/\inf_{|x|\ge N}w. Combining this with total mass at least m_0/2 gives the stated anchor c=m_0/4. On a ball D containing B_N, let b=|D|^{-1}\int_D v. Then
\[
c|b|^2\le\int_{B_N}\rho_n|b|^2
\le2\int_{B_N}\rho_n|v|^2+2K\int_D|v-b|^2
\le2\|\sqrt{\rho_n}v\|_2^2+2KC_D^2\|\nabla v\|_{L^2(D)}^2.
\]
Together with \|v\|_{L^2(D)}\le\|v-b\|_{L^2(D)}+|D|^{1/2}|b|, this proves uniform local L^2 coercivity. It applies componentwise to u_{n,t} and u_n, and the Hessian bound supplies local H^2 control of u_n. Constants depend on c,K,D; there is no uniform zero-mass limit. No use of Lemma 2.4 on the final derivative is necessary.

For ball approximants these statements concern restrictions to fixed interior balls, once r is sufficiently large. Zero extensions need not retain global H^2 regularity: a zero-boundary function can have a jump in its normal derivative across the boundary. Use interior restrictions for compactness and a separately justified extension or cutoff for global quantities.

3. Compactness and identification: valid conditionally, with precise upgrades.
On a genuinely common interval, bounds in L^\infty_tH^2(D) and for u_{n,t} in L^2_tH^1(D) give strong compactness in L^2_tH^1(D). Interior restrictions and a diagonal subsequence avoid boundary issues. Distributional time integration by parts identifies the weak local derivative limit U as \partial_tu. Spatial integration by parts identifies its gradient. This proves U\in L^2_{\mathrm{loc}} in space-time, rather than merely assigning a name to a weighted field.

The density argument is also correct under the proposed bounds. In two dimensions H^2(D) embeds in L^\infty(D), and H^1(D) embeds in L^q(D) for every finite q. Hence
\[
\|\rho_{n,t}\|_{L^q(D)}\le\|u_n\|_{L^\infty(D)}\|\nabla\rho_n\|_{L^q(D)}+K\|\operatorname{div}u_n\|_{L^q(D)}.
\]
The right side is uniformly bounded in time; the claimed L^2_tL^q bound follows. Compactness gives strong local L^2_tL^q convergence. The square-root inequality then gives strong local L^2 space-time convergence of \sqrt{\rho_n}. For every bounded compactly supported vector test \psi, strong convergence of \sqrt{\rho_n}\psi in L^2 and weak convergence of u_{n,t} in L^2 identify the product limit as \sqrt\rho U. The global L^\infty_tL^2 weak-star bound passes to this identified product.

An analogous global L^2 weak limit of \nabla u_{n,t} must be extracted and identified by interior tests. This supplies the global gradient bound. To assert these are the same quantities named in (1.7), record that these identified limits are precisely the representatives used in the source construction, or prove uniqueness of the derivative and its distributional gradient in that construction. Local limits alone do not authenticate an independently unspecified symbol.

These conclusions are conditional analysis results. They do not close the missing interval coverage or the source's omitted approximation details.

4. Integrability and conservative-to-material passage.
Once U is identified, the desired source-space matching can be proved explicitly. Write M=\|\rho(t)\|_1 and K=\|\rho(t)\|_\infty. At almost every time,
\[
\|\rho U_i\|_1\le M^{1/2}\|\sqrt\rho U_i\|_2,
\qquad
\|\rho u\cdot\nabla u_i\|_1\le K^{1/2}\|\sqrt\rho u\|_2\|\nabla u_i\|_2,
\]
\[
\|P\|_2\le R K^{1/2}\|\sqrt\rho\theta\|_2.
\]
Thus f_i\in L^\infty_tL^1_x and V_i\in L^\infty_tL^2_x under the final bounds. The pressure estimate needs no global unweighted L^2 bound for temperature.

The product rule should be written rather than merely attributed to Sobolev rules. Locally, u\in W^{1,2}_tH^1_x\cap L^\infty_tH^2_x and \rho\in W^{1,2}_tL^q_x\cap L^\infty_tW^{1,q}_x, with q>2. These bounds justify time mollification and passage to the limit in
\partial_t(\rho u_i)=\rho U_i+u_i\rho_t.
Spatial Sobolev multiplication similarly gives
\operatorname{div}(\rho u_i u)=\rho u\cdot\nabla u_i+u_i\operatorname{div}(\rho u).
All products are locally integrable. Combining with continuity and the conservative momentum equation yields the claimed material equation. This step is independently valid conditional on the identified regularity and the final conservative equations.

5. One exceptional set and exact N0002 matching.
Choose, for each integer k, a countable family of smooth tests supported in B_k that is dense among such tests for the C^1 norm. For every chosen test and component, the space-time identity says that
h(t)=\int f_i(t)\phi+\int V_i(t)\cdot\nabla\phi
vanishes as a time distribution. Since h is locally integrable, it vanishes almost everywhere. Remove the countable union of these exceptional sets, together with the sets where the global field bounds fail. At every remaining time,
\[
|\langle f_i,\phi-\psi\rangle|\le\|f_i\|_1\|\phi-\psi\|_\infty,
\quad
|\langle V_i,\nabla(\phi-\psi)\rangle|\le\|V_i\|_2|B_k|^{1/2}\|\nabla(\phi-\psi)\|_\infty.
\]
Density therefore extends the identity to every compact smooth test, using the same null set for both components.

The resulting hypotheses match the mathematical N0002 statement exactly: real integrable f_i, square-integrable Euclidean vector V_i, and the stated distributional divergence identity. For completeness, if \chi\in C_c^\infty equals one on B_1 and vanishes outside B_2, set \chi_R(x)=\chi(x/R). Then \|\nabla\chi_R\|_2=\|\nabla\chi\|_2 in dimension two and
\[
\left|\int V_i\cdot\nabla\chi_R\right|\le\|V_i\|_{L^2(|x|\ge R)}\|\nabla\chi\|_2\longrightarrow0.
\]
Dominated convergence gives \int f_i=0. This independently proves the paper-level generic implication; it does not verify any Lean publication certificate. The supplied N0002 text itself says 'Lean not run', whereas the N0008 registration says its current gate passed. Those records require reconciliation by the parent using actual versioned evidence.

6. Zero mass and conservative traces.
For an existing final solution, mass conservation follows from cutoff continuity. With \chi_R as above,
\[
\left|\int_0^t\!\int\rho u\cdot\nabla\chi_R\right|\le C R^{-1}\int_0^t\|\rho\|_1^{1/2}\|\sqrt\rho u\|_2\,ds\to0.
\]
The L^1 continuity of density supplies the initial trace. Nonnegativity then gives \rho=0. Time slicing of the conservative momentum equation gives the homogeneous Lamé equation for almost every time. A rigorous L^p Liouville argument is available: u(t)\in L^{q_1} is a tempered distribution; its Fourier transform is supported at zero because the Lamé symbol has eigenvalues \mu|\xi|^2 and (2\mu+\lambda)|\xi|^2 away from zero. A distribution supported at zero is a finite sum of derivatives of the Dirac mass, so u(t) is a polynomial. Finite L^{q_1} integrability forces that polynomial to vanish. Thus u=0 and U=0. The same argument for \Delta\theta=0 and finite L^{q_2}, valid since \alpha>1/2, forces \theta=0. Consequently the N0008 identity for any existing zero-mass final solution holds directly.

However, constructing the zero triple for every allowed initial datum is conditional on the exact initial-trace meaning. The excerpts do not include (1.3) or (1.4). Under the displayed (1.5)–(1.6) alone, \rho_0=0, u_0=0, \theta_0=C>0 satisfies all displayed assumptions, while the zero triple does not attain an unweighted temperature trace C. A nonzero constant u_0 similarly satisfies the displayed compatibility and gradient assumptions. These examples may be excluded by omitted source conditions; they demonstrate why conservative traces cannot silently replace an unweighted initial condition. Smallest repair: inspect and reproduce (1.3)–(1.4) and the actual trace convention. The page-33 approximation with fixed ball mass at least 1/2 cannot converge in weighted L^1 to zero density, since even its unweighted L^1 norm is at least 1/2. Positive-mass scaling does not repair that zero-mass construction gap.

Verdict: no algebraic counterexample was found to the conditional positive-mass analysis bridge. The exact N0008 target remains OPEN because the source mapping, common-interval continuation, initial-trace interpretation, and actual formalization evidence are unresolved.

【严格】无阻尼全系统的质量归一化及 g 的缩放正确；阻尼方程 (2.1) 未提供，δ 的缩放只能作条件性判断。
【缺口】首个实质性桥接缺口是两级近似共同时间区间：命题 5.1 的 Tδ 可依赖 δ，不能直接覆盖最终解的任意 T<T*。
【严格／条件性】固定球质量锚点、局部 Poincaré 强制性、密度强收敛、平方根弱乘积识别、共同时间零测集及 N0002 数学匹配均可在明确的统一界与共同区间下证明。
【来源范围】仅核查了提供的摘录；未核查完整 PDF、阻尼方程、初边值条件、(2.8) 或被引用的椭圆逼近证明。
【严格】对已经存在且满足所列最终解空间的零质量解，可直接推出 ρ=u=θ=0，进而得到目标动量源恒等式。
【缺口】零解能否实现所有允许零密度初值，取决于未提供的初始迹定义；仅有守恒量迹不能替代未加权 u、θ 的初始迹。
【证据冲突】N0008 称 N0002 已通过当前门槛，但提供的 N0002 文本称 Lean 未运行；必须由父任务用实际版本化证据核对。N0008 精确目标仍 OPEN、Lean NOT_RUN。

UNRESOLVED
提供并核查 (2.1)、(1.3)–(1.4)、(2.5)、(2.8) 及截断定义 (3.24)，明确阻尼和初始迹。
证明第一层时间导数识别可延拓到第二层统一存在区间，或证明球近似在该区间具有统一估计。
核对源构造的局部极限与最终命名解、加权时间导数及其梯度确为同一对象。
完整核验椭圆初值逼近的兼容性、参数依赖和正性；摘录中的来源断言尚不等于独立证明。
核对 N0002 当前精确版本的实际构建、公理及语义审查证据；执行 N0008 精确目标形式化。
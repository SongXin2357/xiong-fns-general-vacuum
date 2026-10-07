SOURCE-FIDELITY AUDIT — DRAFT; formalization NOT_RUN.

1. Scope of the source assertion.
On PDF p.3, Definition 1.1 requires the derivatives occurring in the conservative equations (1.1) to be regular distributions and requires those equations to hold almost everywhere. For momentum, the time derivative explicitly occurring in (1.1), PDF p.1, is \(\partial_t(\rho u)\), rather than \(\partial_tu\). Consequently, Definition 1.1 alone does not explicitly provide a locally integrable representative of \(\partial_tu\).

Theorem 1.1, PDF p.3, (1.8), uses the same symbol \(u_t\) in \(\sqrt\rho u_t\in L^\infty_tL^2_x\) and \(\nabla u_t\in L^2_{t,x}\). Under the usual mathematical interpretation, these expressions refer to the weak time derivative of the same velocity \(u\), with its spatial derivative and density-weighted product. The text does not introduce independent fields for these quantities. Nevertheless, the displayed statement does not explicitly construct a jointly measurable, locally square-integrable representative of \(\partial_tu\), or explain how multiplication by \(\sqrt\rho\) is identified through the approximation limits. Thus the source asserts the regularity in standard notation; the supplied passages do not contain a separate proof of representative compatibility.

2. What the supplied limit passages establish explicitly.
PDF pp.16–17 describe the expanding-ball approximation: the cutoff fields are defined in (3.62), and p.17 states weak subsequential convergence to a limit satisfying (3.1). It then invokes “standard arguments” to conclude that the limit solves the damped problem (2.1). The supplied p.17 does not display the convergences identifying the time derivative, its weighted product, and its spatial gradient. Moreover, (3.1) and the complete damped equations are not included in this input, so their exact contents have not been audited here.

PDF p.23 invokes uniform estimates (4.2), (4.3), and (4.23), then “standard compactness arguments” to obtain a strong solution of the original system satisfying (1.8), initially except for the temperature integrability. This is an explicit assertion about the final original solution. It is not an explicit verification of the compatibility of the three derivative expressions. PDF pp.23–24, (4.30)–(4.32), subsequently use material derivatives and weighted time derivatives for that final solution; these calculations rely on the asserted interpretation and do not supply the omitted identification argument.

3. A local representative estimate available when the density has positive mass.
Here is a precise analytic estimate explaining how the displayed bounds can support the missing construction. Let \(B\subset\mathbb R^2\) be a fixed ball, let \(0\le r\le M\), and suppose \(\int_Br\,dx\ge m>0\). For every \(v\in H^1(B)\),
\[
 \|v\|_{L^2(B)}\le C(B,M,m)
 \bigl(\|\nabla v\|_{L^2(B)}+\|\sqrt r\,v\|_{L^2(B)}\bigr).
\]
Indeed, write \(\bar v=|B|^{-1}\int_Bv\). Poincare's inequality gives \(\|v-\bar v\|_2\le C_B\|\nabla v\|_2\). Also,
\[
 m|\bar v|\le \left|\int_Brv\right|+
 \left|\int_Br(v-\bar v)\right|
 \le (M|B|)^{1/2}\|\sqrt r\,v\|_2
       +M|B|^{1/2}C_B\|\nabla v\|_2.
\]
Combining these inequalities proves the estimate, componentwise for vector fields.

For a nonzero nonnegative density satisfying the continuity and weighted bounds in (1.8), a ball with a uniform positive mass on a compact time interval can be chosen: total mass is positive and conserved, while the weighted \(L^1\) bound controls the mass outside sufficiently large balls. Mass conservation itself requires justification from the continuity equation using spatial cutoffs; the flux \(\rho u\) is integrable by the displayed \(L^1\) density and weighted kinetic bounds. Applied to compatible approximate derivatives, the estimate yields local \(L^2_{t,x}\) bounds, using \(\nabla u_t\in L^2_{t,x}\) and \(\sqrt\rho u_t\in L^\infty_tL^2_x\).

To turn this estimate into a reconstruction, one must actually establish, along the approximation, the relevant local density convergence, the uniform positive-mass anchor, and convergence of the velocities in distributions. A weak local \(L^2\) limit \(v\) of their time derivatives then satisfies
\[
 \int v\,\psi=-\int u\,\partial_t\psi
 \qquad(\psi\in C_c^\infty),
\]
so \(v=\partial_tu\). Distributional passage identifies the gradient limit with \(\nabla v\). Suitable strong local convergence of \(\sqrt{\rho_n}\), together with weak local \(L^2\) convergence of \(v_n\), identifies the weighted limit with \(\sqrt\rho\,v\). For example, strong local \(L^2\) convergence of the square roots suffices when testing against bounded compactly supported functions. These identifications cannot be replaced by merely naming three unrelated weak limits with the same symbol.

Positive total mass is not explicitly imposed in the supplied (1.6)–(1.7). The normalization to mass one on PDF p.16 and the positive local mass assumption (4.1) on p.17 therefore do not cover identically zero density as written. This is a scope issue, not permission to add a hypothesis to N0007. The zero-density case can instead be handled directly for the final solution: conservative momentum gives the homogeneous Lamé equation. At almost every time, \(\nabla u\in L^2\) and \(u\in L^{q_2}\), with finite \(q_2=4/\alpha\). Taking spatial Fourier transforms, the Lamé symbol is invertible away from zero because \(\mu>0\) and \(2\mu+\lambda>0\). Thus the tempered distribution \(u\) has Fourier support at zero, is a polynomial, and its finite \(L^{q_2}\) norm forces \(u=0\). Hence its weak time derivative is zero. This is an independent analytic argument, not an argument displayed in the supplied source passages.

4. Remaining obligations for N0007.
The compatibility construction above is a missing written source argument that can plausibly be supplied from the approximation bounds and compactness, without requiring a positive density lower bound. Its required convergences have not been verified from the serialized pages. Even after representative compatibility is established, N0007 still requires a rigorous conservative-to-material product rule and a common full-measure time set for all spatial tests. Neither follows merely by citing the approximate cancellation passage. The supplied input contains no text of PDF pp.19–20 or (4.16), so that passage's proof and precise quantifiers have not been independently inspected in this audit.

【文献事实】p.3 的 (1.8) 按通常记号将 u_t、√ρu_t 和 ∇u_t 视为同一速度弱时间导数及其加权量、空间导数；没有显式构造共同可测代表或展开极限识别。
【严格】Definition 1.1 与 p.1 的保守动量方程直接涉及 ∂t(ρu)，不能仅凭该定义推出 u_t 的局部 L² 代表。
【草案】正质量情形可用密度加权 Poincaré 估计控制近似 u_t 的局部 L² 范数，再通过分布极限识别时间导数、梯度及加权量；所需紧性细节未在已提供页面展开。
【范围缺口】(1.6)–(1.7) 未明确排除全真空，而 p.16 的质量归一化及 p.17 的 (4.1) 使用正质量。全真空可另由原方程和有限 L^{q₂} 速度推出 u=0，但这不是所给源文的证明。
【文献事实】p.17 的极限结论属于带阻尼系统；p.23 明确宣称最终原系统解具有 (1.8)，但用 standard compactness arguments 概括关键识别步骤。

UNRESOLVED
未提供 (3.1)、(4.23) 的正文及全部近似紧性论证，无法核验重构局部 L² 代表所需的一致界和强收敛是否已完整证明。
需证明最终代表满足 √ρu_t 与 ∇u_t 的精确识别，不能把彼此独立的弱极限直接视为兼容。
N0007 的保守形式到物质导数形式的乘积法则，以及独立于分量和测试函数的共同时间零测集，仍需单独证明。
未提供 pp.19–20 的 (4.16) 原文，不能核验其近似系统消去结论或将其作为最终解的证明。
本次没有实际 Lean、TeX 编译或独立语义复核；N0007 仍为探索状态，精确目标形式化 NOT_RUN。
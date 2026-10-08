Independent focused audit: I find no false mathematical implication in the revised strict-viscosity argument under the natural distributional interpretation of the displayed source class and conservative initial conditions. The time-convolution repair is valid. Several sentences should be expanded as follows before treating the paper argument as complete. This is a paper-level assessment, not a formal certificate.

1. Source meaning and fixed-support Bochner argument.
The source defines derivatives as regular distributions and explicitly lists \(\nabla u_t\in L^2(\mathbb R^2\times(0,T))\). Distributional derivatives commute, so this entails
\[
\partial_t\nabla u=\nabla\partial_tu=G\in L^2((0,T)\times\mathbb R^2).
\]
It does not by itself entail that \(u_t\) is an unweighted integrable function; the proof correctly obtains that conclusion later using fixed support.

After the exterior argument, \(u(t)=0\) off \(B_b\) for almost every time. Its local Sobolev regularity implies \(u(t)\in H^2(\mathbb R^2)\). More explicitly, choose a fixed cutoff supported in \(B_{b+1}\) and equal to one near \(B_b\). Local \(H^2\) regularity follows from \(u\in L^{q_1}\), \(q_1\ge4\), and \(\nabla u\in H^1\); the cutoff equals \(u\) almost everywhere. The support bound and Hölder yield
\[
\|u(t)\|_2\le |B_b|^{1/2-1/q_1}\|u(t)\|_{q_1},
\]
so \(u\in L^\infty(0,T;H^2)\).

Fix \(0<\delta<T/2\), and convolve only at times whose convolution windows lie in \((0,T)\). Then \(u^\varepsilon\) is smooth in time with values in \(H^2\), and \(\partial_tu^\varepsilon\) vanishes off \(B_b\). Thus it belongs to \(H^1_0(B_{b+1})\), and
\[
\nabla\partial_tu^\varepsilon=G^\varepsilon,\qquad
\|\partial_tu^\varepsilon\|_{L^2(\delta,T-\delta;H^1)}
\le C_b\|G\|_{L^2(0,T;L^2)}.
\]
Weak compactness and convergence of the convolutions in distributions identify a limit \(U=\partial_tu\) on \((\delta,T-\delta)\). Distributional uniqueness identifies the limits on overlapping intervals. Taking an exhaustion and using the uniform bound gives
\[
u\in W^{1,2}(0,T;H^1),\qquad U\in L^2(0,T;H^1),\qquad\nabla U=G.
\]
No endpoint extension of \(G\), no density division, and no assumption on \(u_0\) in vacuum are needed. In particular, \(u\) has a representative in \(C([0,T];H^1)\). This fills the exhaustion step in the draft.

2. Flow and exceptional sets.
The stated bounds give \(u\in L^1_tW^{1,\infty}_x\), with spatially continuous representatives for almost every time. The global boundedness estimate uses local \(H^2\) embedding with a radius-independent constant. The transport formula first holds for almost every label. For each fixed time its right-hand side is continuous in the label: \(d(s,\cdot)\) has a continuous representative for almost every \(s\), and \(\|d(s)\|_\infty\) supplies an integrable dominating function. Together with \(\rho\in C_tW^{1,q}_x\), this permits the asserted continuous representative formula. One can first establish it simultaneously at rational times and then extend by temporal continuity. The flow and its inverse vary continuously in space-time, so the transported vacuum set is open.

For the elliptic identity, take countably many space-time boxes whose closures lie in that open set and countable dense spatial test families on each box. Remove the union of their null time sets, as well as the null sets for the spatial regularity and nonnegativity. At every remaining time, all spatial tests follow by continuity of the distributional pairings. Every point of \(\Omega_t\) lies in an eligible box, so this gives the elliptic identity throughout \(\Omega_t\) on one common full-measure time set.

At those times, temperature and velocity are spatially continuous. Consequently their exterior vanishing holds pointwise, on a time set independent of the exterior label. The flow equation then shows \(X(t,y)=y\) for every exterior label and every time. Bijectivity fixes the complementary closed ball. This avoids an uncountable union of exceptional sets.

The exterior superharmonic lemma is valid for the application, where \(p=q_2>1\). The logarithmic circular mean is nonnegative and concave; a negative secant slope would contradict nonnegativity at sufficiently large logarithmic radius. Thus it is nondecreasing, and finite \(L^p\) norm forces it to vanish. The distributional mean inequality propagates its zero set across the connected domain. If the lemma is stated for arbitrary positive finite \(p\), the displayed Jensen argument needs adjustment when \(p<1\); stating it for \(1\le p<\infty\) suffices here.

3. Initial kinetic trace.
The conservative initial condition must be used in its distributional trace sense. On the fixed ball, \(\rho(t)\to\rho_0\) uniformly and \(u(t)\to u_*\) strongly in \(L^2\). Therefore
\[
\rho(t)u(t)\longrightarrow\rho_0u_*\quad\text{in }L^2,
\qquad
\int\rho(t)|u(t)|^2\longrightarrow\int\rho_0|u_*|^2.
\]
The prescribed momentum trace identifies \(\rho_0u_*=\rho_0u_0\). On \(\{\rho_0>0\}\) this identifies the velocities; on its complement both weighted kinetic integrands vanish. Hence the kinetic trace is exactly the prescribed one. This requires neither an unweighted initial velocity identification nor an unweighted temperature trace.

4. Product rules and testing by velocity.
Write \(D=B_{b+1}\). From the continuity equation,
\[
\rho_t=-u\cdot\nabla\rho-\rho\,\operatorname{div}u\in L^2(0,T;L^q(D)).
\]
Here \(u\in L^\infty_{t,x}\), \(\rho\in L^\infty_tW^{1,q}\), and \(\operatorname{div}u\in L^2_tL^\infty_x\). With \(U=u_t\in L^2_tH^1_x\), time convolution gives the actual product identities
\[
(\rho u)_t=\rho U+\rho_tu\in L^2_tL^2_x,
\qquad
K'=\int\rho u\cdot U+\tfrac12\int\rho_t|u|^2\in L^1(0,T).
\]
The convolution limits are justified by strong convergence in the corresponding Bochner spaces and the uniform spatial bounds.

For almost every time the momentum equation is an identity in \(H^{-1}(D)\). Indeed, \(\rho u\otimes u\in L^\infty_tL^2_x\), \(S\in L^\infty_tL^2_x\), and \(P\in L^\infty_tL^2_x\). The last assertion follows from \(\|\rho\theta\|_2\le\|\rho\|_\infty^{1/2}\|\sqrt\rho\theta\|_2\). A countable dense test family gives a common time set for the equation, after which continuity of the dual pairing allows testing by \(u(t)\in H^1_0(D)\). Spatial smoothing proves the required integration by parts. In particular,
\[
\langle\operatorname{div}(\rho u\otimes u),u\rangle
=-\int\rho u\cdot\nabla(|u|^2/2)
=-\tfrac12\int\rho_t|u|^2.
\]
Meanwhile \(\langle(\rho u)_t,u\rangle=K'+\frac12\int\rho_t|u|^2\). These terms cancel, yielding exactly
\[
K'=-\int Q+\int P\,\operatorname{div}u.
\]
Thus the sign in the draft is correct, and testing by \(u\) can be justified without assuming it is an admissible smooth test beforehand.

5. Thermal trace and energy.
For a fixed smooth cutoff equal to one near \(B_b\), the conservative thermal equation gives the distributional scalar identity
\[
H'=\int Q-\int P\,\operatorname{div}u\in L^1(0,T).
\]
All cutoff errors vanish because the relevant fields vanish off the fixed ball. In particular \(\theta\in L^2_tL^{q_2}_x\) with fixed support is locally integrable, so \(\langle\Delta\theta,\chi\rangle=\langle\theta,\Delta\chi\rangle=0\) is legitimate. Also \(H\in L^\infty_t\), from the weighted temperature bound and bounded mass. Hence \(H\in W^{1,1}(0,T)\) and has endpoint values. Applying the conservative thermal initial trace to this cutoff identifies \(H(0)=c_v\int\rho_0\theta_0\). Consequently \(E=K+H=E_0\) for their continuous representatives. Their almost-everywhere nonnegativity extends to every time by continuity.

6. Virial and witness.
The stress trace is \(\operatorname{tr}S=2(\mu+\lambda)\operatorname{div}u\). Compact support of the global Sobolev velocity gives \(\int\operatorname{div}u=0\). Conservative testing therefore gives
\[
I'=2J,\qquad J'=2K+2(R/c_v)H,
\qquad I''\ge4\min(1,R/c_v)E_0.
\]
The prescribed mass and momentum traces identify \(I(0)\) and \(J(0)\). The coefficient \(2\beta E_0t^2\) after integration is correct. The upper bound uses an origin-centered ball; it is false for arbitrary ball centers with the unchanged moment.

For the proposed flat bump \(\psi\ge0\), \(\sqrt{\psi^2}=\psi\), and
\[
\sqrt{\rho_0}g_\varepsilon
=R\varepsilon(2\psi\phi\nabla\psi+\psi^2\nabla\phi)
=R\nabla(\rho_0\theta_0).
\]
Since \(u_0=0\), this is exactly (1.6), including its sign. Smooth compact support verifies every initial norm in (1.5); the density weighted norms are fixed, and the thermal and compatibility norms are \(O(\varepsilon)\). The mass is fixed and the positive energy tends to zero. This establishes compatibility of the data, not an independent construction of the source's solution.

At \(\mu+\lambda=0\), the stated exterior vector field has \(D(u)=(\operatorname{div}u)\operatorname{Id}/2\), hence \(Q=0\), although \(D(u)\ne0\). Its exterior \(L^p\) norm is finite for \(p>2\), including \(q_1\). It correctly invalidates that particular endpoint implication without providing a full-system counterexample.

【草案复核】未发现严格黏性子情形下的实质错误；固定支撑后的时间卷积—Poincaré 修复成立，能够得到实际的 u_t∈L²_tH¹_x。
源文 Definition 1.1 与 (1.7) 的自然分布导数解释支持 ∂t∇u=∇u_t；这不是对源文近似构造的独立认证。
应补写区间穷竭的统一范数估计、共同满测时间集，以及 H⁻¹ 方程测试 u 的密度论证。上面的推导补全了这些步骤。
初始动能与热能只需保守量初始迹；能量符号、二维应力迹和 virial 二次项常数正确。
光滑小能量族精确满足 (1.5)–(1.6)，包括兼容条件符号；超调和引理宜明确限定 1≤p<∞。
未发现需要报告的首个错误推论。结论仍是纸面证明草案；精确完整目标 Lean NOT_RUN，节点不得据此升级或解锁子节点。

UNRESOLVED
源文 (1.3) 没有在所给页面明确指定迹拓扑；论证使用保守初始条件至少具有分布迹含义。若项目采用其他解释，须单独解决源语义问题。
仅核验了输入中序列化的 PDF 第1–3页；未独立核验完整 PDF、给定哈希或两级近似构造。
完整目标的锁定 Lean 构建、公理依赖披露和形式化语义验收均为 NOT_RUN。
μ+λ=0 的端点不在本证明覆盖范围内。
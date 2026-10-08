DRAFT; exact-target Lean status: NOT_RUN. The following is an independent derivation from the supplied excerpts, not a verification of the full PDF or of unpublished dependencies.

1. A local coercivity estimate that does not presuppose regularity of the limiting time derivative.

Suppose smooth approximants satisfy, uniformly in their approximation index,
\[
0\le\rho_n\le K,\qquad \int_{B_N}\rho_n(t)\,dx\ge m>0,
\]
and
\[
\|\sqrt{\rho_n}\,\partial_tu_n\|_{L^\infty_tL^2_x}+\|\nabla\partial_tu_n\|_{L^2_{t,x}}\le C.
\]
For a fixed ball B_L, put D=B_{\max(N,L)} and c_n(t)=\fint_D\partial_tu_n(t). Poincare's inequality and the mass anchor give
\[
m|c_n|^2\le 2\int_{B_N}\rho_n|\partial_tu_n|^2+2K\int_D|\partial_tu_n-c_n|^2
\le 2\|\sqrt{\rho_n}\partial_tu_n\|_2^2+C_DK\|\nabla\partial_tu_n\|_2^2.
\]
Consequently,
\[
\|\partial_tu_n\|_{L^2(0,T;H^1(B_L))}\le C_{L,N,m,K,T}.
\]
This estimate is applied only to smooth approximants. It therefore avoids applying Lemma 2.4 to an unidentified final derivative. The same argument, with u_n in place of its time derivative and with the supplied second-derivative estimate, yields a uniform L^\infty(0,T;H^2(B_L)) bound for u_n.

2. Compactness and weighted identification, once these uniform approximation estimates and anchors are available.

On every fixed ball, extract a common diagonal subsequence such that
\[
u_n\to u\quad\hbox{strongly in }L^2(0,T;H^1(B_L)),\qquad
\partial_tu_n\rightharpoonup U\quad\hbox{weakly in }L^2(0,T;H^1(B_L)).
\]
The strong compactness follows from the local H^2 bound and the local L^2 bound for the time derivative. For every compactly supported space-time test function \psi,
\[
\int U\psi=-\int u\partial_t\psi.
\]
Thus U is one locally square-integrable distributional time derivative, and its local representatives agree on overlapping balls. Integration by parts in space identifies the weak limits of \nabla\partial_tu_n with \nabla U.

The continuity equation and the local estimates imply
\[
\partial_t\rho_n=-u_n\cdot\nabla\rho_n-\rho_n\operatorname{div}u_n
\quad\hbox{bounded in }L^2(0,T;L^q(B_L)).
\]
Here the local H^2 bound supplies the required local L^\infty bound for u_n, and the supplied spatial bounds control \nabla\rho_n and \operatorname{div}u_n. Compactness therefore gives strong local density convergence, in particular in L^2 on space-time cylinders. Since |\sqrt a-\sqrt b|^2\le|a-b| for a,b\ge0, the square roots converge strongly in local L^2. If
\[
\sqrt{\rho_n}\partial_tu_n\stackrel{*}{\rightharpoonup}A
\quad\hbox{in }L^\infty(0,T;L^2),
\]
then, for a bounded compactly supported \psi,
\[
\int\sqrt{\rho_n}\partial_tu_n\psi
=\int\partial_tu_n(\sqrt{\rho_n}\psi)
\longrightarrow\int U\sqrt\rho\psi.
\]
Hence A=\sqrt\rho U. This proves weighted identification, rather than defining U from A by division through vacuum. The global gradient and weighted bounds pass by weak lower semicontinuity and exhaustion.

This argument must be performed first for r\to\infty at fixed \delta, and then for \delta\to0. At the second level, the first-level derivative is already an actual H^1_loc function, so the same coercivity estimate applies to it. No relation between the two approximation indices is required.

For positive mass, a final-solution fixed-ball anchor follows from mass conservation and compactness of \{\rho(t):0\le t\le T\} in L^1: choose a ball capturing more than half the conserved mass uniformly in t. An anchor for smooth approximants requires its own justification. One sufficient justification is their conserved mass together with a uniform weighted L^1 density bound: if \int\rho_n\ge m_0 and \int\bar x^a\rho_n\le C, choose N so that C\inf_{|x|\ge N}\bar x^{-a}<m_0/2. Then \int_{B_N}\rho_n\ge m_0/2. For bounded-domain approximants, conservation additionally uses the zero velocity boundary condition. The source's estimates on pp.8 and 30 provide the weighted bounds under their stated positive-anchor hypotheses; this reasoning does not establish those estimates for zero mass.

3. Consequences for the final momentum equation once U has been identified.

The displayed final density class gives \rho\in L^\infty_t(L^1\cap L^\infty), since q>2. At almost every time,
\[
\|\rho U_i\|_1\le\|\sqrt\rho\|_2\|\sqrt\rho U_i\|_2,
\qquad
\|\rho u\cdot\nabla u_i\|_1
\le\|\sqrt\rho u\|_2\|\sqrt\rho\nabla u_i\|_2
\le\|\sqrt\rho u\|_2\|\rho\|_\infty^{1/2}\|\nabla u_i\|_2.
\]
Thus f_i\in L^1. Also
\[
\|P\|_2\le R\|\rho\|_\infty^{1/2}\|\sqrt\rho\theta\|_2,
\]
so V_i\in L^2. These estimates are time-integrable on (0,T).

Locally, \rho\in L^\infty_tW^{1,q}_x with \rho_t\in L^2_tL^q_x, while u\in L^\infty_tH^2_x and u_t=U\in L^2_tH^1_x. Temporal mollification on compact subintervals, followed by strong convergence of the factors and their derivatives in the indicated spaces, gives the distributional product rule
\[
\partial_t(\rho u_i)=\rho U_i+u_i\rho_t.
\]
The spatial Sobolev product rule gives
\[
\operatorname{div}(\rho u_i u)=\rho u\cdot\nabla u_i+u_i\operatorname{div}(\rho u).
\]
The continuity equation cancels the last terms. The conservative momentum equation consequently gives f_i=\operatorname{div}V_i in space-time distributions.

Choose, for each integer L, a countable subset of C_c^\infty(B_L) dense in the C^1 norm, and test the space-time identity against products of these spatial tests and arbitrary temporal tests. For each chosen spatial test, the resulting integrable function of time vanishes almost everywhere. The union of these exceptional sets, for both components and all L, together with the exceptional sets for the norm bounds, is one null set E. For t\notin E, the estimate
\[
|\langle f_i,\phi\rangle+\langle V_i,\nabla\phi\rangle|
\le\|f_i\|_1\|\phi\|_\infty+\|V_i\|_2\|\nabla\phi\|_2
\]
extends the identity to every compact smooth spatial test.

4. Zero mass: a conditional final-class argument, and the precise source obstruction.

If a final strong solution in the stated class exists with zero initial density, its density remains zero. Indeed, the continuity equation tested with expanding cutoffs gives conservation of mass because
\[
\|\rho u\|_1\le\|\sqrt\rho\|_2\|\sqrt\rho u\|_2
\]
is uniformly bounded, and the cutoff error tends to zero. Nonnegativity then gives \rho=0. The momentum equation reduces to
\[
\mu\Delta u+(\mu+\lambda)\nabla\operatorname{div}u=0.
\]
At almost every time u\in L^{q_1}(\mathbb R^2). In Fourier distributions, the Lamé symbol is invertible away from the origin, because \mu>0 and 2\mu+\lambda>0. Thus the Fourier transform of u is supported at the origin, so u is a polynomial; its finite L^{q_1} norm forces u=0. Hence its distributional time derivative is U=0, and f_i=V_i=0. This proves the requested identities for any such already-existing zero-mass final solution, with the derivative quantities interpreted as actual distributional derivatives.

However, the supplied source does not construct that solution through its stated approximation scheme. Page 19 assumes \int_{B_{N_1}}\rho_0\ge1/2; page 33 assumes \|\rho_0\|_1=1 and constructs \widehat\rho_0^r with \int_{B_{N_2}}\widehat\rho_0^r\ge1/2 while requiring weighted L^1 convergence to \rho_0. For \rho_0=0 these requirements are contradictory: weighted L^1 convergence implies \int_{B_{N_2}}\widehat\rho_0^r\to0. Positive mass cannot be imposed without loss of generality in the zero-mass case.

Accordingly, the complete preregistered source-based assertion is not closed by these excerpts. The first definite missing source implication is that the actual final solution produced by the stated two-level construction exists for every allowed zero-mass datum. A final-class conditional argument cannot certify that missing construction. In addition, the exact published N0002 statement was not serialized, so its exact hypotheses cannot be independently checked or its application certified here.

【草案】正质量情形的关键识别可以通过近似解上的局部 Poincaré 强制估计完成：先取得 u_t 的 L²_tH¹_loc 弱极限，再用密度平方根的局部强收敛识别加权极限，避免对尚未识别的最终 U 使用 Lemma 2.4。
【严格推导，待独立核验】在已存在且满足所列最终解类的零质量解上，质量守恒推出密度为零；Lamé 方程与速度的有限 L^{q1} 范数推出速度为零，因此可取 U=0。此论证不补足源文的零质量构造。
【源文摘录中的明确缺口】第19页的正质量锚点与第33页的质量归一化不能覆盖零质量；第33页近似密度的固定正质量锚点与收敛到零密度直接矛盾。
【草案】识别 U 后，f∈L¹、V∈L²、保守式转物质式及共同时间零测集都有明确推导路线；结论仅为几乎处处时间成立。
N0008 完整目标保持 OPEN／DRAFT；Lean、TeX 编译及公开晋升门槛均未执行。

UNRESOLVED
需要补充或修复 Wang-v3 实际两级构造对全部零质量允许初值的覆盖，不能用正质量归一化替代。
正质量推导仍需父进程核验两级近似估计、截止函数及共同存在时间的实际适用范围，并将任意正质量情形的常数依赖写入证据。
没有收到 N0002 的精确已发表陈述，无法认证最后一步对其全部假设的匹配。
仅审阅提供的摘录，未核验完整 PDF 的精确定理位置或其他页内容；未实际运行 Lean，完整目标形式化为 NOT_RUN。
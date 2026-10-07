DRAFT; exact-target Lean verification NOT_RUN. Only the serialized Wang-v1 pages 1 and 3 have been inspected. The certificate and exact statement of N0002 have not been supplied, so the final invocation of that node remains conditional on the parent's certificate check.

Fix 0<T<T*. All function-space statements below are restricted to this interval. Write M=ess sup_t ||rho(t)||_1 and B=ess sup_t ||rho(t)||_infty. The continuous embedding W^{1,q}(R^2) into L^infty(R^2), q>2, and (1.8) give M,B<infty. This embedding follows, for example, by applying the local Sobolev inequality on unit balls, with translation-independent constant, and taking the supremum over their centers. No positive lower bound for rho is used.

1. Source-space estimates.
For almost every t,
||P(t)||_2 <= R B^{1/2} ||sqrt(rho) theta(t)||_2,
||rho u_{i,t}(t)||_1 <= M^{1/2} ||sqrt(rho) u_{i,t}(t)||_2,
||rho u dot grad u_i(t)||_1 <= B^{1/2} ||sqrt(rho)u(t)||_2 ||grad u_i(t)||_2.
The first two inequalities are Cauchy--Schwarz; the last follows by writing the integrand as (sqrt(rho)|u|)(sqrt(rho)|grad u_i|). Thus f_i belongs to L^infty(0,T;L^1(R^2)). Furthermore,
||V_i(t)||_2 <= [mu+sqrt(2)|mu+lambda|] ||grad u(t)||_2 + ||P(t)||_2,
so V_i belongs to L^infty(0,T;L^2(R^2;R^2)). Here |div u|<=sqrt(2)|grad u|. These estimates require neither the weighted gradient estimate nor higher temperature regularity.

2. Local spatial and continuity regularity.
Since alpha=min(a/2,1) lies in (1/2,1], q_2=4/alpha is finite and at least 4. On every bounded ball K, the bounds u in L^infty_t L^{q_2}_x and grad u in L^infty_t H^1_x imply u in L^infty_t H^2(K). The two-dimensional local embedding H^2(K) into L^infty(K) gives u in L^infty_t L^infty(K), with a slightly larger ball used to formulate the estimate. Consequently the spatial Leibniz rule yields
rho_t=-div(rho u)=-u dot grad rho-rho div u in L^infty(0,T;L^2(K)).
Indeed grad rho is locally L^2 because q>2, u is locally bounded, and rho is bounded. Hence rho belongs locally to W^{1,infty}(0,T;L^2).

For completeness, total mass is constant without any moment assumption. The flux satisfies
||rho u(t)||_1 <= M^{1/2}||sqrt(rho)u(t)||_2.
Testing continuity against eta(t) chi(x/L), where chi equals one near the origin and has bounded compact support, bounds the spatial flux term by C L^{-1}||eta||_1 ess sup_t||rho u(t)||_1. Letting L tend to infinity gives distributional constancy of the total mass. Continuity of rho into L^1 identifies this constant at every time. If it is zero, nonnegativity implies rho=0, f_i=P=0, and the conservative momentum equation directly gives the required stress identity; no material product rule is needed in that case.

3. The exact local time-regularity obligation.
The remaining nontrivial issue is the interpretation and justification of u_t in the displayed class. The notation sqrt(rho)u_t and grad u_t is ordinarily understood to refer to the same weak time derivative, represented by a measurable function, with its indicated spatial weak derivatives. Under this usual function-space interpretation, u_t belongs to L^2_loc in space-time when the mass is positive, as follows.

Choose a ball D with inf_{0<=t<=T} integral_D rho(t)>0. Such a ball exists: the compact image of [0,T] in L^1 has uniformly small tails, and the total mass is a fixed positive number. Let this lower bound be m>0. On a larger ball D' containing both D and any prescribed compact spatial set, write c as the spatial average of a locally H^1 function v. Poincare's inequality and Cauchy--Schwarz give
m|c| <= (integral_D rho)^{1/2}||sqrt(rho)v||_{L^2(D)} + B |D|^{1/2}||v-c||_{L^2(D)},
||v-c||_{L^2(D')} <= C_{D'}||grad v||_{L^2(D')}.
It follows that
||v||_{L^2(D')} <= C(m,B,D,D')[||sqrt(rho)v||_{L^2(D)}+||grad v||_{L^2(D')}].
The same inequality applies first by truncation if v is only locally integrable with distributional gradient in L^2; that spatial hypothesis implies v is locally H^1. Applying it to v=u_t and integrating in time gives u_t in L^2(0,T;L^2(D')). Thus u belongs locally to W^{1,2}_t L^2_x.

This argument must not be used to assert that an arbitrary distribution u_t has a function representative merely because its spatial gradient is L^2. The weighted expression sqrt(rho)u_t must already have the usual weak-function meaning. If the serialized class is instead read as allowing a distribution-valued u_t with an unspecified multiplication by sqrt(rho), the first exact gap is precisely this representative/weighted-product interpretation. Definition 1.1 alone, which mentions derivatives involved in the conservative equations, does not explicitly settle that alternative reading. A faithful formalization should make the conventional meaning of the displayed regularity explicit and then prove the local estimate; it should not silently add local time regularity as a new PDE hypothesis.

4. Conservative-to-material identity under that conventional interpretation.
The established local bounds are rho in L^infty, rho_t in L^infty_t L^2_loc, u in L^infty_t L^infty_loc, and u_t in L^2_loc. They justify, in distributions,
partial_t(rho u_i)=rho u_{i,t}+rho_t u_i.
One direct proof is to mollify rho and u in time on an interior time interval. For the mollified functions the ordinary product rule holds. The products converge locally in L^1: the derivatives converge in L^2; the undifferentiated functions converge in L^2 and have uniform local L^infty bounds; bounded almost-everywhere convergence also handles multiplication by the limiting L^2 derivatives. Passing to the limit against compactly supported tests proves the formula.

Spatially, local H^2 regularity of u and W^{1,q} regularity of rho justify
sum_j partial_j(rho u_i u_j)
= rho sum_j u_j partial_j u_i + u_i div(rho u).
All terms are locally integrable. Combining both identities with continuity gives
partial_t(rho u_i)+sum_j partial_j(rho u_i u_j)
= rho(u_{i,t}+u dot grad u_i)=f_i
as space-time distributions. The original conservative momentum equation therefore gives f_i=div V_i, with exactly the sign convention in the registered target.

5. A common null set for all spatial tests.
For eta in C_c^infty(0,T) and phi in C_c^infty(R^2), the distributional identity gives
integral_0^T eta(t)[integral f_i(t)phi + integral V_i(t) dot grad phi]dt=0.
For each fixed phi and i, the bracket is integrable and vanishes almost everywhere. To avoid an uncountable union of exceptional sets, for each integer n choose a countable subset D_n of C_c^infty(B_n) dense in that set for the C^1 norm on the closed ball. Such a subset exists because C^1 on a compact ball is a separable metric space and every subspace is separable. Take the union of the exceptional sets for both components and all members of all D_n, together with the exceptional sets for the source-space bounds. This union E is null.

Fix t outside E. For any phi in C_c^infty(R^2), choose n containing its support and phi_k in D_n converging to phi in C^1. Then
|integral f_i(t)(phi_k-phi)| <= ||f_i(t)||_1 ||phi_k-phi||_infty,
|integral V_i(t) dot grad(phi_k-phi)| <= ||V_i(t)||_2 |B_n|^{1/2} ||grad(phi_k-phi)||_infty.
Both errors tend to zero. Hence integral f_i phi=-integral V_i dot grad phi for every such phi, simultaneously for i=1,2.

6. Mean cancellation can also be checked directly.
This independently checks the analytic conclusion, without asserting anything about the unsupplied N0002 certificate. For L>1, take the radial Lipschitz cutoff chi_L equal to one on |x|<=L, equal to 1-log(|x|/L)/log L on L<|x|<L^2, and zero outside L^2. Its gradient satisfies
||grad chi_L||_2^2=2 pi/log L.
The spatial identity extends to this compactly supported Lipschitz test by spatial mollification: the tests converge uniformly and their gradients converge in L^2. Therefore
|integral f_i chi_L| <= ||V_i||_2 (2 pi/log L)^{1/2} -> 0.
Since 0<=chi_L<=1 and chi_L tends pointwise to one, dominated convergence using f_i in L^1 gives integral f_i=0. This argument highlights the logarithmic cutoff needed in dimension two; a single-scale cutoff has an L^2 gradient norm that does not tend to zero.

Conclusion: the registered spatial conclusion has a complete analytic draft under the conventional weak-function interpretation of (1.8). The interpretation of u_t is the only identified source-definition issue needing explicit semantic confirmation. There is no inference of global existence, no zero-momentum assumption, and no claim of Lean certification.

【草案】源空间估计直接给出 f_i∈L∞_tL¹_x、V_i∈L∞_tL²_x；不需要密度正下界、额外矩或小性。
【草案】在(1.8)通常的弱导数函数解释下，正质量提供局部锚定，可结合√ρu_t与∇u_t证明u_t∈L²_loc，从而严谨完成保守形式到物质导数形式的转换。
【草案】可数C¹稠密测试集与连续性延拓给出同时独立于分量和测试函数的共同零测集。
【草案】二维对数截断直接推出∫f_i=0，并独立检查最终解析结论；单尺度截断不足以完成这一步。
【来源范围】仅检查输入序列化的Wang-v1第1、3页。数学证明为DRAFT；Lean与公共提升门槛均为NOT_RUN。

UNRESOLVED
需确认(1.8)中的u_t、√ρu_t及∇u_t确实采用同一弱时间导数的函数代表解释。若仅允许未指定乘法的分布解释，则首个缺口是u_t的局部函数代表，不能由∇u_t∈L²单独推出。
未提供N0002的精确Lean类型、实际构建证据或公理清单；父实例须核对其与本次得到的L¹源、L²应力及所有光滑紧支测试恒等式完全匹配。
未执行Lean、TeX编译、文件登记或独立语义认证；本输出不能解锁研究树后继节点。
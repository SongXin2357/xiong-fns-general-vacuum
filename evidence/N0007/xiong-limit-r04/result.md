Audit status: DRAFT. This audit uses only the serialized excerpts, not the complete PDF. Source fidelity is therefore limited to the displayed passages. No shell, LaTeX, or Lean execution is claimed.

1. First insufficiently justified step.

The first displayed local derivative estimate is mathematically valid on a common interval provided that the density upper bound and positive local mass anchor hold there uniformly in r. However, the candidate does not explicitly establish that its interval lies inside both the interval of Proposition 3.1 and the anchor interval in (3.10). Equation (3.10) is conditional on (3.8); it is not an unconditional mass bound on any chosen short interval. The correction is to choose a common interval after obtaining a uniform kinetic-energy bound from (3.5), and to propagate the anchor directly. The supplied excerpts assert common-time estimates in the proof on p.16, but do not display the continuation argument extending every initially short-lived ball solution to that common interval. This remains a source-proof obligation if Proposition 3.1 and the p.16 assertion are themselves being audited rather than accepted.

2. Explicit propagation of a local mass anchor.

Let chi be a smooth cutoff equal to one on B_N, supported in B_{2N}, with |grad chi| <= C/N. For a nonnegative density satisfying continuity, conserved mass at most M, and sup_t ||sqrt(rho)u||_2 <= U, integration against chi gives
\[
 \left|\int\rho(t)\chi-\int\rho(0)\chi\right|
 \le {C\over N}\int_0^t\int\rho|u|
 \le {C\over N}M^{1/2}Ut.
\]
Thus an initial anchor of 1/2 yields mass at least 1/4 in B_{2N} whenever t <= N/(4CM^{1/2}U). On the ball approximations the cutoff is supported strictly inside B_r; on the whole plane the finite weighted kinetic energy makes its flux integrable. This supplies the needed uniform anchor without importing the unprovided proof in [21]. Its constants depend on N, M, U and the chosen cutoff. No global unweighted velocity norm is needed.

3. First-stage local estimates.

Fix delta and accept the radius-uniform bounds and common existence interval asserted on p.16. The approximating initial values of psi_0 are uniformly bounded: (3.58)--(3.60), (3.59), and the displayed bound on g^r control its terms. Restrict the interval further as in step 2. The weighted density bound gives a uniform density upper bound on each fixed ball containing the mass anchor. This can be justified with interior Sobolev estimates, whose constants depend on the fixed ball, avoiding an unstated radius-uniform extension theorem.

For a fixed ball B_L containing the anchor, the proof of (2.11), with the average taken over B_L, gives
\[
 \|w\|_{L^2(B_L)}
 \le C_L\bigl(\|\sqrt\rho\,w\|_2+
 (1+\|\rho\|_{L^\infty(B_L)}^{1/2})\|\nabla w\|_2\bigr).
\]
Here the mass of B_L is bounded below by the anchor mass. This proves the candidate's estimate for an arbitrary compact K contained in B_L. One cannot literally apply the displayed (2.11), whose left side is the anchor ball, to every K without this enlargement argument or use of (2.9).

Classical regularity (2.7) permits this inequality for w=u_t^r and w=u^r. Equations (3.4)--(3.5) then imply, on each fixed ball,
\[
 \sup_r\|u^r\|_{L^\infty(0,\tau;H^2(B_L))}<\infty,
 \qquad
 \sup_r\|u_t^r\|_{L^2(0,\tau;L^2(B_L))}<\infty.
\]
The constants may depend on delta, L and the fixed initial bounds, but not r. Interior H^2 embedding in two dimensions bounds u^r locally in L^infty. Therefore continuity yields
\[
 \sup_r\|\rho_t^r\|_{L^\infty(0,\tau;L^2(B_L))}<\infty
\]
from the local bounds on u^r, grad rho^r, rho^r and div u^r.

4. Strong convergence, with its temporal justification.

The derivative estimate gives
\[
 \|u^r(t)-u^r(s)\|_{L^2(B_L)}\le C_L|t-s|^{1/2},
\]
and the density derivative gives the analogous estimate with |t-s|. The uniformly bounded H^2 velocity values and H^1 density values are relatively compact in L^2 on each fixed ball. The metric Arzela--Ascoli argument therefore yields subsequences converging strongly in C([0,tau];L^2(B_L)). For estimates originally stated as essential suprema, use the local time-continuous representatives supplied by the derivative bounds; the compactness bounds extend to their values by weak lower semicontinuity. A diagonal subsequence over integer balls gives both strong convergences simultaneously. The candidate's conclusion is correct after these details and the interval qualification are supplied.

5. Common derivative and weighted-limit identification.

Extract local weak L^2 limits v of u_t^r, a global weak L^2 limit G of grad u_t^r, and a global weak L^2 limit z of sqrt(rho^r)u_t^r, using one subsequence. For compactly supported smooth space-time tests, integration by parts and strong local convergence give
\[
 v=\partial_tu,\qquad G=\nabla v
\]
as distributions. Thus v belongs to L^2(0,tau;H^1_loc), with global square-integrable spatial gradient.

The square-root estimate must be applied in space-time:
\[
 \|\sqrt{\rho^r}-\sqrt\rho\|_{L^2((0,\tau)\times B_L)}^2
 \le\|\rho^r-\rho\|_{L^1((0,\tau)\times B_L)}\longrightarrow0.
\]
For each bounded compactly supported test eta, sqrt(rho^r)eta converges strongly in local space-time L^2. Consequently z=sqrt(rho)v distributionally and almost everywhere locally. Since z is globally L^2, this also proves that the identified product is globally L^2. Compactly supported bounded tests are dense in global L^2, and the identification then extends to all such tests. This argument gives a single velocity time derivative and its spatial gradient; it does not require positivity of rho at every point.

The L^infty_t L^2_x weighted derivative bound also survives: for every measurable temporal set A, weak lower semicontinuity gives int_A ||z(t)||_2^2 dt <= C^2 |A|, hence ||z(t)||_2 <= C almost everywhere. A mere global L^2 weak-limit argument without this additional observation would not recover the full temporal norm in (3.1).

6. Cutoff extension.

The cutoffs in (3.62) are independent of time. On every fixed compact set they equal one for sufficiently large r, so all preceding local derivative and compactness arguments concern the original fields and are unaffected by the boundary. The cutoff density and velocity need not satisfy the continuity equation globally. Their extra terms must not be discarded in a whole-plane calculation.

Global H^2 estimates for the cutoff velocity would require checking terms such as u^r grad^2(phi_r), and cannot be inferred from zero extension alone. They are unnecessary here: extract global weak limits of zero-extended grad u_t^r and sqrt(rho^r)u_t^r as L^2 fields, and identify them by interior tests. Zero extension of u_t^r as an H^1 function is permissible if its boundary trace is zero, as follows from the classical time-independent Dirichlet condition, but this stronger extension claim is not needed.

7. Second-stage delta limit.

After the first stage has actually established the common representative, almost every time slice of u_t^delta lies in the class required by Lemma 2.3. Only then may that lemma be used for the whole-plane damped solutions. Applying it directly to an arbitrary distributional derivative would be invalid. The candidate has the correct order in principle, but this inherited membership must be stated explicitly.

Uniformity in delta requires uniform psi_0^delta, N_2, initial mass, and a common existence interval. The displayed estimates (4.25), (4.27), (4.29), together with rho_0^delta=rho_0, control psi_0^delta, including delta||theta_0^delta||_2^2. For positive initial mass, one fixed anchor can be chosen. Equations (4.2) and the explicit anchor propagation above then give the same local H^2, local time-derivative, and compactness estimates uniformly in delta. Repeat steps 4--5 to identify the final common derivative.

The source assertion on p.23 supplies a common interval, but the displayed a priori estimates alone do not prove continuation of solutions whose initially constructed lifetimes T_delta might be shorter. That continuation bridge is not displayed in the supplied excerpts. Also, Lemma 4.5 alone is a bootstrap inequality involving psi(T), not a closed uniform bound; closure uses Proposition 4.1 and the argument on p.22. Auditing the numerical bootstrap would require explicit constants and a continuity argument, rather than treating the printed choice of T* as a complete derivation.

8. Finite velocity integrability and avoidance of circularity.

At the ball stage, local H^2 velocity and weighted kinetic energy suffice; no uniform global L^p velocity estimate is needed. At the damped whole-plane stage, the same local and weighted quantities suffice for representative reconstruction. Neither reconstruction requires (4.3).

Moreover, cancellation in (4.16) need not depend on the L^{q_2} estimate that it helps establish. Before (4.3), whenever the identified weighted derivative exists,
\[
 \|\rho\dot u\|_1
 \le \|\rho\|_1^{1/2}\|\sqrt\rho u_t\|_2
 +\|\sqrt\rho u\|_2\|\rho\|_\infty^{1/2}\|\nabla u\|_2.
\]
Also ||P||_2 <= R||rho||_infty^{1/2}||sqrt(rho)theta||_2. These establish integrability for the expanding-cutoff argument without the subsequent velocity integrability conclusion. They yield cancellation almost everywhere in time; the source's every-time claim needs additional representative and temporal regularity justification not supplied here.

9. The printed cutoff limit.

On p.20 the correct direction is r tending to infinity. Indeed, phi_r tends pointwise to one in that direction, and ||grad phi_r||_2 is uniformly bounded in dimension two. For f in L^1 and V in L^2 satisfying div V=f,
\[
 \left|\int f\phi_r\right|
 \le C\|V\|_{L^2(\{r/2\le|x|\le r\})}\longrightarrow0,
 \qquad \int f\phi_r\longrightarrow\int f.
\]
When r tends to zero, phi_r tends to zero almost everywhere and the left side tends to zero regardless of the integral of f. Thus the printed direction cannot establish (4.16).

10. Conditional N0007 versus the existence proof.

If the original solution and exactly (1.8) are assumptions of N0007, neither approximation limit is a prerequisite for that conditional theorem. Finite q_2 and grad u in H^1 give u in H^2_loc almost everywhere, with uniform local bounds. Reading the weighted derivative in (1.8) as a product with the actual regular velocity derivative, its stated spatial gradient and local positive-mass anchor give local L^2 control of u_t. The local Sobolev product rules then turn conservative momentum and continuity into rho(u_t+u dot grad u)=div V in space-time. The preceding norm estimates give f in L^1 and V in L^2.

To obtain one exceptional temporal set, take a countable C^1-dense family of compactly supported smooth spatial tests on each integer ball, use temporal tests and Fubini for each member and both components, and unite their exceptional null sets with those for the norms. The estimate
\[
 |\langle f,\phi\rangle+\langle V,\nabla\phi\rangle|
 \le\|f\|_{L^1(B_L)}\|\phi\|_\infty
 +\|V\|_{L^2(B_L)}\|\nabla\phi\|_{L^2(B_L)}
\]
extends the identity to every smooth compactly supported test. Application of the exact N0002 statement remains conditional on the parent's certificate, which was not serialized here.

If weighted derivative notation is instead intended as an abstract weighted limit unrelated to the regular derivative, that reading is insufficient for this product rule. The representative reconstruction above addresses precisely that ambiguity in the existence argument; it must not be concealed in notation.

11. Zero mass.

The source's normalization ||rho_0||_1=1 cannot cover rho_0 identically zero. The positive-mass reconstruction cannot be extended to that case by claiming an anchor. This is a gap in its coverage, not a refutation of the conditional N0007 cancellation: for an existing nonnegative solution in the stated class, continuity and the integrable flux rho u imply conservation of mass by expanding cutoffs. Zero initial mass then gives rho=0, hence f=0 and P=0 almost everywhere. Momentum supplies the spatial stress identity. This argument does not construct a zero-mass solution or verify Wang's existence theorem for zero-mass data.

【草案】两阶段代表元重建在正质量分支上可补成条件性证明；首个不足是首段未明确选取同时受共同存在时间、闭合估计和质量锚控制的时间区间。
【草案】任意紧集上的加权 Poincare 控制需扩大固定球或使用 (2.9)；不能直接把 (2.11) 的锚球左端换成任意紧集。
【草案】强局部收敛、同一时间导数及其空间梯度、加权弱极限识别均有明确补证路线；恢复加权导数的 L∞ 时间界还需单独论证。
【来源核验】δ 一致性依赖初始 ψ₀ 一致有界，所给 (4.25)、(4.27)、(4.29) 足以控制这些项；Lemma 4.5 本身不是闭合的一致估计。
【来源核验】p.20 的 r→0 不能证明总积分消失；该截止计算必须取 r→∞。原文每时刻结论也强于当前可得的几乎处处时间结论。
【范围】正质量近似路线不覆盖零质量存在性；直接假设原解满足 (1.8) 的 N0007 与证明 Wang 存在定理是不同任务。
【状态】仅核查了序列化摘录；N0007、完整 Lean 覆盖及全局定理保持 OPEN／NOT_RUN。

UNRESOLVED
所给摘录未展示球解和阻尼解延拓至共同时间区间的完整论证；不能以先验估计自动替代延拓证明。
未提供完整 PDF、被引用的 [21] 证明及省略的 Section 3 推导，不能声称完整来源忠实性核验。
本重建只处理速度时间导数识别，不完成温度紧性、全部非线性极限、初值恢复、唯一性或整个 (1.8) 的存在性证明。
正质量分支的质量守恒、局部乘积规则及时间切片步骤仍需父项目独立语义复核和实际形式化。
N0002 精确 Lean 类型及证书未包含在输入中，当前仅能条件性引用其应用。
零质量存在性以及原文 (4.16) 的每时刻量词未获证明。
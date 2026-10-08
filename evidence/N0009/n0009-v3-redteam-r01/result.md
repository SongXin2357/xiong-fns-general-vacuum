Adversarial verdict: the strict-viscosity argument appears analytically repairable under the literal interpretation of Definition 1.1 and (1.7). I found no counterexample to the origin-centred version. However, the candidate's Step 6 does not yet supply a complete proof of its asserted weighted material chain rule. This is the first substantial unproved analytic implication in the written argument, rather than evidence that the conclusion is false. The arbitrary-centre formulation also has a separate elementary defect.

1. Geometry of the registered upper bound.
If B_b means a ball of radius b with arbitrary centre c, then I(t) <= Mb^2 is false in general, including at t=0. For example, translate a fixed smooth density bump far from the origin while retaining its mass and support radius. Its origin-centred second moment grows quadratically with the translation. The corrected statement either requires B_b={|x|<=b}, uses M(|c|+b)^2 as an upper bound, or uses the centred moment integral rho|x-c|^2 and centred initial momentum. Thus the literal arbitrary-centre quantitative target cannot be promoted unchanged.

2. Transport and the common exceptional-time set.
The bounds in (1.7) imply u in L^infinity_t L^infinity_x and nabla u in L^1_t L^infinity_x on every finite interval. The latter follows from nabla u in L^2_t W^{1,q}_x, q>2. These bounds give a spatially bi-Lipschitz Caratheodory flow. The continuity equation and rho in C_t W^{1,q}_x support the characteristic density formula, with the initial value supplied by the conservative density trace.

The uncountable collection of particles does not create a fatal exceptional-set problem. First obtain, on one common full-measure set of times, the sliced vacuum equation, the relevant Sobolev representatives, and the exterior rigidity conclusion. At each such time, the continuous spatial representative of u vanishes at every point of Omega_t, not merely at almost every point. Consequently, for each exterior label y, u(t,X(t,y))=0 outside that same time-null set. The flow integral equation then gives X(t,y)=y for every time and every exterior label. It would be invalid to use spatial almost-everywhere vanishing directly on individual trajectories; spatial continuity is the necessary repair, and (1.7) supplies it.

For slicing, use the open spacetime set U={(t,x): |X(t,.)^{-1}(x)|>b}. It is open because the flow and its inverse are continuous. Cover U by countably many spacetime boxes with closures inside U. Distributional slicing on those boxes yields one common exceptional-time set. This avoids taking an uncountable union of null sets indexed by spatial tests or particles.

3. Exterior temperature and strict rigidity.
The conservative equation has the correct vacuum sign: -kappa Delta theta=Q, where Q=2mu|D(u)|^2+lambda(div u)^2. Its trace decomposition in dimension two is
Q=2mu|D(u)-(div u)Id/2|^2+(mu+lambda)(div u)^2.
The exterior superharmonic lemma is sound. Circular averaging gives F''<=0 for F(s)=m(exp s); nonnegative concavity on a half-line forces monotonicity, and finite exterior L^p norm forces F=0. The local superharmonic mean inequality propagates zero through the connected exterior component. At almost every time, (1.7) gives the required local H^2 regularity and finite L^{q_2} norm of theta.

For mu+lambda>0, Q=0 forces D(u)=0. The displayed distributional second-derivative identity then forces an affine rigid motion, and finite exterior L^{q_1} norm forces that motion to vanish. These steps do not require a positive density lower bound. Fixed support follows as above.

4. The missing material-chain-rule proof can be repaired without adding a density lower bound.
The expression sqrt(rho)u_t must denote the product with the actual distributional time derivative of u. Merely obtaining an unidentified weak limit of approximate weighted derivatives would not suffice. Under the literal statement of (1.7), however, there is a useful additional estimate omitted from the candidate.

After fixed support is established, let D be a bounded connected ball containing B_b. Write A=sup_t ||rho(t)||_infinity and M=integral rho(t)>0. For f in H^1(D), let f_D be its spatial mean. Poincare's inequality and support of rho inside D give
sqrt(M)|f_D| <= ||sqrt(rho)f||_2 + sqrt(A)||f-f_D||_{L^2(D)}.
Therefore
||f||_{L^2(D)} <= C(D,M,A)(||nabla f||_{L^2(D)}+||sqrt(rho)f||_2).
The estimate extends to locally integrable functions with distributional gradient in L^2 by the corresponding local Poincare argument. Apply it componentwise to the actual u_t. The bounds nabla u_t in L^2_{t,x} and sqrt(rho)u_t in L^infinity_t L^2_x imply u_t in L^2_t L^2(D). Thus u belongs locally to W^{1,2}_t L^2_x as well as possessing the stated spatial regularity.

This gives a concrete route to the material chain rule. Approximate u in local spacetime Sobolev norms, compose with the bi-Lipschitz flow, and use bounded Jacobians on each finite interval to pass to the limit. For smooth approximants the derivative is u_t+u dot nabla u. The transported mass identity then gives, for the limit V(t,y)=u(t,X(t,y)),
||V_t(t)||_{L^2(rho_0dy)} <= ||sqrt(rho)u_t(t)||_2 + ||u(t)||_infinity ||sqrt(rho)nabla u(t)||_2.
The right side is uniformly bounded by (1.7), bounded density, and the velocity interpolation estimate. Hence V has a Lipschitz representative in L^2(rho_0dy), extending strongly to t=0. Testing the conservative momentum trace against smooth spatial tests identifies its endpoint with u_0 in L^2(rho_0dy). This establishes the kinetic energy trace without assuming an unweighted strong velocity trace at zero.

The candidate's claim that each mollified product converges is too compressed to constitute this proof. The local unweighted estimate above supplies the missing control and prevents the weighted derivative from being treated as an independent field. It remains necessary to implement the approximation and composition argument explicitly in any final proof or formalization.

5. Energy with vacuum and conduction.
The local time regularity just described supports momentum testing by u on intervals away from zero. No division by rho is necessary. The kinetic identity is K'+integral Q=integral P div u. The conservative thermal identity is H'=integral Q-integral P div u after spatial integration. These signs agree with (1.1).

Choose a compactly supported smooth cutoff equal to one on a neighbourhood of B_b. Since theta and u vanish outside B_b and have global weak spatial derivatives, the Laplacian and viscous cutoff terms vanish by distributional integration by parts. There is no omitted interface flux: any such distribution would already be present in the global weak derivatives and equations. The identity integral partial_j u_i partial_i u_j=integral(div u)^2 identifies the integrated viscous form with integral Q.

Moreover, Q is integrable in spacetime and
integral |P div u| <= R sqrt(M)||sqrt(rho)theta||_2 ||div u||_infinity.
Thus the thermal integral has an absolutely continuous representative up to zero, identified by the conservative thermal trace. Together with the repaired kinetic trace this gives E(t)=E_0. The argument must use these representatives when asserting identities at every time; the bare Bochner classes only specify u and theta almost everywhere in time.

6. Virial constants.
Testing the conservative equations gives I'=2J and J'=2K+2(R/c_v)H. The viscous contribution is -2(mu+lambda) integral div u=0. Consequently
I''=4K+4(R/c_v)H >= 4 min(1,R/c_v) E_0.
Integrating yields exactly the coefficient 2 beta E_0 t^2. No zero-momentum assumption is used. Compact support and conservative traces identify I_0 and J_0. The resulting finite-time obstruction is valid for the continuous moment representative, conditional on the preceding analytic justifications.

7. Endpoint audit.
At lambda=-mu, zero dissipation gives only zero trace-free strain. The proposed exterior field u=(x_1,-x_2)/|x|^2 is indeed the real-imaginary representation of 1/z, is harmonic, and has zero trace-free symmetric gradient. Its magnitude is r^{-1}, its gradient is O(r^{-2}), and its second derivatives are O(r^{-3}). Thus its exterior L^{q_1} norm is finite, and its weighted gradient norm is finite for alpha<=1, including the logarithmic factor in the supplied weight. It refutes the endpoint exterior-rigidity implication. It is not a full-system counterexample and does not settle endpoint nonexistence.

8. Compatible small-energy family.
The witness satisfies the exact supplied momentum compatibility condition. With rho_0=psi^2, u_0=0 and theta_0=epsilon phi,
R nabla(rho_0 theta_0)=psi R epsilon(2phi nabla psi+psi nabla phi)=sqrt(rho_0)g^epsilon.
All quantities in (1.5), together with ||g^epsilon||_2, are uniformly bounded for 0<epsilon<=1. The mass is fixed and E_0^epsilon=c_v epsilon integral psi^2 phi is strictly positive and tends to zero. There is no temperature compatibility condition in the supplied (1.5)-(1.6). This verifies the algebraic witness and nonempty data class; it does not independently verify the paper's approximation construction.

Conclusion: retain the origin-centred strict-viscosity obstruction as a proof draft requiring the explicit transport, composition, and energy-product lemmas. Refute or correct the arbitrary-centre numerical bound. The supplied pages support a literal-class conditional analysis, but do not verify that the paper's two approximation limits actually realize every derivative and conservative trace used here. Exact-target Lean status remains NOT_RUN.

【红队发现】若“any closed ball”允许任意球心，原样的 I(t)≤Mb² 在 t=0 即可失败；须固定原点球或改用中心化矩。该问题不否定定性全局不存在路线。
【解析草案】未发现原点球、严格黏性版本的数学反例。外域超调和刚性、固定支撑、能量符号及 virial 系数相互一致。
【首个实质证明缺口】候选第6步的加权物质链式法则尚未完整证明。利用固定质量、密度上界与 ∇u_t 的局部 Poincaré 估计，可补出实际 u_t 的局部非加权 L² 控制，再建立流复合链式法则。
【异常时刻核查】可通过可数时空盒覆盖取得公共零测时间集；空间连续代表使外域速度在该集合外逐点为零，从而同时控制所有外部粒子。
【来源范围】所给前三页声明的 u_t 若按实际分布导数解释，可支持上述修补；两层逼近是否真正识别这些导数和初始保守迹，当前未核验。
【局部反例计算】μ+λ=0 时的 1/z 外域场确实否定零耗散推出零速度；不能据此声称端点存在全局解。
【见证族核查】固定正质量、兼容条件、列明初始范数一致有界及正能量趋零的构造成立。所有结论仍为 DRAFT，完整目标 Lean 为 NOT_RUN。

UNRESOLVED
将登记目标中的球心歧义作正式记录；任意球心的 Mb² 上界不能原样通过。
完整写出输运表示、可数覆盖切片、局部 Sobolev 流复合链式法则及能量乘积极限，不能以一句“mollification”代替收敛证明。
核验 Wang-v3 两层逼近的确切页码与极限识别：实际分布导数 u_t、θ_t，相关加权乘积，以及初始保守迹的时间代表。
未核验完整 PDF、文件哈希或局部存在性证明；此次来源核查限于用户序列化的第1—3页。
严格黏性证明不能推广到 μ+λ=0；端点完整结论仍未解决。
完整目标的锁定 Lean 构建、真实公理依赖、精确命题覆盖、独立语义审查及公开回读均未执行。
DRAFT — independent mathematical reconstruction from the serialized Wang-v3 statement and source excerpts. No shell, LaTeX, or Lean execution is claimed. Exact-target formalization: NOT_RUN.

The strict-viscosity obstruction admits the following proof. Throughout, B_b means the origin-centered closed ball {x: |x| <= b}. If an arbitrary center is intended, the asserted upper bound must instead use M sup_{x in B_b}|x|^2, or the moment must be centered at that ball's center.

1. Flow and exterior vacuum.
Fix S<T. The source assumptions give alpha in (1/2,1], so q_1 and q_2 are finite. For almost every time, interpolation between u in L^{q_1} and its second derivatives in L^2 gives
  ||u(t)||_infinity <= C(||u(t)||_{q_1}+||nabla u(t)||_{H^1}).
Consequently u belongs to L^infinity(0,S;L^infinity). Also, W^{1,q}(R^2) embeds into L^infinity for q>2, and hence
  integral_0^S ||nabla u(t)||_infinity dt < infinity.
These are precisely the boundedness and time-integrable spatial Lipschitz bounds needed for a global spatial flow X(t,y). For completeness, Picard iteration on intervals where the integral of the Lipschitz constant is small constructs X; Gronwall proves uniqueness and the spatial estimates
  exp(-L(t))|y-z| <= |X(t,y)-X(t,z)| <= exp(L(t))|y-z|,
where L(t)=integral_0^t ||nabla u(s)||_infinity ds. The backward equation supplies the inverse. Bounded velocity gives |X(t,y)-y| <= integral_0^t ||u(s)||_infinity ds.

The continuity equation, rho in C([0,S];W^{1,q}), and these velocity bounds yield
  rho(t,X(t,y)) = rho_0(y) exp(-integral_0^t div u(s,X(s,y)) ds).
One can justify this formula by spatial mollification of the continuity equation and passage to the limit: the transport commutator tends to zero locally because rho has a spatial W^{1,q} derivative and u is spatially Lipschitz with an integrable Lipschitz constant. Thus density remains zero on
  Omega_t = X(t,{y: |y|>b}).
This set is open, connected, and unbounded. It contains the complement of a sufficiently large ball, uniformly for t in [0,S]. Density support lies in X(t,B_b). This step has not yet asserted that support is fixed.

2. A two-dimensional exterior superharmonic lemma.
Lemma. Suppose h>=0 is continuous on a connected open set Omega containing {|x|>A}, h belongs to L^p(Omega) for some finite p>=1, and -Delta h>=0 distributionally on Omega. Then h=0 on Omega.
Proof. First work on {|x|>A}. Let m(r) be the circular average of h and put F(s)=m(e^s). Distributionally, Delta h<=0 implies F''<=0. Thus F has a concave representative on (log A,infinity). It is nonnegative. A nonnegative concave function on a half-line is nondecreasing: any negative secant slope, by concavity, would force negative values sufficiently far to the right. Jensen's inequality gives
  2 pi integral_A^infinity m(r)^p r dr <= integral_{|x|>A} h(x)^p dx < infinity.
A nonnegative nondecreasing m cannot satisfy this inequality unless it is identically zero. Hence h=0 on the exterior region. Finally, the strong minimum principle propagates this zero through connected Omega. Its relevant local argument is the superharmonic mean inequality: at a zero point, every sufficiently small spherical average is nonnegative and at most zero, so continuity makes h zero throughout a neighboring ball. The zero set is consequently both relatively open and relatively closed. This proves the lemma. Mollification on smaller annuli justifies the circular-average argument for distributional superharmonic functions.

This is a genuinely two-dimensional step: the logarithmic radial coordinate removes the radial first-derivative term. The analogous assertion is false in dimensions at least three, where positive decaying exterior harmonic functions exist.

3. Temperature and strain in the transported exterior.
Write
  Q = 2 mu |D(u)|^2 + lambda (div u)^2
    = 2 mu |D(u)-(div u)Id/2|^2 + (mu+lambda)(div u)^2.
Under mu>0 and mu+lambda>0, Q>=0 and Q=0 implies D(u)=0.

For almost every positive time, theta has local H^2 regularity by (1.7), is nonnegative, and belongs to L^{q_2}. In the open spacetime vacuum region transported from {|y|>b}, rho, rho theta, and P vanish. The conservative thermal equation therefore reads
  -kappa Delta theta = Q.
This identity is distributional locally in that spacetime region, and slicing gives it on Omega_t for almost every t. There is no need to differentiate a nonzero density through the boundary: the calculation is confined to the open vacuum region.

Local H^2 regularity in dimension two supplies continuity of theta. The preceding lemma therefore gives theta(t)=0 throughout Omega_t. The thermal equation then gives Q(t)=0 there, and strict viscosity gives D(u(t))=0 there.

A vector field with zero symmetric gradient on a connected open set is a rigid motion. An elementary distributional verification uses
  partial_j partial_k u_i = partial_j D_{ik}+partial_k D_{ij}-partial_i D_{jk}=0.
Thus u(t,x)=A(t)x+c(t), with A(t) skew-symmetric, on Omega_t. Since Omega_t contains an exterior region and u(t) belongs to finite L^{q_1}, both A(t) and c(t) vanish. Hence u(t)=0 on Omega_t for almost every t.

4. Fixed support.
For every initial exterior point y, its trajectory X(t,y) belongs to Omega_t. The preceding zero-velocity conclusion and the continuous spatial representative of u at almost every time give
  dX(t,y)/dt=0
for almost every t. Therefore X(t,y)=y for every t and every |y|>b. Since X(t,.) is a homeomorphism, it also maps B_b onto B_b. Consequently
  supp rho(t) subset B_b,
  u(t)=theta(t)=0 on {|x|>b}
for almost every t. The density assertion extends to every time using its stated L^1 continuity. Global Sobolev regularity already present in (1.7) means that the zero extensions do not introduce unaccounted boundary distributions.

5. Energy identity at positive times.
Set
  K(t)=1/2 integral rho |u|^2,
  H(t)=c_v integral rho theta,
  E(t)=K(t)+H(t).
All spatial integrals are finite because support is fixed and the source provides the weighted L^2 bounds. On compact subintervals of (0,S), the source time and spatial regularity permits multiplication of the momentum equation by u and integration by parts. More explicitly, sqrt(rho)u_t is bounded in L^2, sqrt(rho)theta_t is locally integrable in L^2, u is bounded, and the required spatial gradients and second derivatives are locally square-integrable. Spatial mollification and time averaging justify the product rule; each product converges by these bounds.

Use a smooth cutoff identically one on a neighborhood of B_b. All velocity and temperature cutoff errors vanish because these fields and their weak derivatives vanish outside B_b. The kinetic and thermal balances become
  K'(t) + integral Q = integral P div u,
  H'(t) = integral Q - integral P div u.
Here the integrated viscous quadratic form agrees with integral Q: integration by parts gives integral partial_j u_i partial_i u_j = integral (div u)^2. The conductivity term integrates to zero using the same cutoff and the global weak Laplacian. Thus E'=0 distributionally at positive times, and E is constant there.

6. Initial energy and momentum traces.
The conservative initial traces alone should not be silently replaced by pointwise traces of u or theta. The following argument identifies the quantities actually needed.

First, u and theta have fixed compact support for almost every positive time. The conservative trace of rho theta, tested against a cutoff equal to one on B_b, identifies
  lim_{t downarrow 0} integral rho theta = integral rho_0 theta_0.
Indeed, the thermal balance shows that this integral has an absolutely continuous representative up to zero: Q is time-integrable, and integral |P div u| is time-integrable, using sqrt(rho)theta in L^infinity L^2, bounded density and finite mass, and div u in L^1 L^infinity.

For kinetic energy, let V(t,y)=u(t,X(t,y)) and use the measure rho_0(y)dy. The change-of-variables formula gives
  ||partial_t V(t)||_{L^2(rho_0dy)}
  = ||sqrt(rho)(u_t+u dot nabla u)(t)||_2
  <= ||sqrt(rho)u_t(t)||_2
       + ||u(t)||_infinity ||sqrt(rho)nabla u(t)||_2.
The right side is bounded on (0,S), by bounded density and the source bounds. The Sobolev chain rule, obtained by mollifying u locally in spacetime and using the bi-Lipschitz flow, gives the displayed derivative in the weighted L^2 space. Therefore V(t) has a strong L^2(rho_0dy) limit V_* at zero.

The conservative momentum trace identifies that limit. For any compactly supported smooth vector test phi,
  integral rho(t,x)u(t,x) dot phi(x) dx
  = integral rho_0(y)V(t,y) dot phi(X(t,y)) dy.
As t tends to zero, uniform convergence X(t,y)->y on B_b and strong convergence of V give the limit integral rho_0 V_* dot phi. By (1.3) this equals integral rho_0 u_0 dot phi. Hence V_*=u_0 rho_0dy-almost everywhere. Consequently K(t)->K(0), and E(t)=E_0.

The same trace argument gives J(t)->J_0. Density continuity, fixed support, and the conservative density trace give I(t)->I_0. These statements do not require specifying u_0 or theta_0 in the initial vacuum region.

7. Virial identity and contradiction.
Define
  I(t)=integral rho |x|^2,
  J(t)=integral rho u dot x.
Use cutoff versions of x and |x|^2 equal to these functions near B_b. The continuity and momentum equations give
  I'=2J,
  J'=integral rho |u|^2+2 integral P.
The viscous contribution is zero: pairing the viscous stress with the identity matrix gives a constant multiple of integral div u, which vanishes for the compactly supported Sobolev velocity.

Writing beta=min(1,R/c_v), we obtain
  I''=4K+4(R/c_v)H >= 4 beta E_0,
since K,H>=0. Integrating with the just-established initial traces yields, for every 0<=t<T,
  I_0+2J_0t+2 beta E_0t^2 <= I(t) <= M b^2.
Both I and J have the absolutely continuous representatives determined by their conservative balances. Since E_0>0 and beta>0, the quadratic lower bound eventually exceeds M b^2. No global solution can satisfy the complete specified source class on every finite interval.

8. Explicit compatible small-energy family.
Choose nonnegative psi in C_c^infinity(B_1), positive throughout B_1, and scale it so that integral psi^2=M>0 is fixed. For example, take a positive multiple of exp(-1/(1-|x|^2)) inside B_1 and zero outside. Set rho_0=psi^2. Choose a nonzero nonnegative phi in C_c^infinity(B_{1/2}), and for 0<epsilon<=1 set
  u_0^epsilon=0,
  theta_0^epsilon=epsilon phi.
Define
  g^epsilon = R epsilon [2 phi nabla psi + psi nabla phi].
Then, globally and including the vacuum region,
  sqrt(rho_0)g^epsilon = R nabla(rho_0 theta_0^epsilon),
which is exactly (1.6). The vector g^epsilon is smooth and compactly supported. Every norm appearing in (1.5), and ||g^epsilon||_2, is uniformly bounded; weighted density norms are fixed, and temperature norms decrease linearly with epsilon. Moreover,
  E_0^epsilon=c_v epsilon integral psi^2 phi>0,
  E_0^epsilon ->0.
The family has fixed positive mass. Choosing zero velocity is a property of this explicit witness family, not an assumption in the obstruction theorem. Any additional fixed-order smooth norms of this family are also uniformly bounded.

This construction proves compatibility and non-vacuity of the initial-data assumptions. It does not independently establish that a local solution exists for these data: the source's local construction was not supplied or verified.

9. Endpoint mu+lambda=0.
The temperature lemma still applies because Q=2 mu |D(u)-(div u)Id/2|^2>=0. However, Q=0 now implies only zero trace-free strain, not D(u)=0. The rigid-motion and fixed-support steps therefore do not follow.

An explicit exterior counterexample to that implication is
  u(x_1,x_2)=(x_1,-x_2)/(x_1^2+x_2^2), theta=0, rho=0
on {|x|>1}. Its components are the real and imaginary parts of the holomorphic function 1/z. The Cauchy-Riemann equations give zero trace-free symmetric gradient; its components are harmonic. Thus Q=0 and, at lambda=-mu, the exterior momentum equation reduces to -mu Delta u=0 and is satisfied. Yet u is nonzero. It belongs to L^{q_1} on the exterior for q_1>=4; its first and second derivatives have all the exterior integrability required here, including the weighted gradient bound for alpha<=1. This is a counterexample to the endpoint exterior-rigidity implication, not a global solution of the full candidate problem.

Accordingly, the proof establishes only the preregistered strict-viscosity subcase. It supplies no endpoint global-existence or nonexistence conclusion.

【草案】在 μ>0、μ+λ>0 的精确子范围内，重推得到候选的完整解析路线及二次矩矛盾；没有使用 N0006，也没有把局部存在性作为证明前提。
【草案】二维关键刚性成立：非负、有限 L^p 的外域超调和函数，在含无穷远区域的连通真空分支上必须为零。随后严格黏性使应变为零，有限 L^{q1} 排除非零刚体运动。
【草案】固定支撑先由流传播真空，再由外部速度为零推出；能量初始迹通过保守迹和质量加权拉格朗日 L² 连续性识别，不能直接假定速度、温度的强初始迹。
【草案】给出了固定正质量、精确满足动量兼容条件、所有列明初始范数一致有界且正物理能量趋零的光滑族。
【严格的局部反例计算】μ+λ=0 时，外域速度对应复函数 1/z，耗散为零但速度非零，故严格黏性证明不能推广到端点。
【范围核对】Mb² 上界使用以原点为中心的 B_b；若允许任意球心，须修改上界或改用相对于球心的矩。
所有结果保持 DRAFT；未执行 Lean、TeX 编译、注册账本写入或发布，完整目标 Lean 状态为 NOT_RUN。

UNRESOLVED
完整目标尚无实际锁定 Lean 构建、公理披露、独立语义审查及公开回读，不能晋级或解锁子节点。
仅核对了序列化的 Wang-v3 第1—3页；未核验其局部存在性证明、后续估计或完整 PDF 哈希。
解析证明使用的流链式法则、输运表示、能量乘积极限和加权拉格朗日时间连续性仍须在完整形式化与独立审查中逐项实现；这里给出了所需估计与论证，但不声称形式化认证。
端点 μ+λ=0 的全局候选结论未解决；所给反例只否定外部零耗散推出零速度这一局部蕴含。
若 preregistration 中的“any closed ball”意指任意球心，则原样的 Mb² 表述需纠正；一般球心下该上界甚至在 t=0 就未必成立。
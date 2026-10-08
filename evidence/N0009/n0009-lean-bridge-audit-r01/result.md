Semantic audit status: DRAFT. N0009 remains OPEN; exact-target Lean status is NOT_RUN. No shell, Lean, source retrieval, or compilation was performed in this audit. The parent's report of pinned builds and standard axioms is supplied evidence, not independently reproduced evidence.

1. Actual scope of the five declarations.

fixed_support_moment_bound proves a spatial integral inequality for an arbitrary real-valued density on Euclidean R². Its premises are b≥0, Integrable ρ, Integrable (ρ‖x‖²), almost-everywhere nonnegativity, and almost-everywhere support inside the origin-centered closed ball of radius b. None of these premises is derived here for a Wang-v3 solution. Its proof correctly treats the zero-density case separately, multiplies the squared-radius bound by nonnegative density, and uses integral monotonicity with explicit integrability. Thus it avoids the default-nonintegrable-integral problem. Positive mass, conservation of mass, temporal support preservation, initial traces, and the PDE do not occur in its type. To obtain the target upper bound one still needs ∫ρ(t)=M and the support property at each relevant time.

no_bounded_quadratic_growth proves the elementary impossibility of an arbitrary scalar function lying between a positive quadratic and a constant for every nonnegative real time. Both bounds are assumptions. This is a valid final consequence, but does not establish either PDE estimate. The displayed escape argument chooses t≥1 with ct≥|a|+|v|+|B|+1. Consequently ct² dominates (|a|+|v|+|B|+1)t, and the remaining linear and constant terms give a+vt+ct²>B.

lower_bound_from_derivative assumes ordinary two-sided HasDerivAt at every nonnegative time, including zero. It proves a comparison by applying monotonicity to f(s)−cs. The proof is mathematically sound under those premises. Despite the comment about a one-sided comparison, the actual derivative hypothesis at zero is two-sided. The function is defined on all of R, and HasDerivAt at zero uses its negative-time values. No PDE extension to negative time has been constructed. Also, this hypothesis requires pointwise differentiability at every positive time; almost-everywhere identities for absolutely continuous moments would not directly instantiate it.

quadratic_growth_from_virial assumes all-time classical derivative identities I'=2J and J'=J', together with the lower bound c≤J', including at zero. It correctly integrates twice. It does not identify I or J with spatial moments, identify their initial values with conservative traces, or obtain c from physical energy. In particular, I(0) and J(0) remain arbitrary scalar-function values.

no_global_virial_profile combines precisely those derivative premises with a globally uniform bound. Its theorem type contains no Wang-v3 solution, density, temperature, velocity, viscosity, energy, or initial datum. It certifies a conditional scalar contradiction. Its assumptions are intentionally jointly inconsistent; proving False from them is legitimate. The missing substantive theorem is that a putative global Wang-v3 solution supplies those assumptions.

2. Mathematical coefficient check.

Write K(t)=∫ρ|u|²/2 and U(t)=c_v∫ρθ. If the PDE bridges establish nonnegativity, energy conservation K(t)+U(t)=E₀, and the two-dimensional virial identity
J'(t)=2K(t)+2(R/c_v)U(t),
then, with β=min(1,R/c_v), one has J'(t)≥2βE₀. Therefore the Lean parameter must be c=2βE₀, and its quadratic conclusion becomes
I(t)≥I₀+2J₀t+2βE₀t².
This checks the coefficient, but does not prove the virial identity or energy conservation. Disappearance of integrated viscous terms still requires valid spatial cutoff limits or a proved support and regularity argument. Positivity of c requires E₀>0 and positive R,c_v.

3. Every unresolved PDE premise and identification.

For the moment bound: measurable representatives, density integrability, moment integrability, nonnegativity, and fixed origin-centered support must be established for the relevant time slices; mass conservation must identify the integral with M. Compact support of the initial density alone does not establish support preservation in the same ball.

For the scalar profiles: define I and J by the actual second moment and momentum moment; prove finiteness and temporal regularity; derive I'=2J and the lower bound on J'; establish the initial equalities I(0)=I₀ and J(0)=J₀ from the conservative trace topology; derive energy conservation and temperature nonnegativity; obtain the uniform upper bound on every finite interval with constants independent of its endpoint. None is proved in the supplied module.

Upstream obligations include the exact Wang-v3 solution class and conservative equations, time-dependent flow and transport, common representatives and common full-measure time sets, exterior vacuum, the two-dimensional exterior superharmonic-temperature lemma, strict-viscosity dissipation rigidity, fixed support, recovery of unweighted u_t, and all energy and trace product limits. The strict condition μ+λ>0 cannot be replaced by the endpoint μ+λ=0 without a separate argument.

The finite-time target is also absent: the present scalar declarations assume estimates and derivatives on all nonnegative times rather than on [0,T). A solution on (0,T) cannot instantiate these global hypotheses. Even for a global solution, identities that hold only almost everywhere require a further temporal bridge.

The smooth compatible family with fixed positive mass, uniformly bounded exact v3 initial norms, and positive energies tending to zero is entirely absent. Neither positive energy nor small-energy non-vacuity is supplied by any declaration.

4. Source and vacuity audit.

The exact PDF passages defining (1.1), (1.3), and (1.5)–(1.8) are not serialized here. The preregistration identifies them but does not reproduce them. Consequently this audit cannot certify source fidelity, compatibility conditions, trace topology, or the claimed regularity implications. The supplied hash is provenance metadata, not an inspection of the theorem text.

There are no explicit custom axiom declarations, sorry terms, or target-PDE assumptions disguised in a structure in the displayed module. Actual transitive axioms require the parent's retained #print axioms outputs; those outputs are not reproduced here. No exact axiom list should be invented from the report that they were standard.

The spatial lemma has nonempty hypotheses, for example ρ=0 and b=0. This illustrates that its statement neither enforces positive mass nor addresses the obstruction's positive-energy regime. The global contradiction theorem has inconsistent joint premises by design; this becomes a problem only if it is presented as a PDE theorem without deriving those premises. Non-vacuity of the exact initial-data class remains a separate witness-family obligation.

There is also a geometric ambiguity in the target wording. The module bounds support by ‖x‖≤b, so B_b must mean the ball centered at the origin. For a ball centered at z with radius b, the valid general upper bound for the unshifted moment is M(‖z‖+b)². Alternatively, define shifted moments using |x−z|² and u·(x−z), and obtain Mb² for those shifted moments. Arbitrary translated balls cannot give Mb² for the stated unshifted I. This needs an explicit interpretation or a recorded correction to the preregistered statement.

5. Concrete next formalization step: a finite-interval temporal bridge.

Prove the following auxiliary statement, explicitly retaining its conditional scope:

Let T>0. Let I,J:R→R be continuous on [0,T), and assume that for every 0<s<T,
HasDerivAt I (2J(s)) s,
HasDerivAt J d(s) s,
and c≤d(s).
Then, for every 0≤t<T,
I(0)+2J(0)t+ct²≤I(t).

Complete mathematical proof: for t=0 the claim is equality. For 0<t<T, set G(s)=J(s)−cs. On [0,t], G is continuous; at each interior point its derivative is d(s)−c≥0. The mean-value theorem implies G(s)≥G(0) for 0≤s≤t, hence J(s)≥J(0)+cs. Set F(s)=I(s)−cs²−2J(0)s. This function is continuous on [0,t], and at each interior point
F'(s)=2J(s)−2cs−2J(0)≥0.
A second mean-value comparison gives F(t)≥F(0), exactly the desired inequality. No derivative at zero and no negative-time PDE extension are needed.

If the source regularity yields only almost-everywhere derivatives, formalize the corresponding absolutely continuous version instead: J(t)−J(0)=∫₀ᵗd(s)ds≥ct, and integrate I'=2J once more. Do not strengthen almost-everywhere PDE identities to everywhere classical derivatives without proof. This step repairs a concrete interface mismatch while leaving all PDE, source-class, trace, and witness obligations open.

【草案】五个声明分别验证空间矩上界、标量二次增长矛盾和条件性的两次积分；均未证明 Wang-v3 解满足这些前提。N0009 保持 OPEN，完整目标 Lean 为 NOT_RUN。
【严格：类型审计】HasDerivAt 在零点要求双侧导数；当前接口还要求每个正时间点都有导数。它不能直接接收仅正时间定义、仅几乎处处成立的 PDE 时间恒等式。
【严格：系数核对】若另行证明能量守恒和 J'=2K+2(R/c_v)U，则应取 c=2βE₀，得到目标中的 2βE₀t²。
【严格：几何范围】当前模块只覆盖以原点为中心的半径 b 球。任意中心的球不能直接给未平移二阶矩的 Mb² 上界。
【未验证】输入没有提供所引 PDF 的完整对应条文，不能认证源文正则性、初始迹或兼容条件。父进程报告的编译与标准公理信息未在本轮独立复现。
【草案】下一步可形式化有限区间、零点仅连续的二次增长引理；若实际矩仅绝对连续，则需使用几乎处处导数版本。该辅助步骤不解锁 N0009 子节点。

UNRESOLVED
精确编码并核验 Wang-v3 方程、完整解类、参数范围及保守初始迹。
从源文正则性证明流、输运、共同代表及外部真空；证明温度超调和引理、严格耗散刚性与固定支撑。
证明真实 u_t、能量等式、空间截断极限、质量守恒及矩的时间正则性。
证明实际矩初值等于 I₀、J₀，并在每个有限区间建立精确 virial 估计。
明确 B_b 的中心；任意平移球的原始表述存在不成立风险。
构造并核验固定正质量、全部精确初始范数一致有界、能量趋零的光滑兼容族。
单独审查 μ+λ=0 端点。
完整目标实际构建、公理输出、独立语义审查及远端证据读回尚未完成。
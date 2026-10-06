N0004 — Coupled specific-energy route. Status: DRAFT; formalization NOT_RUN. The calculations below establish identities and conditional estimates, but do not establish global continuation under the original hypotheses. Only the serialized source texts have been inspected; no external version comparison, shell execution, or Lean compilation was performed.

1. Notation and justification scope.
Let
\[
 d=\operatorname{div}u,\quad k=\tfrac12|u|^2,\quad w=c_v\theta+k,\quad A=2\mu+\lambda>0,
\]
\[
 S=2\mu D(u)+\lambda dI,\quad Q=S:\nabla u=2\mu|D(u)|^2+\lambda d^2,\quad P=R\rho\theta,
\]
and let \(F=Su-Pu\). All spatial integrals are over \(\mathbb R^2\). Since \(\mu+\lambda\ge0\),
\[
 Q=2\mu|D(u)-\tfrac12dI|^2+(\mu+\lambda)d^2\ge0.
\]
The differential identities hold distributionally without dividing by density. Integrated tests are asserted on compact positive-time intervals where their displayed integrands are integrable, using spatial cutoffs and then removing them. In particular, the \(w^2\) test requires \(\int\rho|u|^4<\infty\); its availability at time zero is not silently assumed. Smooth compactly supported test configurations also suffice for the algebraic assertions below. Extension of every nonlinear test to the exact initial trace is a separate analytic obligation.

2. Exact total specific-energy equation.
The momentum equation gives
\[
 \rho\dot k=u\cdot\operatorname{div}S-u\cdot\nabla P
 =\operatorname{div}(Su-Pu)-Q+Pd.
\]
The temperature equation is
\[
 c_v\rho\dot\theta=\kappa\Delta\theta+Q-Pd.
\]
Adding them gives the exact cancellation
\[
 \boxed{\rho\dot w=\kappa\Delta\theta+\operatorname{div}F.}\tag{N4.1}
\]
Thus heating and pressure work cancel in the equation for total energy, but remain encoded in its flux. Expanding the flux reproduces Wang-v1, PDF p.23, (4.30):
\[
 \rho\dot w=\kappa\Delta\theta+\frac\mu2\Delta|u|^2
 +\mu\operatorname{div}(u\cdot\nabla u)
 +\lambda\operatorname{div}(ud)-\operatorname{div}(Pu).
\]
Indeed \(Su=\mu\nabla k+\mu(u\cdot\nabla)u+\lambda ud\).

Under vanishing boundary fluxes, put
\[
 K=\int\rho k,\qquad H=c_v\int\rho\theta,\qquad E=K+H,
\]
\[
 \mathcal D=\int\{\mu|\nabla u|^2+(\mu+\lambda)d^2\}.
\]
Integration by parts gives \(\int Q=\mathcal D\), and therefore
\[
 K'+\mathcal D=\int Pd,\qquad H'=\mathcal D-\int Pd,\qquad E'=0.\tag{N4.2}
\]
Consequently \(K,H\le E_0\) for nonnegative temperature. Crucially, (N4.2) gives no estimate \(\int_0^T\mathcal D\le CE_0\): viscosity transfers kinetic energy to internal energy rather than dissipating total physical energy.

3. Positive specific-energy functional and its full tested equality.
Set \(Y=\int\rho w^2\) and \(a_\kappa=\kappa/c_v\). Continuity implies
\[
 \frac12Y'=\int\rho w\dot w.
\]
Testing (N4.1), retaining conduction and the full flux, yields
\[
 \boxed{\frac12Y'+\kappa c_v\int|\nabla\theta|^2
 =-\kappa\int\nabla k\cdot\nabla\theta
 -\int F\cdot(c_v\nabla\theta+\nabla k).}\tag{N4.3}
\]
Equivalently, using \(\theta=(w-k)/c_v\),
\[
 \boxed{\frac12Y'+a_\kappa\int|\nabla w|^2
 =\int(a_\kappa\nabla k-F)\cdot\nabla w.}\tag{N4.4}
\]
This is a positive functional, since
\[
 Y\ge c_v^2\int\rho\theta^2,\qquad Y\ge\tfrac14\int\rho|u|^4.
\]
However, \(\nabla w\) alone does not separately control \(\nabla\theta\) and \(\nabla k\).

Young's inequality applied to (N4.4) proves the useful but unclosed estimate
\[
 \boxed{Y'+a_\kappa\|\nabla w\|_2^2
 \le a_\kappa^{-1}\|a_\kappa\nabla k-F\|_2^2
 \le C\int |u|^2\bigl(|\nabla u|^2+P^2\bigr).}\tag{N4.5}
\]
Here \(|\nabla k|\le|u||\nabla u|\) and \(|S|\le C|\nabla u|\); \(C\) depends only on \(\mu,\lambda,\kappa,c_v\). No density lower bound is used.
If \(M(t)=\|\rho(t)\|_\infty\), \(U(t)=\|u(t)\|_\infty\), and \(N(t)=\|\nabla u(t)\|_2^2\), then
\[
 \|P\|_2^2\le\frac{R^2}{c_v^2}M Y,
\]
so
\[
 Y'+a_\kappa\|\nabla w\|_2^2\le C U^2(N+MY).\tag{N4.6}
\]
This proves a finite bound conditional on suitable integrability of \(U^2N\) and \(MU^2\). Those coefficients have not been bounded under the original small-energy hypotheses. In particular, (N4.6) is not a continuation theorem.

The first failure occurs already at the initial functional: small \(E_0=\int\rho w\) does not imply small \(Y(0)=\int\rho w^2\). The data allow large thermal and velocity concentrations. Even when \(Y(0)\) is finite and treated as an unrestricted high norm, the right side of (N4.5) supplies no positive power of \(E_0\) that absorbs it into the left side.

4. Pressure-square target and the exact feedback obstruction.
From \(d=(G+P)/A\), the internal-energy identity becomes
\[
 \boxed{H'+\frac1A\|P\|_2^2=\mathcal D-\frac1A\int PG.}\tag{N4.7}
\]
Thus for \(s<T\),
\[
 \frac1{2A}\int_s^T\|P\|_2^2dt
 \le H(s)+\int_s^T\mathcal Ddt
 +\frac1{2A}\int_s^T\|G\|_2^2dt.\tag{N4.8}
\]
The term \(H(s)\) has the favorable power \(E_0^1\). Neither remaining spacetime term has yet been controlled.
Conversely, the kinetic identity and Young's inequality give
\[
 K'+\tfrac12\mathcal D\le\frac1{2A}\|P\|_2^2.\tag{N4.9}
\]
For completeness, \(\mathcal D\ge A\|d\|_2^2\): integration by parts gives
\(\|\nabla u\|_2^2=\|d\|_2^2+\|\operatorname{curl}u\|_2^2\).
Hence (N4.9) follows from
\(\int Pd\le A\|d\|_2^2/2+\|P\|_2^2/(2A)\).

Inserting the time integral of (N4.9) into (N4.8) leaves a pressure-square coefficient on the right larger than the one on the left. There is no absorption. More fundamentally, adding the exact kinetic and internal identities merely recovers \(E'=0\). Bounding \(G\) by \(Ad-P\) also feeds back the same unknown pressure-square term. The elliptic equation \(\Delta G=\operatorname{div}(\rho\dot u)\) moves the problem to an uncontrolled acceleration estimate; it does not close (N4.8).

5. Heating weighted by temperature.
Let
\[
 X=\int\rho\theta^2,\quad Z=\|\nabla\theta\|_2^2,\quad
 J=\int\theta Q,\quad V=\int\rho|\dot u|^2.
\]
The exact thermal test is
\[
 \boxed{\frac{c_v}{2}X'+\kappa Z=J-R\int\rho\theta^2d.}\tag{N4.10}
\]
In particular \(J\ge0\), but it is a source, not a dissipative term on the left.
Testing momentum against \(u\theta\) gives the full equality
\[
 \boxed{\begin{aligned}
 \int\theta\{\mu|\nabla u|^2+(\mu+\lambda)d^2\}
 ={}&-\int\rho\theta u\cdot\dot u+\int P\theta d+\int Pu\cdot\nabla\theta\\
 &-\mu\int\partial_i u_j\,u_j\partial_i\theta
 -(\mu+\lambda)\int d\,u\cdot\nabla\theta.
 \end{aligned}}\tag{N4.11}
\]
Since \(0\le Q\le C|\nabla u|^2\) and the left side of (N4.11) is at least \(\mu\int\theta|\nabla u|^2\), every \(\varepsilon>0\) admits a constant \(C_\varepsilon\), depending on the physical coefficients and \(\varepsilon\), such that
\[
 \boxed{J\le\varepsilon(V+Z)
 +C_\varepsilon U^2\{N+(1+M)X\}
 +C\|d\|_\infty X.}\tag{N4.12}
\]
Here the individual estimates are
\[
 \left|\int\rho\theta u\cdot\dot u\right|\le U\sqrt X\sqrt V,
\quad \left|\int P\theta d\right|\le R\|d\|_\infty X,
\]
\[
 \left|\int Pu\cdot\nabla\theta\right|\le RU\sqrt{MX}\sqrt Z,
\]
while the two viscous cross terms are bounded by \(CU\sqrt N\sqrt Z\). Applying Young's inequality with suitably reduced parameters proves (N4.12).
This estimate retains the compressive term and explains the conditional estimate on Wang-v1 PDF p.26, (5.10). Its use in that source is within the assumed blowup-criterion bound (5.1). Here \(V\), \(U\), \(M\), and \(\int\|d\|_\infty\) remain uncontrolled, so invoking that argument as an unconditional closure would be circular.

For a time-independent smooth spatial weight \(h\), the corresponding exact localized test is
\[
 \begin{aligned}
 \frac{c_v}{2}\frac d{dt}\int h\rho\theta^2+\kappa\int h|\nabla\theta|^2
 ={}&\int h\theta Q-\int hP\theta d\\
 &+\frac{c_v}{2}\int\rho\theta^2u\cdot\nabla h
 +\frac\kappa2\int\theta^2\Delta h.
 \end{aligned}\tag{N4.13}
\]
For compactly supported \(h\), all boundary terms are explicit. Passage to a growing weight requires controlling both last terms and cannot be justified by omitting them. In particular, physical energy does not control an unweighted \(\theta^2\) tail in vacuum.

6. Jacobian compensation leaves a compressive remainder.
Write \(B=\nabla u\), \(j=\det B\). Direct two-dimensional algebra gives
\[
 \operatorname{tr}(B^2)=d^2-2j,
\quad Q=\mu|B|^2+(\mu+\lambda)d^2-2\mu j.\tag{N4.14}
\]
The determinant is a Jacobian and has cancellation under suitable decay. Neither \(d^2\) nor \(\theta d^2\) inherits that cancellation. For example, for nonzero \(\phi\in C_c^\infty(\mathbb R^2)\) and \(u=(\phi,0)\), one has \(j=0\) identically but \(d=\partial_1\phi\) need not vanish. Thus determinant compensation cannot replace control of compression.

The pressure contribution in a material-derivative momentum test illustrates the same issue. Put \(\beta=R/c_v\). The temperature and continuity equations imply
\[
 \dot P=-(1+\beta)Pd+\beta Q+\beta\kappa\Delta\theta.
\]
Moreover \(\operatorname{div}\dot u=\dot d+\operatorname{tr}(B^2)\), so integration with continuity of the transport field gives
\[
 \boxed{\begin{aligned}
 \int P\operatorname{div}\dot u
 ={}&\frac d{dt}\int Pd
 +(1+\beta)\int Pd^2-2\int Pj\\
 &-\beta\int Qd-\beta\kappa\int d\Delta\theta.
 \end{aligned}}\tag{N4.15}
\]
Indeed \(\frac d{dt}\int Pd=\int(\dot P\,d+P\dot d+Pd^2)\); substituting the preceding equations proves every term of (N4.15). Compensating \(Pj\) leaves the positive compressive remainder \((1+\beta)\int Pd^2\), the cubic heating term \(-\beta\int Qd\), and conduction. None is removed by the specific-energy cancellation.

7. Exact small-energy limitation and conclusion.
The available favorable bounds are \(K,H\le E_0\), hence \(\|\sqrt\rho u\|_2\le(2E_0)^{1/2}\) and \(\int P\le(R/c_v)E_0\). They provide powers \(E_0^{1/2}\) and \(E_0^1\), respectively. They do not give small \(X\), \(Y\), \(\|P\|_2^2\), or \(J\).
For a concrete thermal concentration test, fix a smooth compactly supported density equal to one near the origin and take \(u_0=0\), \(\theta_0=b\psi(x/r)\), with nonnegative nonzero \(\psi\in C_c^\infty\) supported inside that region. Then
\[
 E_0=c_v b r^2\int\psi,\qquad
 \|P_0\|_2^2=R^2b^2r^2\int\psi^2.
\]
Choose \(r^2\) proportional to \(E_0/b\). For fixed positive small energy, \(\|P_0\|_2^2\) grows proportionally to \(bE_0\). Each individual datum satisfies the thermal regularity conditions. Compatibility holds with \(g=R\nabla\theta_0\) on the support of \(\theta_0\), extended by zero, because density equals one there. Its norm is unrestricted, as allowed by the original hypotheses. This refutes an energy-only instantaneous pressure-square bound; it does not refute a spacetime bound using parabolic smoothing and unrestricted initial high norms.

The exact first spacetime obstruction is (N4.8)–(N4.9): pressure-square control and viscous dissipation require each other without an absorbable coefficient. The positive functional (N4.4) replaces that obstruction by \(\int|u|^2(|\nabla u|^2+P^2)\), still without an established small-energy factor. The heating estimate (N4.12) additionally requires acceleration and the very compression coefficient entering continuation. Consequently N0004 has not supplied a bound finite uniformly as \(T\uparrow T^*<\infty\), and does not establish the required integral of \(\|d\|_\infty+\|u\|_{4/\alpha}\). This is failure of the tested closure, not a proof that every possible coupled functional must fail.

Source scope: Wang-v1 (arXiv:2212.13343v1), serialized PDF pp.3, 23–27, provides the exact solution class, specific-energy equation, and conditional continuation estimates examined here. The serialized incompressible paper (arXiv:2610.04884v1), pp.25–29, uses incompressibility, kinetic-energy dissipation, and moment-based estimates. Its damping argument supplies no bound for the pressure and thermal terms retained above. Neither its second-moment nor zero-momentum assumptions have been imported into N0004.

N0004 保持 DRAFT／NOT_RUN；原始小物理能量全局强解目标仍为 OPEN，本轮没有可解锁后续节点的认证结论。
正泛函 Y=∫ρ(c_vθ+|u|²/2)² 的完整测试恒等式成立，但其右端为 ∫|u|²(|∇u|²+P²)，尚无可吸收的小能量因子。
压力平方的首个时间积分缺口明确落在 N4.8–N4.9：压力平方与黏性耗散互相依赖，系数不能吸收。
温度加权产热 J=∫θQ 的估计保留了压缩、导热和加速度；所需系数尚未独立控制，不能借 Wang 的条件性爆破判据估计消除缺口。
二维 Jacobian 补偿仅处理 det∇u；材料导数压力测试仍留下 (1+R/c_v)∫P(divu)²、产热三次项和导热项。
已给出满足原始正则性及兼容条件的热集中初值，证明小物理能量不控制瞬时压力平方；该例不否定可能的抛物平滑时间积分估计。

UNRESOLVED
在原始假设下，独立证明 ∫₀ᵀP² 与 ∫₀ᵀθQ 的上界，并使其在有限最大存在时间前保持一致有界。
为 specific-energy 测试的通量余项建立真正可闭合的估计，而非假设密度上界、速度最大范数或加速度界。
证明增长空间权重测试的尾部极限及初始 w² 测试的合法性；不得默认未证明的积分有限。
控制 ∫₀ᵀ(||divu||∞+||u||₄/α)dt，且不引用以该积分有限为前提的条件估计。
所有候选命题的实际 Lean 编译、axioms 记录与独立语义复核均未执行。
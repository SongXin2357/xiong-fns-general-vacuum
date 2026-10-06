\paragraph{N0006: audit verdict and scope.}
For $\mu>0$, $b:=\mu+\lambda>0$, and $R,c_v,\kappa>0$, the compact-support obstruction passes this paper-level audit as a conditional nonexistence theorem in the exact displayed Wang-v1 class (1.8), with nonnegative temperature and conservative initial traces. I found no invalid implication in the exterior-vacuum, fixed-support, energy, and virial chain. The analytic justifications below are essential parts of that verdict. This does not establish local solvability of the proposed data family, independently certify Wang's local-existence theorem, or supply a Lean certificate. Formalization status: NOT_RUN.

The source comparison is restricted to the serialized Wang-v1 text supplied in INPUT. In particular, p.3, (1.8)--(1.9), supplies every space used below. No claim is made about inspection of a PDF binary, Wang-v3, or the other cited papers.

\paragraph{1. Velocity and transported vacuum.}
Set $\alpha=\min\{a/2,1\}$, $p_u=4/\alpha$, and $p_\theta=6/(2\alpha-1)$. Since $a>1$, both exponents are finite, with $p_u\ge4$ and $p_\theta\ge6$. Fix an existing finite interval $[0,T]$. From (1.8),
\[
 u\in L^\infty_tL^{p_u}_x,\qquad \nabla^2u\in L^\infty_tL^2_x,\qquad
 \nabla u\in L^2_tW^{1,q}_x,
\]
where $q>2$. The planar interpolation inequality gives
\[
 \|u\|_\infty\le C\|\nabla^2u\|_2^{2/(p_u+2)}\|u\|_{p_u}^{p_u/(p_u+2)},
\]
so $u\in L^\infty_tL^\infty_x$. The embedding $W^{1,q}\hookrightarrow L^\infty$ gives $\nabla u\in L^1_tL^\infty_x$. Consequently the Carath\'eodory flow
\[
 X(t,y)=y+\int_0^t u(s,X(s,y))\,ds
\]
is a bi-Lipschitz homeomorphism at each time, with displacement at most $\int_0^T\|u(s)\|_\infty ds$ and forward and inverse Lipschitz constants at most $\exp\int_0^T\|\nabla u(s)\|_\infty ds$.

The continuity equation has the characteristic identity
\[
 \rho(t,X(t,y))=\rho_0(y)\exp\left[-\int_0^t\operatorname{div}u(s,X(s,y))\,ds\right],
 \qquad \rho(t,X(t,y))J_X(t,y)=\rho_0(y).
\]
Here the characteristic formula first holds almost everywhere; spatial continuity of $\rho$, supplied by $W^{1,q}$, gives the support conclusion for its continuous representative. One justification is spatial mollification: the commutator in $u\cdot\nabla\rho$ has $L^q$ norm bounded by $C\varepsilon\|\nabla u\|_\infty\|\nabla\rho\|_q$, whose time integral tends to zero. Composition with the flow preserves local convergence because its Jacobians are bounded above and below. Integrating the mollified equation along trajectories gives the formula. In particular, no division by density occurs.

If $\operatorname{supp}\rho_0\subset\overline{B_L}$, define
\[
 \Omega_t=X(t,\mathbb R^2\setminus\overline{B_L}).
\]
This is connected and open, is vacuum, and contains the exterior of a ball: its complement is the compact set $X(t,\overline{B_L})$. At this stage the support is only transported, not yet fixed.

\paragraph{2. Planar superharmonic rigidity.}
Let $\Omega$ be connected and contain $\{|x|>L_1\}$. Suppose $v\ge0$, $v\in W^{2,2}_{\rm loc}(\Omega)\cap L^p(\Omega)$ for finite $p\ge1$, and $-\Delta v\ge0$ distributionally. Its circular mean $A(r)$ on $r>L_1$ satisfies $(rA')'\le0$. Therefore $H(s)=A(e^s)$ is nonnegative and concave on $(\log L_1,\infty)$. A negative secant slope would, by concavity, force $H$ eventually negative. Hence $H$ is nondecreasing. Jensen's inequality gives
\[
 2\pi\int_{\log L_1}^\infty H(s)^p e^{2s}\,ds\le\int_{|x|>L_1}|v|^p\,dx<\infty.
\]
Nonnegativity and monotonicity force $H=0$. Thus $v=0$ on the exterior. Since $W^{2,2}_{\rm loc}$ embeds into continuous functions in two dimensions, the super-mean inequality propagates a zero to every sufficiently small ball centered at it: the sphere mean is nonnegative and at most the zero center value. The zero set is relatively open and closed, and connectedness gives $v=0$ throughout $\Omega$.

This argument requires both nonnegativity and finite spatial $L^p$ integrability. It does not infer either from far-field language alone.

\paragraph{3. One common exceptional time set.}
Use Fubini to select a single full-measure set $G\subset(0,T)$ on which the equations hold almost everywhere in space and all necessary spatial norms are finite. In particular, at $t\in G$,
\[
 \theta(t)\in L^{p_\theta},\quad \nabla\theta(t),\nabla^2\theta(t)\in L^2,
 \quad u(t)\in L^{p_u},\quad \nabla u(t)\in W^{1,q}.
\]
The thermal Hessian bound used here is the unweighted $\nabla^2\theta\in L^2(\mathbb R^2\times(0,T))$ explicitly displayed in Wang-v1 (1.8), not merely a time-weighted bound. Local $L^2$ integrability of $\theta$ follows from $p_\theta\ge2$, so $\theta(t)\in W^{2,2}_{\rm loc}$.

On $\Omega_t$, the conservative thermal equation reduces to
\[
 -\kappa\Delta\theta=Q(u),\qquad
 Q(u)=\mu(\partial_1u_1-\partial_2u_2)^2
       +\mu(\partial_2u_1+\partial_1u_2)^2
       +b(\operatorname{div}u)^2\ge0.
\]
The reduction is legitimate because the transported exterior is a spacetime vacuum region, and the equations have regular distributional derivatives. Applying the preceding lemma gives $\theta(t)=0$ on $\Omega_t$, then $Q(u(t))=0$ there.

Strict $b>0$ forces $D(u)=0$. Distributionally,
\[
 \partial_i\partial_j u_k
 =\partial_iD_{jk}+\partial_jD_{ik}-\partial_kD_{ij}=0.
\]
Connectedness implies $u=Ax+c$ with constant skew-symmetric $A$. Finite $L^{p_u}$ integrability on an exterior region forces $A=c=0$. Spatial continuity of $u$ makes this pointwise vanishing on $\Omega_t$ for every $t\in G$.

Now fix any $y\notin\overline{B_L}$. For every time, $X(t,y)\in\Omega_t$ by definition. On the same set $G$, independent of $y$, its velocity is zero. The integral flow equation therefore gives $X(t,y)=y$ for every $t\in[0,T]$. Bijectivity gives
\[
 X(t,\overline{B_L})=\overline{B_L},\qquad
 \operatorname{supp}\rho(t)\subset\overline{B_L}.
\]
Moreover, $u=\theta=0$ outside $B_L$ for almost every time. Thus no particle-dependent exceptional sets are being intersected over an uncountable family.

\paragraph{4. Energy at zero is an obligation, not an assumption.}
The conservative traces alone would not imply convergence of kinetic energy without additional control. The actual class supplies that control. Write $V_v(t,y)=v(t,X(t,y))$ for $v=u$ or $v=\theta$, in the fixed Hilbert space $H=L^2(\rho_0dy)$. The class implies
\[
 \|\sqrt\rho\,(u\cdot\nabla v)\|_2
 \le\|\rho\|_\infty^{1/2}\|u\|_\infty\|\nabla v\|_2,
 \qquad \sqrt\rho\,\dot v\in L^1_tL^2_x.
\]
For velocity use $\sqrt\rho u_t\in L^\infty_tL^2_x$; for temperature use $\sqrt\rho\theta_t\in L^2_tL^2_x$. Both unweighted gradient norms are bounded in time. These are exact entries of (1.8).

To justify the weighted chain rule, exhaust the positive-density initial set by $D_n=\{|y|<n,\rho_0(y)>1/n\}$. On its transported tube, density has the lower bound $n^{-1}\exp[-\int_0^T\|\operatorname{div}u\|_\infty ds]$. On compact subsets of that tube, the weighted time derivative is an ordinary local Sobolev derivative. Mollification and the flow chain rule, followed by exhaustion, yield
\[
 \|V_v(t)-V_v(s)\|_H\le\int_s^t\|\sqrt\rho\,\dot v(\tau)\|_2d\tau.
\]
Thus $V_v$ has an absolutely continuous representative with a strong limit $V_{v,*}$ at zero. This is a lower bound only on an exhaustion used in the proof, not a new global density hypothesis.

For any compact smooth $\phi$, change of variables gives
\[
 \int\rho(t)v(t)\phi\,dx
 =\int\rho_0(y)V_v(t,y)\phi(X(t,y))\,dy.
\]
The right side tends to $\int\rho_0V_{v,*}\phi$ because $X(t)\to\mathrm{Id}$ uniformly and $V_v(t)\to V_{v,*}$ strongly in $H$. The conservative initial trace identifies $V_{v,*}=v_0$ $\rho_0$-almost everywhere. Consequently,
\[
 \lim_{t\downarrow0}\frac12\int\rho|u|^2=\frac12\int\rho_0|u_0|^2,
 \qquad
 \lim_{t\downarrow0}c_v\int\rho\theta=c_v\int\rho_0\theta_0.
\]
The second assertion uses $|\int\rho_0(V_\theta-\theta_0)|\le m^{1/2}\|V_\theta-\theta_0\|_H$.

\paragraph{5. Conservation on positive times.}
After fixed support has been proved, choose one smooth spatial cutoff equal to one on a neighborhood of $\overline{B_L}$. All flux errors lie where $u=\theta=\rho=0$, and their weak spatial derivatives vanish there. Thus no unweighted $L^1$ temperature assumption is needed. Local product tests, justified on positive-time intervals by Sobolev regularity and time mollification, give
\[
 K'+\int Q=\int P\operatorname{div}u,\qquad
 U'=\int Q-\int P\operatorname{div}u,
\]
where $K=\frac12\int\rho|u|^2$ and $U=c_v\int\rho\theta$. The right sides are integrable: $\nabla u\in L^\infty_tL^2_x$ and $\|P\|_2\le R\|\rho\|_\infty^{1/2}\|\sqrt\rho\theta\|_2$. Hence $K,U$ are absolutely continuous and $E=K+U$ is constant. The preceding trace argument identifies that constant as the physical initial energy $E_0$. Mass conservation follows either from the mass Jacobian or the same fixed-cutoff test.

For completeness, the positive-time local tests do not require unweighted $\theta_t$ in vacuum. On positive-time intervals, $\nabla\theta_t\in L^2$ and $\sqrt\rho\theta_t\in L^2$ provide local control by the mass-anchor Poincar\'e estimate. Alternatively, the internal-energy identity follows directly from the conservative thermal equation. The kinetic test can also be justified using the weighted material chain rule above.

\paragraph{6. Virial contradiction and constants.}
With the same fixed cutoff define
\[
 I(t)=\int\rho|x|^2,\qquad J(t)=\int\rho u\cdot x.
\]
Continuity and conservative momentum give
\[
 I'=2J,\qquad
 J'=\int\rho|u|^2+2\int P-\int\operatorname{tr}S.
\]
Here $S=2\mu D(u)+\lambda(\operatorname{div}u)I$ and $\operatorname{tr}S=2b\operatorname{div}u$. Since $u$ vanishes outside the fixed ball, $\int\operatorname{div}u=0$. Therefore, with $c_*=\min\{1,R/c_v\}$,
\[
 I''=4K+4(R/c_v)U\ge4c_*E_0,
 \qquad I(t)\le mL^2.
\]
The density and momentum traces determine $I(0)=I_0$ and $J(0)=J_0$, using compact tests equal to $|x|^2$ and $x$ on the support. Integrating twice gives
\[
 I_0+2J_0t+2c_*E_0t^2\le I(t)\le mL^2.
\]
For $m>0$ and an integrable density supported in $\overline{B_L}$, $I_0<mL^2$: the sphere has Lebesgue measure zero. If a solution exists on $[0,T_*)$, then
\[
 T_*\le\frac{-J_0+\sqrt{J_0^2+2c_*E_0(mL^2-I_0)}}{2c_*E_0}.
\]
For $J_0=0$ this is $\sqrt{(mL^2-I_0)/(2c_*E_0)}$. No zero-momentum or second-moment hypothesis has been added; compact support itself supplies the moments. This excludes global solutions but asserts finite-time loss of a locally existing solution only if its local existence is separately established.

\paragraph{7. Compatible small positive-energy family.}
Let
\[
 r(x)=\begin{cases}e^{-1/(4-|x|^2)},&|x|<2,\\0,&|x|\ge2,\end{cases}
 \qquad
 h(x)=\begin{cases}e^{-1/(1-|x|^2)},&|x|<1,\\0,&|x|\ge1.\end{cases}
\]
For $0<\delta\le1$, set $\rho_0^\delta=r$, $u_0^\delta=0$, $\theta_0^\delta=\delta h$ and
\[
 g^\delta=R\delta\,\frac{\nabla(rh)}{\sqrt r}\quad\text{on }B_1,
 \qquad g^\delta=0\quad\text{elsewhere}.
\]
Since $r$ is strictly positive on a neighborhood of $\overline{B_1}$ and $h$ is flat at its boundary, $g^\delta$ is smooth and compactly supported. Exactly,
\[
 -\mu\Delta u_0^\delta-b\nabla\operatorname{div}u_0^\delta
       +R\nabla(\rho_0^\delta\theta_0^\delta)
 =\sqrt{\rho_0^\delta}\,g^\delta.
\]
All weighted density norms in (1.6) are fixed and finite. The velocity norms vanish. The norms $\|\sqrt r\,\theta_0^\delta\|_2$, $\|\nabla\theta_0^\delta\|_2$, and $\|g^\delta\|_2$ are $\delta$ times fixed finite constants. Thus the family has fixed positive mass and common finite upper bounds for every stipulated initial norm. Both velocity and temperature vanish at infinity initially. Moreover,
\[
 E_0^\delta=c_v\delta\int rh=:C_E\delta>0,
 \qquad E_0^\delta\downarrow0.
\]
The density lower bound used to define $g^\delta$ is only on the support of the thermal bump; the density remains compactly supported and has vacuum. No thermal compatibility condition is asserted or imported.

This family satisfies the displayed initial hypotheses and has actual finite-Lebesgue initial representatives. It therefore avoids the initial constant-representative issue. That fact does not independently prove local solvability in (1.8). The conditional obstruction proves absence of global solutions for these data regardless of whether they admit a local solution. A positive energy threshold based only on the common initial upper bounds cannot guarantee global existence in this exact class for every datum in the family.

\paragraph{8. Strict-viscosity boundary and failure routes.}
The proof is restricted to $b>0$. At $b=0$, $Q=0$ need not imply a rigid motion. On an exterior region,
\[
 u(x)=\frac{(x_1,-x_2)}{|x|^2}
\]
is nonzero, lies in $L^p$ for $p>2$, and satisfies $\partial_1u_1=\partial_2u_2$ and $\partial_2u_1+\partial_1u_2=0$, hence $Q=0$. Thus the velocity-rigidity step genuinely fails at the endpoint. This is a counterexample to that analytic implication, not a constructed PDE solution.

Other invalid shortcuts would be: replacing the finite temperature norm by informal far-field decay; following particles before fixing a common good-time set; asserting support invariance from transport alone; identifying initial kinetic energy from weak conservative traces alone; or importing local existence solely from the statement of Wang's theorem. The present conditional proof avoids these shortcuts. No conclusion is drawn about an altered solution class.

N0006 的严格黏性情形 μ+λ>0：紧支撑条件否定全局解的论文证明链通过本轮审查，未发现实际数学反例或首个无效步骤；这仍是未获 Lean 认证的草稿证据。
Wang-v1 第3页 (1.8) 确实包含所需的有限温度 L²_tL^{q₃}_x、无时间权 Hessian L²_{t,x}、加权时间导数和速度空间。来源核对仅限用户序列化正文，不声称检查了 PDF 文件或其他版本。
共同满测时间集可先于粒子选择固定；空间连续代表把真空区速度的几乎处处消失升级为逐点消失，因此固定支撑步骤成立。
初始能量匹配需要证明：加权物质导数可积使流拉回在 L²(ρ₀dy) 中绝对连续，保守初始迹随后识别其强极限。
给定热数据族具有固定正质量、共同有限初始范数上界、精确动量相容性及趋零的正物理能量；初始速度和温度均紧支撑，避开常数代表问题。
结论是不存在该类全局解。尚不能将该数据族解释成已证局部存在后有限时间失去正则性的实例。
μ+λ=0 时外部 Q=0 推出刚体运动的步骤确实失效，本轮不推广到该端点。

UNRESOLVED
该热数据族在精确 Wang-v1 (1.8) 类中的局部存在尚未独立证明；满足显示初始假设不替代局部构造核验。
流、加权链式法则、分布超调和刚性、局部乘积测试及其组合均未实际 Lean 编译：NOT_RUN。
本轮为 NONBLIND 对抗审查，不能替代另行要求的盲重推和独立语义审查。
N0006 尚未满足项目推广门槛，不得用作已验证依赖解锁子节点；完整全局研究目标仍为 OPEN。
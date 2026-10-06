# 王雪二维全可压缩 Navier–Stokes 局部解原文基线核对

核对日期：2026-10-06。范围：只读给定 PDF 的文献事实；不读旧研究证明或结论，不推导新的数学命题，不修改主项目。本报告未对论文全部证明作有效性认证，也不是任何 Lean 证明节点。

## 1. 源文件身份和页码约定

- 文件：`user-provided Wang-v1 PDF (identified below by SHA-256)`。
- SHA-256：`a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d`。
- 34 个 PDF 页面，正文印刷页码与 PDF 页序一致；下文均以 PDF 页码定位。
- 第 1 页题名（保留原文拼写）：**On Local Existence and Blowup Criterion of Strong Solutions to Cauthy Problem of 2D Full Compressible Navier-Stokes System with Vacuum**。
- 作者：**Xue Wang**；单位为 School of Mathematical Sciences, University of Chinese Academy of Sciences。
- 第 1 页边栏版本：**arXiv:2212.13343v1 [math.AP], 27 Dec 2022**。本报告只核对该本地 v1 文件，不对后续 arXiv 版本或期刊版本作任何陈述。
- 已以 PDF 渲染图复核第 3、4、20 页的关键指数、空间和文字，避免仅凭文本抽取识别根号范围或上下标。

## 2. 方程、参数、初值和远场原文

第 1 页 (1.1)：

\[
\rho_t+\operatorname{div}(\rho u)=0,
\]
\[
(\rho u)_t+\operatorname{div}(\rho u\otimes u)-\mu\Delta u-(\mu+\lambda)\nabla\operatorname{div}u+\nabla P=0,
\]
\[
c_\nu[(\rho\theta)_t+\operatorname{div}(\rho\theta u)]
-2\mu|D(u)|^2-\lambda(\operatorname{div}u)^2
+P\operatorname{div}u-\kappa\Delta\theta=0.
\]

其中 \(P=R\rho\theta\)、\(R>0\)、\(D(u)=(\nabla u+(\nabla u)^{\mathrm{tr}})/2\)。第 1 页 (1.2) 要求 \(\mu>0\)、\(\mu+\lambda\ge0\)；\(c_\nu,\kappa\) 为正常数。第 2 页规定空间区域 \(\Omega=\mathbb R^2\)。

第 2 页 (1.3) 的初值形式为

\[
(\rho,\rho u,\rho\theta)(x,0)
=(\rho_0,\rho_0u_0,\rho_0\theta_0)(x).
\]

第 2 页 (1.4) 写为

\[
(\rho,u,\theta)(x,t)\longrightarrow(0,0,0)
\quad (|x|\to\infty,\ t>0),
\]

紧邻该式的限定语是 **“in some weak sense”**。式 (1.4) 本身没有给出该弱意义的拓扑、点态版本、商空间代表或常数归一化的定义。本次正文定位检索未发现另立的 “representative” 或 “modulo” 定义。第 7 页近似问题仍使用 “vanishing at infinity” 的措辞。

第 2 页约定 \(L^p=L^p(\mathbb R^2)\)、\(W^{k,p}=W^{k,p}(\mathbb R^2)\)、\(H^k=W^{k,2}\)。

## 3. 初值基线：定理 1.1，第 3 页

权函数和参数直接写为

\[
\eta_0>0,\qquad
\bar x=(e+|x|^2)^{1/2}\log^{1+\eta_0}(e+|x|^2),
\qquad q>2,\quad a>1.
\]

(1.6) 要求

\[
0\le \bar x^a\rho_0\in L^1\cap H^1\cap W^{1,q},
\qquad \theta_0\ge0,
\]
\[
\sqrt{\rho_0}\,u_0\in L^2,
\qquad \sqrt{\rho_0}\,\theta_0\in L^2,
\qquad \nabla u_0\in H^1,
\qquad \nabla\theta_0\in L^2.
\]

这里第二个密度加权量的平方范数是 \(\int\rho_0\theta_0^2\,dx\)，根号仅作用于密度，原文不是 \(\sqrt{\rho_0\theta_0}\)。

(1.7) 的动量兼容条件为

\[
-\mu\Delta u_0-(\mu+\lambda)\nabla\operatorname{div}u_0
+R\nabla(\rho_0\theta_0)=\rho_0^{1/2}g,
\qquad g\in L^2.
\]

定理 1.1 的 (1.6)–(1.7) 中：

- 没有单列 \(u_0\in L^{q_2}\)、\(u_0\in L^2\)、\(\theta_0\in L^2\)；
- 没有单列热方程的第二条兼容条件；
- 没有小能量假设、总动量为零的假设、密度处处严格正的假设或密度紧支撑的假设；
- 没有显式单列 \(\int\rho_0\,dx>0\) 或 \(\int\rho_0\,dx=1\)。证明中对此另有使用，见第 7 节待核对点。

第 7 页定理 3.1 是带 \(\delta\theta\) 阻尼的近似问题：在定理 1.1 条件中去掉 \(\theta_0\ge0\)，另加 \(\theta_0\in L^2\)。该额外无权 \(L^2\) 假设属于近似问题定理 3.1，不能直接移写为主定理 1.1 的原始初值条件。

## 4. 强解定义及完整解类

第 3 页 Definition 1.1：方程 (1.1) 中涉及的所有导数为 regular distributions，且方程在 \(\mathbb R^2\times(0,T)\) 几乎处处成立时，称为强解。具体正则性由随后定理的 (1.8) 给出。

定理 1.1 断言存在正时间 \(T^*\)，使问题 (1.1)、(1.3)、(1.4) 有唯一强解 \((\rho\ge0,u,\theta\ge0)\)，满足第 3 页 (1.8)：

\[
\rho\in C([0,T^*];L^1\cap H^1\cap W^{1,q}),
\qquad
\bar x^a\rho\in L^\infty(0,T^*;L^1\cap H^1\cap W^{1,q});
\]
\[
\nabla u\in L^\infty(0,T^*;H^1)\cap L^2(0,T^*;W^{1,q}),
\qquad
u\in L^\infty(0,T^*;L^{q_2});
\]
\[
\sqrt\rho\,u,\ \sqrt\rho\,\theta,\ \sqrt\rho\,u_t,\ \nabla\theta,
\ \sqrt t\sqrt\rho\,\theta_t,\ \sqrt t\nabla^2\theta,
\ \bar x^{\alpha/2}\nabla u
\in L^\infty(0,T^*;L^2);
\]
\[
\nabla u_t,\ \sqrt\rho\,\theta_t,\ \nabla^2\theta,\ \sqrt t\nabla\theta_t
\in L^2(\mathbb R^2\times(0,T^*));
\]
\[
\theta\in L^2(0,T^*;L^{q_3}),
\qquad
\sqrt t\nabla^2\theta\in L^2(0,T^*;L^{q_1}).
\]

第 3 页 (1.9) 参数为

\[
\alpha=\min\{a/2,1\},\qquad
q_1\in(2,\infty),\qquad
q_2=4/\alpha,\qquad
q_3=6/(2\alpha-1).
\]

原文将 \(u\) 本身置于指定的无权有限 \(L^{q_2}\) 空间；定理结论没有将它写成 \(u-c\) 或 “模去常数后的某个代表”。这里原文只指定上述 \(q_2\)，没有在 (1.8) 中断言所有有限 \(p\) 的无权 \(L^p\) 性质。

第 3 页 Remark 1.2 只说初值具额外正则性时可成为经典解；该 Remark 没有列出额外正则性的完整条件。

## 5. 无权速度、加权梯度与 eta 的准确源位置

第 5 页引理 2.2 定义

\[
\widetilde D^{1,2}(\Omega)
=\{f\in H^1_{\mathrm{loc}}:\nabla f\in L^2(\Omega)\}.
\]

第 5 页引理 2.3 的密度条件含 \(\rho\in L^\infty(\Omega)\) 及 \(\int_{B_{N_1}}\rho\,dx\ge M_1>0\)。对 \(v\in\widetilde D^{1,2}\)，(2.9) 控制 \(\|\bar x^{-1}v\|_{L^2}\)；(2.10) 对 **\(\epsilon>0\)、\(0<\eta\le1\)** 控制

\[
\|\bar x^{-\eta}v\|_{L^{(2+\epsilon)/\eta}}
\le C\|\sqrt\rho\,v\|_{L^2}
+C(\|\rho\|_{L^\infty}^{1/2}+1)\|\nabla v\|_{L^2}.
\]

这里 \(\eta\) 是不等式中的辅助参数，与权函数的固定参数 \(\eta_0>0\) 不同。第 18 页 (4.7)–(4.9) 使用相同 \(\epsilon>0\)、\(\eta\in(0,1]\) 范围。第 20 页 (4.20) 之后另一个加权 \(\rho\dot u\) 估计使用 \(p\in[1,2)\)、\(\eta\in[0,a/2]\)；这是不同公式的参数范围。

第 6 页引理 2.4 的原文对象是 **\(v\in C_0^\infty(\mathbb R^2)\)**，结论 (2.12)：

\[
\|v|x|^l\|_{L^p}\le C(k,l)\|\nabla v|x|^k\|_{L^2},
\qquad 0<k<\infty,\quad k-1\le l<k,\quad p=2/(k-l).
\]

第 17 页 Proposition 4.1 的 (4.3)，以及第 18 页 Lemma 4.1 的 (4.5)，均包含 \(\|\bar x^{\alpha/2}\nabla u\|_2\) 与 \(\|u\|_{q_2}\)。第 19 页 (4.16) 声明 \(\int\rho\dot u\,dx=0\)，以此展开核的消去。第 20 页 (4.20) 先控制 \(\|\nabla u|x|^\beta\|_2\)，范围 \(0<\beta<\alpha\)。随后原文明确说选 \(\beta=\alpha/2\) 并应用 Lemma 2.4，得到含 \(\|u\|_{q_2}\) 的无编号不等式。这是无权速度可积性的直接证明位置。

第 16 页 (3.61) 和第 23 页 (4.28) 写出的初值逼近收敛量是 \(\nabla u_0\) 的 \(H^1\) 范数与 \(\sqrt{\rho_0}u_0\) 的 \(L^2\) 范数。第 16 页 (3.62) 使用空间截断，并在球外零延拓。第 17 页以弱收敛和标准紧性论证通过第一层逼近；第 23 页以标准紧性论证通过 \(\delta\to0\) 的第二层逼近。

温度无权可积性的独立证明位于第 23–24 页：由 (4.30)–(4.31) 及 (4.32) 得到 \(\nabla\theta\) 的 \(L^{q_4}\) 估计，其中第 24 页定义 \(q_4=3/(1+\alpha)\in[3/2,2)\)。紧接着使用 \(q_3=2q_4/(2-q_4)=6/(2\alpha-1)\) 写出 \(\int_0^{T^*}\|\theta\|_{q_3}^2dt\le C\int_0^{T^*}\|\nabla\theta\|_{q_4}^2dt\le C\)。

## 6. 延拓/爆破判据

第 3 页 Theorem 1.2 假设定理 1.1 条件，并限定为其得到且满足 (1.8) 的强解。若最大存在时间 \(T_*<\infty\)，则第 3 页 (1.10) 为

\[
\lim_{T\uparrow T_*}
\left(
\|\operatorname{div}u\|_{L^1(0,T;L^\infty)}
+\|u\|_{L^1(0,T;L^{q_2})}
\right)=\infty,
\qquad q_2=4/\alpha.
\]

这里两个时间范数均为 \(L^1\)，速度空间范数是无权 \(L^{q_2}(\mathbb R^2)\)。判据中没有温度范数。第 24 页 (5.1) 以该和在 \(T\uparrow T_*\) 时有限作为反证假设。

第 32 页末尾给出原文的延拓步骤：称 \((\rho,u,\theta)(\cdot,T_*)\) 满足 (1.6)，并由动量方程和 Lemma 5.5 构造兼容项 \(g\in L^2\)，满足 (1.7)，然后再次使用定理 1.1 延拓。报告只登记该证明结构，不为其全部极限/迹论证提供独立认证。

第 4 页 Remark 1.3 另陈述未编号的 Serrin 型替代判据：

\[
\lim_{T\uparrow T_*}
\left(
\|\operatorname{div}u\|_{L^1(0,T;L^\infty)}
+\|u\|_{L^{2(q_2+1)/q_2}(0,T;L^{2(q_2+1)})}
\right)=\infty.
\]

原文称其证明与 Theorem 1.2 几乎相同。该替代式属于 Remark 1.3；主定理编号 (1.10) 仍是前述 \(L^1_tL^{q_2}_x\) 版本。

本文主定理为局部存在与爆破/延拓判据，不是二维带热传导全系统的小能量全局存在定理。

## 7. 留给后续独立核查的事项（本报告不作裁决）

1. **正质量条件的显式性。** 第 3 页 (1.6) 未列 \(\int\rho_0>0\)；第 16 页 Theorem 3.1 的证明写 “Without loss of generality” 并令 \(\|\rho_0\|_1=1\)，继而取局部质量至少 \(3/4\)。第 17 页 (4.1) 使用局部质量至少 \(1/2\)。需在拟引用基线中说明正质量是否为隐含前提以及是否排除全真空。本报告不替原文补条件。
2. **远场与代表选择。** 第 2 页 (1.4) 只给 “in some weak sense”。第 6 页 Lemma 2.4 仅对紧支撑光滑函数陈述，第 20 页直接应用于解 \(u\)。该处没有单列从该函数类到解类的稠密性、边界消失或常数代表选择引理。需独立核查这种过渡与初值取迹是否完全兼容；本报告不据此推导失效或反例。
3. **温度的无权 Sobolev 过渡。** 第 24 页在 (4.32) 后直接由梯度 \(L^{q_4}\) 控制 \(\theta\) 的无权 \(L^{q_3}\) 范数，未在该处另立代表选择论证。待核对所用空间闭包和远场含义。
4. **(4.16) 末尾的极限文字。** 第 20 页图像确实印着 “Letting \(r\to0\)”；同一段使用的是 (3.62) 中 \(B_r\) 截断和环带 \(r/2\le|x|\le r\)。需查明该处是否为排印错误。报告按原文记录，不静默改为另一极限。
5. **证明完整度边界。** 第 17 页 Theorem 3.1 的唯一性证明以与 [21] 类似为由略去；第 32 页部分极限/连续性步骤称 standard arguments。本报告未读取 [21] 对应证明，也未认证这些引用与本全系统的所有假设逐项吻合。

以上待核对事项只规定源文献审查尚未闭合的位置，不构成论文错误结论，也不构成新的全局定理或数学推进。


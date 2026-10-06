# 紧支撑分支英文整合复核记录 — 2026-10-06

## 范围与输入

本次任务仅把主控已复核的 N0006 纸面论证整合为英文稿，不生成子节点、不推进新方向、不认证局部存在、不晋升研究树状态。

唯一修改文件：

- 主项目相对路径：research/compact-recheck/paper_en_reviewed.tex。
- 研究树相对路径：notes/compact-writing-review-20261006.md（本记录）。

只读输入：

- 主项目 AGENTS.md；
- manuscript/li_xin_style.sty 与 research/compact-recheck/li_xin_style.sty；
- 本研究树 notes/sources/wang-v1-baseline-20261006.md；
- 本研究树 notes/nodes/N0006/independent-proof-20261006.md；
- 本研究树 notes/nodes/N0006/redteam-20261006.md；
- 被替换稿的宏定义，仅用于保留既有记号语义。

主控已保留修改前快照 frozen/before-research-integration-20261006T134854Z。两个样式文件 SHA-256 均为 88186C94D9D5C9EF6DA52A876A21C7D45462A645E66E0B4BAAA727CEF042977B；本次未改样式。没有修改 manuscript/paper_en.tex、研究树注册表、Git、其他研究稿或形式化文件。

## 成稿与准确结论

题名：A Conditional Compact-Support Obstruction for Planar Heat-Conducting Compressible Flow。

保留空作者栏；首页及后续页眉含 Draft。沿用 li_xin_style 和既有宏 \R、\dd、\dt、\Div、\supp、\norm、\cH。正文四节依次为方程、解类和主定理；外部真空与固定支撑；时间迹与能量；virial 与小正能量数据族。

精确结论：μ>0、μ+λ>0、R,c_v,κ>0，非负温度，完整 Wang-v1 显示解类及保守初始迹，正质量紧支撑初始密度和正物理能量，条件性排除在每个有限区间保持该类的全局解。显式时长上界为

T_* ≤ [-J_0 + sqrt(J_0² + 2βE_0(ML²−I_0))]/(2βE_0)，β=min{1,R/c_v}。

正文没有把“满足显示初值条件”升级为独立局部可解性，也没有把条件全局排除改写成已构造局部解的有限时爆破。正文明确源文献允许 μ+λ≥0，而本证明仅覆盖严格情形。未保留端点定理或未经本轮授权的加速度、压力、热估计等其他方向。

数学陈述仅有五个实质 theorem-family 环境：一个主定理、一个外部超调和引理、两个统领命题、一个数据族推论；另有一个完整解类定义。没有空节、工程审计小节或逐公式命题化。

## 来源与新标签映射

下表中的“源页码”来自授权的源基线，本写作进程未重新检查 PDF，也没有把文献存在性证明视为已认证。唯一参考文献为 Wang-v1，题名保留源拼写 Cauthy，版本固定 arXiv:2212.13343v1，27 December 2022。源 PDF 身份由基线记录的 SHA-256 a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d 确定。

| 审定来源 | 新稿位置/标签 | 写作处理与边界 |
|---|---|---|
| Wang-v1 pp.1–2, (1.1)–(1.3) | eq:mass, eq:momentum, eq:thermal, eq:stress, eq:traces | 全系统守恒形式，保守初始变量；c_v 对应源文献 c_ν，R 为气体常数。 |
| Wang-v1 p.1, (1.2) | eq:parameters | 源允许 μ+λ≥0；明确收窄到 μ+λ>0，未暗称源本身要求严格正。 |
| Wang-v1 p.2, (1.4) | def:solution 后说明 | 保留弱远场措辞的未指定拓扑边界；证明实际使用指定有限 Lebesgue 范数。 |
| Wang-v1 p.3, (1.6)–(1.7) | eq:data, eq:compatibility | √ρ_0 θ_0 的根号仅作用于密度；未添加无权初始 L²、初始 L^{p_u} 或热兼容条件。 |
| Wang-v1 p.3, Definition 1.1, (1.8)–(1.9) | def:solution, eq:weights, eq:fullclass, eq:usedclass | 完整原解类先逐项列出，随后列实际使用的充分子表；没有用子表替换完整假设。 |
| 独立重建 §1；对抗审查 §6 | eq:compactdata, eq:moments, eq:strictmoment, thm:obstruction, eq:mainbound, eq:lifespan | 正质量单列，紧支撑自动给出矩有限性；I_0<ML² 用积分密度及圆周零测说明。 |
| 独立重建 §2；对抗审查 §1 | eq:velocitybound–eq:transportdensity | 采用独立重建的单位球平均估计；可积空间 Lipschitz 常数、双 Lipschitz 流、Jacobian 与密度卷积交换子一并展开。 |
| 独立重建 §3；对抗审查 §3 | eq:commonexterior, eq:vacuumthermal, eq:commontimes | 先取得开放时空真空区，再以可数柱和稠密测试集构造共同满测时间集；不在孤立切片把保守时间导数置零。 |
| 独立重建 §4；对抗审查 §2 | lem:superharmonic, eq:concavemean, eq:meanLp, eq:supermean | 对数半径圆均值凹性、有限 L^p 迫零、局部超均值传播到连通域，全过程写入正文。 |
| 独立重建 §5；对抗审查 §3 | prop:fixedsupport, eq:positiveQ, eq:rigididentity, eq:exteriorzero, eq:fixedsupport | 严格正耗散给 D(u)=0，有限 L^{p_u} 排除外部刚体运动；同一 G 对所有轨道适用，固定原球。 |
| 独立重建 §6；对抗审查 §4 的“初始能量须证明”要求 | eq:compactSobolev, eq:utPoincare, eq:velocitytrace, eq:identifytrace, eq:kinetictrace | 采用主控指定的紧支撑空间 Poincaré 路线；时间局部卷积、空间卷积、弱极限和时间耗尽补足 u_t∈L²H¹，不依赖更复杂的加权物质链式法则。 |
| 独立重建 §7；对抗审查 §5 | prop:energy, eq:densitytime–eq:internalbalance, eq:energyconservation | 动能乘积法则和压力 L² 配对合法性明确；热方程只作固定空间测试，保守热迹识别 U(0)，未假设 θ 的强迹。 |
| 独立重建 §8；对抗审查 §6 | sec:virial, eq:firstvirial–eq:momentupper | 固定截断计算 I'=2J、J'=2K+2(R/c_v)U，∫div u=0，I''≥4βE_0；最后取正根。 |
| 独立重建 §9；对抗审查 §7 的构造边界 | cor:smallenergy, eq:familydefinition–eq:familylifespan | 采用独立重建的 r=c f²、u_0=0、θ_0=εr；质量任意固定，g=2Rε√r∇r 平滑，所有初值上界固定，E_0>0 且趋零。 |
| 两份审查的结论边界 | 摘要、主定理后、正文末尾 | 条件性全局排除；局部存在尚未独立认证；端点与替代解类未覆盖。 |

## 未形式化的分析义务

以下内容已按两份获授权纸面材料写成数学证明，但本次没有 Lean 执行或内核认证。需要真实形式化时，不能把这些节点直接作为已证 PDE 依赖输入。

1. 有限 Lebesgue 代表与 Sobolev 嵌入；时变可积 Lipschitz 速度的全局空间流、逆流、Jacobian 与密度交换子极限。
2. 从开放时空真空区的分布等式，到单一共同满测时间集合上的空间等式；代表连续性及所有轨道共用该集合。
3. 分布超调和函数的对数圆均值公式、凹性和局部超均值不等式；连通域上的零值传播。
4. D(u)=0 的分布刚性、有限 L^{p_u} 消去仿射运动、外部轨道静止及固定初始球。
5. 固定支撑分布的空间 Poincaré 升级；u_t 的时空卷积、弱紧性、时间耗尽、H¹ 时间迹与初始动能识别。
6. 密度时间正则性、动能乘积法则、弱动量测试、压力配对、固定热测试的通量消失、保守热迹及总能量恒等式。
7. 含固定截断的质量、矩和动量测试，初始矩迹，virial 二次不等式、正根与时长上界。
8. 光滑平坦 bump 及其平方根，固定质量归一化，兼容条件、共同初值上界和正能量族。

形式化状态：NOT_RUN。未运行 Lean/Lake、未检查公理、未做语义认证；本次写作不得晋升 N0006 或解除任何依赖门槛。局部构造和 Wang-v1 局部存在证明的完整来源认证仍在本任务之外；μ+λ=0、去掉温度非负性或改变有限 Lebesgue 空间亦未覆盖。

## 实际检查与交付边界

- 已回读磁盘文件并与预期完整文本比较：一致。
- 英文 TeX：34,274 字符，903 行（含末尾换行）。
- SHA-256：44287E13676392D18E7B9989484B4F9E4703D8D1ED4643A6164CB280098FB887。
- 70 个标签，无重复标签；所有 ref/eqref 目标存在。
- 唯一文献键 WangV1；所有 cite 目标存在。
- begin/end 环境配对完整。
- 正文不含 Lean、Agent、NOT_RUN、checkpoint 或 red-team 等工程状态措辞。
- 未运行编译、未生成或检查 PDF；按主控分工，编译、交叉引用最终轮次、页数和逐页视觉复核由主控统一完成。10–15 页仅为写作目标，未把未测量页数登记为事实。

一次全量格式更新超过 Windows 命令长度；随后逐块覆盖的方案被自动审批拒绝，原完整稿仍在。已改用完整读入、逐项短替换、校验文档终止标记和长度后一次写回全稿的方式，并经回读验证。该操作问题未导致残缺成稿，也没有留下未完成权限请求。

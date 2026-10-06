# N0001 独立重构、语义审查与 Lean 对照（2026-10-06）

本记录只处理已注册节点 N0001。独立重构仅接收 AGENTS.md 与 statement.md，未读取 xiong-agent 候选证明、其他 runs 或历史数学稿。本节点是一般 Lebesgue 分析引理；这份证明没有证明任何 FNS 解满足其前提。未派生 child，也未修改节点状态。

## 精确数学对象与结论

取二维欧氏空间 X = ℝ²，配标准欧氏范数与 Lebesgue 测度 dx。f,h : X → ℝ 都 Lebesgue 可积，且 h ≥ 0 几乎处处。χ_n : X → ℝ 可测，常数 B,C ≥ 0，满足对所有 n∈ℕ、x∈X，有 |χ_n(x)| ≤ B，且 χ_n(x) → 1 几乎处处。令 E_n = {x : n ≤ ‖x‖}。另假设对每个 n：

\[
\left|\int_X f(x)\chi_n(x)\,dx\right|
\le C\sqrt{\int_{E_n}h(x)\,dx}.
\]

目标是实际 Lebesgue 积分 ∫_X f dx = 0。Lean 中 `Plane := EuclideanSpace ℝ (Fin 2)`，所有积分采用 `volume`；`tailSet n` 精确等于 E_n。没有把 f 或 h 替换为标量占位符，没有把结论藏入某个结构或前提。形式化没有改变注册目标。

## 1. 每个积分的合法性

1. ∫f 和 ∫h 由题设 `Integrable f volume`、`Integrable h volume` 保证是真实可积积分。
2. 连续函数 x↦‖x‖ 的闭上水平集 E_n 可测。限制一个 L¹ 函数到任意可测子集仍然可积，因此 h∈L¹(E_n)，且 |h·1_{E_n}|≤|h|。这由 Lean 中 `measurableSet_tailSet` 与 `tail_integrable` 记录。尾部积分没有利用非可积函数的默认积分值。
3. f 可积蕴含几乎处处强可测，而 χ_n 可测；故 fχ_n 几乎处处强可测。逐点有
   \[
   |f(x)\chi_n(x)|=|f(x)|\,|\chi_n(x)|\le B|f(x)|.
   \]
   B|f| 可积，其积分等于 B∫|f|<∞，因此每个 fχ_n 可积。Lean 中 `tested_integrable` 用 `Integrable.mono'` 明确建立此事实；后续积分收敛定理使用该结果。
4. h≥0 几乎处处，故每个 T_n:=∫_{E_n}h dx≥0。`tail_nonneg` 明确记录此事实，所以题设的平方根是普通非负实平方根。

## 2. 尾部积分趋零

固定 x∈X，取自然数 N>‖x‖。对 n≥N，有 n>‖x‖，故 x∉E_n，并且 h(x)1_{E_n}(x)=0。因此 h1_{E_n}→0 在每个点成立。

同时 |h1_{E_n}|≤|h|，而 |h|∈L¹(X)。Lebesgue 支配收敛定理给出

\[
\lim_{n\to\infty}\int_X h(x)1_{E_n}(x)\,dx=\int_X0\,dx=0.
\]

E_n 可测，故指示函数积分等于限制测度积分。这正是 T_n→0。Lean 中 `tail_integral_tendsto_zero` 独立证明自然数最终超过固定范数，再调用 Mathlib 的积分支配收敛定理与 `integral_indicator`。该证明没有依赖有限总体积、紧支撑、矩条件或尾部衰减速率。

## 3. 被测试积分的极限

在 χ_n→1 的共同满测集上，固定 f(x) 有 f(x)χ_n(x)→f(x)。由第一步已经建立的可测性、可积性以及共同支配函数 B|f|，再次应用 Lebesgue 支配收敛定理：

\[
I_n:=\int_X f(x)\chi_n(x)\,dx\longrightarrow I:=\int_X f(x)\,dx.
\]

Lean 中 `tested_integral_tendsto` 直接形式化这次支配收敛。没有假定 χ_n 的导数、支撑、径向性或单调性。

## 4. 通量尾部估计与极限唯一性

实平方根在 [0,∞) 上连续，包括零点。由 T_n≥0 与 T_n→0，有 C√T_n→0。题设估计与绝对值非负性共同给出

\[
0\le |I_n|\le C\sqrt{T_n}\longrightarrow0.
\]

夹逼定理推出 |I_n|→0。另一方面，由 I_n→I 与绝对值连续性有 |I_n|→|I|。实数空间中极限唯一，因此 |I|=0，即 I=0。Lean 主定理按同一顺序使用平方根连续性、`squeeze_zero`、绝对值的极限与 `tendsto_nhds_unique`。

## 独立语义与反例攻击检查

- 所有量词都保留：常数 B,C 与 n 无关；χ_n→1 是几乎处处收敛；尾部估计对所有自然数 n 成立。n=0 没有产生除以零或特殊例外。
- 即使 B=0 或 C=0，论证中也没有除以 B、C、尾部积分或任何范数。
- B≥0、C≥0、h≥0 这些注册条件均保留在 Lean 主定理完整类型中。源码以 `_hB`、`_hC`、`_hh_nonneg` 命名，因为极限论证本身不需要显式调用其证明：B≥0已可由非空域上的逐点界推出，Mathlib 的 `Real.sqrt` 在整个 ℝ 上连续，而 h≥0 与 C≥0保证题设的预期非负通量解释。辅助定理 `tail_nonneg` 另行认证 h≥0→T_n≥0。保留冗余前提没有加强结论、隐藏假设或改变注册目标。
- 可积性是假设的一部分，绝不能删去后继续利用 Lean 对非可积积分的默认值。源码为每一类积分提供了实际可积性定理。
- 非空泛性：数学上可取 χ_n≡1、B=1、h≡0、C=0，并取两个面积均为1的有界矩形 A,D，令 f=1_A−1_D。则 f 可积、∫f=0，且当 A,D 不几乎处处重合时 f 并非零函数。故这些条件允许非零函数；结论只要求零均值，不要求 f=0 几乎处处。此例只用于解释语义，未作为主定理前提。
- 没有任何步骤认定 FNS 中具体 forcing 的可积性、测试许可、实际动量方程通量界、全局时间一致性或小能量闭合。上述每一项仍需独立节点和实际 Lean 门禁。
- 本节点也未证明原论文某个 PDE 命题与这里条件完全一致；source motivation 仅是动机，未充当公理。

## 形式化与证据说明

规范源码：`lean/FNSTree/N0001.lean`；根入口：`lean/FNSTree.lean`。根入口 import N0001，并输出主定理完整类型、辅助定理类型以及全部相关定理的 `#print axioms`。

`evidence/N0001/lean-driver.py` 使用已锁定的 Lean 4.33.1 环境，在 `lean/local-runtime` 实际执行 lake build 或 lake env lean ../FNSTree.lean。每次运行均保存 UTC 时间、完整 argv、cwd、退出码、完整合并输出、运行时主节点源码快照及声明/源码/可移植配置的 SHA-256。未运行 lake update，未改写、复制或重新链接已安装依赖。

本记录的最终构建状态与精确日志引用由本次运行结束时补入；只有成功构建和无自定义公理的实际输出才可供父节点审查，本文本本身不会自动提升节点状态。
## 最终实际运行结果

- 最终 `lake build`：退出码 0。日志 `evidence/N0001/lean-20261006T121647.943855Z-build.log`，同名 `.json` 记录命令、cwd、所有输入哈希与实际 Mathlib commit。
- 独立执行 `lake env lean ../FNSTree.lean`：退出码 0。日志 `evidence/N0001/lean-20261006T121718.576189Z-print.log`。包括 Plane、tailSet 定义，六个辅助引理的完整类型，主定理完整类型与证明，以及七个定理的传递公理。
- `lake env lean --version`：退出码 0。日志 `evidence/N0001/lean-20261006T121720.081029Z-version.log`。实际版本为 Lean 4.33.1，编译器 commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`。
- 实际已安装 Mathlib commit：`0df444a360eaa60ab8c11dca51a86af692955474`，与锁定值一致。
- 七个定理的传递公理全部且仅为 `propext`、`Classical.choice`、`Quot.sound`。无 `sorryAx` 或任何自定义分析公理。
- 规范主源码 SHA-256：`8369a8bb42097de05880c63ea2a07c05e3bb6e02d318a2112872f0c9cec44ed9`。
- 规范根入口 SHA-256：`c4722f765bb3f676be8e498b9ec8d3c222cf9bdd109d4c26c29d69ff8149dcb0`。
- 首次失败日志和当时源码完整保留，失败只涉及函数乘法的化简，后续通过加入 `Pi.mul_apply` 修复；未删除失败历史。

以上足以认证当前精确源码下 N0001 的实际 Lean 构建通过。节点提升仍由父审查执行；本记录没有修改树状态。七个已打印声明是同一个 N0001 节点的内部证明组成，不是七个研究节点。
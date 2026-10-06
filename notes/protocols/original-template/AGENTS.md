# AGENTS.md — <Project Name> 研究工作区

本文件是 Codex 在本仓库工作的最高优先级项目说明。每次会话开始，先读本文件。

## 1. 研究对象

- 项目名称：<填写>
- 基准论文 / 核心问题：<填写>
- 主定理或核心目标：<填写>
- 关键编号速查：<填写>

## 2. 工作区结构

| 路径 | 用途 | 规则 |
|---|---|---|
| `notes/` | 研究笔记，每个切入点一个子文件夹 | 见第 3 节 |
| `lit/` | 参考文献（`references.bib`，必要时本地 `papers/` 存 PDF） | 所有研究方向共用；只收录公开发表的学术论文或 arXiv 预印本 |
| `research/` | 新论文的 LaTeX 草稿 | 每个方向一份独立 tex；宏约定在本节下方补充 |
| `lean/` | Lean 4 形式化证明 | 见第 4 节 |

若存在已投稿或已发布的冻结版本，单独放入冻结目录，并在本节标注“只读；改动需作者确认”。

## 3. 研究方向（切入点）与笔记约定

每个切入点对应 `notes/` 下的一个子文件夹，内含 `README.md`（问题陈述、动机、状态、下一步）。研究进展按日期落盘为：

```text
notes/<direction>/findings-YYYYMMDD.md
```

同一日多份追加 `-HHMM` 后缀。固定账本/索引文件（各方向 `README.md`、`notes/README.md`、`notes/claims.md`）可不带时间戳；其余记录型 markdown 文件必须带时间戳。

新增方向时：

1. 先在 `notes/` 建子文件夹并写 `README.md`；
2. 登记 `notes/README.md` 的方向索引；
3. 再开展研究。

全局断言账本是 `notes/claims.md`。状态机：

```text
open → exploring → heuristic-support → proved-draft → lean-verified → written
```

被反例否决的断言不删除，状态改为 `refuted`，并保留反例指针。

## 4. Lean 严格认证

重要发现和最终证明必须采用 Lean 4（基于 Mathlib）严格认证：

1. 关键代数、分析、测度论或组合引理优先形式化。
2. 最终定理的证明骨架也要形式化；PDE 存在性、能量不等式、文献事实等外部输入以 hypothesis/axiom 显式声明。
3. claims.md 中任何断言只有附上 `lake build` 通过且无 `sorry` 的 Lean 文件链接，才能标记为 `lean-verified`。
4. Lean 代码不允许遗留 `sorry`；临时占位必须在 claims.md 显著标注。
5. 默认 Lake 项目在 `lean/formalization/`，初始不依赖 Mathlib。需要 Mathlib 时，按顶层 `README.md` 的“Mathlib farm 路径”或“标准 Mathlib 路径”二选一。
6. 若本机已有只读 Mathlib farm，优先 symlink 复用，禁止重新 clone 或重新编译 Mathlib。若没有 farm，使用标准 Mathlib 依赖与缓存服务。

## 5. 交互规则

- 日常交流语言：在 `AGENTS.md` 第 1 节填写；未填写时默认中文。
- 证明类回答必须区分：严格论证、启发式直觉、未验证假设、文献事实。
- 在 Codex 桌面端输出 LaTeX 时，公式一律使用块级 `$$...$$`，不要使用单个 `$...$`，也不要把 `$$...$$` 嵌在句中。短符号可用 Unicode 或代码格式。
- 仓库内文件互引一律用相对路径；仓库搬家后全局搜索并清理旧绝对路径。

## 6. LaTeX 记号约定

- 若有基准论文，宏约定与基准论文保持一致。
- 在此处登记项目专属宏；新增宏不得重定义已有宏。
- 公式编号、定理编号、常数依赖约定由项目自行补充。

## 7. 编译与验证

- LaTeX：在 `research/` 中运行项目所需编译器；交叉引用需编译两遍。
- Lean：在 `lean/formalization/` 中运行 `lake build`。
- 任何 tex 修改必须编译通过后才能提交；Lean 修改必须 `lake build` 通过后才能提交。
- 编译失败或搁置的 Lean 文件必须从根模块摘除，并在 claims.md 对应断言的证据栏标注搁置状态。

## 8. 工作纪律

1. 小步任务：每次会话聚焦一个窄目标（一个引理、一步估计、一个形式化验证）。
2. claims.md 状态机：`open → exploring → heuristic-support → proved-draft → lean-verified → written`。
3. 修改 `research/` 下任何 tex 前，先保存当前状态（若使用 Git，则先 commit）。
4. 证明探索与论文写作分开会话进行。
5. 结论类产出当天登记进对应方向的 `findings-YYYYMMDD.md`，并同步 claims.md 状态。
6. `git add` 前排除 Finder 副本（` 2.` 后缀文件）、`.DS_Store`、本地二进制与编译产物。
7. 方向 README 的状态/下一步变更时，同一提交内同步 `notes/README.md` 方向索引及相关计数。
8. 编译失败/搁置的 Lean 文件：除从根模块摘除并在文档披露外，还必须在 claims.md 对应断言的证据栏挂注搁置状态。
9. 开放问题开工前先做结构化拆解：列出输入、目标、隐含假设、外部事实和候选路线；至少为一条路线写出第一断点或最小可证/可伪命题，并同步登记 claims.md，再进入长推导。
10. 反例路线开工前，先证明目标参数窗非空且与主定理假设相交；若前提为空，将相关断言登记为 `refuted` 或在证据栏注明 premise-vacuous，不得继续构造反例。
11. 多路探索时，失败路线也必须落盘：写明断链位置、参数窗、失败机制与不可继续的理由；不得只保留成功路线。
12. 独立复核必须拆开“严格，模 X”中的每个 X，并按参数窗逐项判定；复核后更新输入清单，禁止在后续转述中让任何 X 消失。
13. 技术路线受阻时，先区分“命题本身不成立”和“当前证法不够强”；检查下游是否只需要更弱、局部或条件化版本，能否改述目标或利用既有结构绕开；若确需原强度，把缺口登记为独立攻击目标。
14. 论文化证明后的 Lean 核验按 tex 节点拆模块：一个定理/引理/命题节点一个文件，上游 PDE 或文献事实显式声明为 axiom/hypothesis；节点全部构建通过不等于整体断言 `lean-verified`，claims.md 必须如实反映剩余公理。
15. 方向闭环时，写一份带时间戳的 handoff playbook，记录成功路线、失败路线、边界、入口文件、复现命令与下一步，并在方向 README 中挂链接。

研究流程方法论（断言账本、独立复核、红队证伪、并行隔离与合并等通用规则）参见项目级 skill `.codex/skills/math-research-workspace/`。冲突时，以本文件为准。

## 9. 并行探索协议（多 agent 独立探索）

同一切入点允许同时派出多个会话独立探索，刻意互不通信、事后合并。通用方法论见 `.codex/skills/math-research-workspace/references/parallel-exploration.md`。

1. **默认硬隔离（独立 clone）**：每个探索会话一个独立单分支 clone，落在 `~/math/<project>-runs/<run-id>/`，分支 `exp/<run-id>`。派发方可用：

   ```bash
   sh .codex/skills/math-research-workspace/scripts/spawn-exploration.sh \
     "$PWD" ~/math/<project>-runs <run-id> \
     <optional-symlink-target:link-path ...> \
     --smoke "<build-command>"
   ```

2. **run-id 派发**：由会话第一条用户消息指定；未指定先问，不得自取。
3. **隔离纪律**：禁止打开其他 run 目录的任何文件；禁止对其他 `exp/*` 分支做任何 git 操作；禁止 `git fetch` / `git pull`；禁止挖旧合并历史。
4. **提交与回传**：产物随时提交到本分支；完成后推送到 `exp/<run-id>`。
5. **合并**：由主仓库上的独立整合会话执行。合并中出现任何文本冲突或结论矛盾，一律停下向用户呈报，等待确认。
6. **软隔离例外**：不怕串味的并行核验任务可用 worktree；输入必须在派发消息中显式给定。

# Math Research Workspace Template

一个可复用的数学研究工作区模板，适合需要 **断言账本、按日落盘、独立复核、红队证伪、多会话隔离探索、Lean 形式化** 的数学项目。

## 包含内容

- `AGENTS.md`：通用研究流程宪法，第 1 节需要按项目填写。
- `.codex/skills/math-research-workspace/`：完整 Codex skill，含 references 与脚本。
- `.codex/skills/paper-fetch/`：论文检索与合法开放版本下载 skill，写入 `lit/papers/` 与 `lit/references.bib`。
- `notes/`：方向索引与全局 claims 账本骨架。
- `lit/`：统一参考文献库骨架。
- `research/`：论文草稿目录骨架。
- `lean/formalization/`：空 Lean 4 Lake 项目；默认不依赖 Mathlib。
- `templates/`：方向 README、findings、claims 行模板。

## 快速开始

1. 复制整个目录到新研究项目根目录：

   ```bash
   cp -R math-research-workspace-template <your-project>
   ```

   如需保留隐藏目录，`cp -R` 已会复制 `.codex/`。若手动挑选文件，必须保留 `.codex/`。

2. 修改 `AGENTS.md` 第 1 节，填写研究对象、基准论文、主定理和编号速查。

3. 在 `notes/` 下创建研究方向。可先复制 `templates/direction-README.md`：

   ```text
   notes/<direction>/README.md
   notes/<direction>/findings-YYYYMMDD.md
   ```

4. 每个新断言登记到 `notes/claims.md`。状态从 `open` 开始，严格按状态机升级，不允许启发式结论被转述成严格结论。

5. 每日结论当天写入对应方向的 `findings-YYYYMMDD.md`，并为每条论断标注严格性标签：

   ```text
   【严格】 / 【草案】 / 【启发】 / 【文献事实】 / 【未验证假设】
   ```

## Paper Fetch 与邮箱配置

模板包含 `paper-fetch` skill，可按标题、DOI 或 arXiv ID 检索论文，下载合法公开版本，并登记 BibTeX 条目。

使用前必须填入你自己的真实联系邮箱。Unpaywall 要求真实邮箱，且会拒绝占位邮箱：

```bash
export PAPER_FETCH_EMAIL="your-own-email@example.com"
```

然后可在项目根目录运行：

```bash
python3 .codex/skills/paper-fetch/scripts/fetch_paper.py \
  --title "Paper title" \
  --dry-run
```

也可以每次显式传入：

```bash
python3 .codex/skills/paper-fetch/scripts/fetch_paper.py \
  --doi 10.1007/s00220-019-03550-0 \
  --email "your-own-email@example.com"
```

注意：

- `your-own-email@example.com` 只是示意；实际使用时替换为你自己的邮箱。
- 模板中没有内置默认邮箱，也不会携带任何个人邮箱。
- 若模板将来放入 Git，不要提交你的个人邮箱；建议在本地 shell 配置 `PAPER_FETCH_EMAIL`。
- 该 skill 只使用 Crossref、Unpaywall、arXiv 等合法公开渠道，不处理绕过付费墙的请求。

## Lean 初始状态

默认项目在 `lean/formalization/`，不依赖 Mathlib，可直接构建：

```bash
cd lean/formalization
. ~/.elan/env
lake build
```

若工具链未安装：

```bash
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
source ~/.elan/env
```

## Mathlib 路径一：已有本机 farm

适合已有预编译 Mathlib farm 的机器，可避免网络下载和重新编译。

```bash
cd lean/formalization
mkdir -p vendor
ln -s /absolute/path/to/lean-farm/vX.Y.Z vendor/mathlib
cp lakefile.farm.toml.example lakefile.toml
. ~/.elan/env
lake build
```

注意：

- `/absolute/path/to/lean-farm/vX.Y.Z` 必须替换成实际 farm 路径。
- 有 farm 时不要运行 `lake exe cache get`。
- 不要把 `vendor/mathlib` 或 `.lake/` 打包分发。

## Mathlib 路径二：没有 farm

没有本机 Mathlib farm 时，使用标准 Mathlib 依赖：

```bash
cd lean/formalization
cp lakefile.mathlib.toml.example lakefile.toml
. ~/.elan/env
lake update
lake exe cache get
lake build
```

说明：

- 该路径需要网络访问 GitHub 与 Lean/Mathlib 缓存服务。
- 首次运行会解析依赖、下载缓存或触发构建，可能耗时较长。
- 若既没有 farm 也没有网络，Mathlib 模式暂不可用；可继续使用默认无 Mathlib 项目，直到环境可用。
- `lake exe cache get` 只适用于标准 Mathlib 路径，不适用于 farm 路径。

## 分发纪律

不要把以下内容随模板分发：

- `.lake/`
- `vendor/mathlib`
- PDF 论文全文
- `*.aux`、`*.log`、`*.synctex.gz` 等编译产物
- 私有研究笔记、未发表证明、个人绝对路径

模板只提供流程与骨架，不包含任何具体研究成果。

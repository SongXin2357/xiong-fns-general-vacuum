N0001 — Zero mean from bounded cutoffs and vanishing flux tails.

Scope: a general Lebesgue-analysis lemma, with no assertion about an FNS forcing. Mathematical status: proved-draft by the argument below; independent review pending. Lean status: NOT_RUN.

Exact statement. Let f,h : ℝ² → ℝ be Lebesgue integrable, with h ≥ 0 almost everywhere. Let χₙ : ℝ² → ℝ be measurable. Suppose B,C ≥ 0, |χₙ| ≤ B almost everywhere for every n ∈ ℕ, and χₙ → 1 almost everywhere. If
\[
 \left|\int_{\mathbb R^2} f(x)\chi_n(x)\,dx\right|
 \le C\sqrt{\int_{\{x:\,|x|\ge n\}}h(x)\,dx}
 \qquad(n\in\mathbb N),
\]
then ∫f = 0. Using almost-everywhere cutoff bounds is an explicit, harmless generalization of the stated pointwise bounds; the original target follows immediately.

Full English proof (TeX).

\begin{proof}
Set
\[
 E_n=\{x\in\mathbb R^2:|x|\ge n\},\qquad
 H_n=\int_{E_n}h(x)\,dx,\qquad
 I_n=\int_{\mathbb R^2}f(x)\chi_n(x)\,dx.
\]
The set $E_n$ is closed and hence measurable. Since $h$ is integrable, $h\mathbf1_{E_n}$ is integrable. Moreover, $h\mathbf1_{E_n}\ge0$ almost everywhere, so $H_n\ge0$.

For each fixed $x\in\mathbb R^2$, there exists $N\in\mathbb N$ with $N>|x|$. Consequently, $h(x)\mathbf1_{E_n}(x)=0$ for all $n\ge N$. Thus $h\mathbf1_{E_n}\to0$ pointwise. The bound
\[
 |h(x)\mathbf1_{E_n}(x)|\le |h(x)|
\]
holds everywhere, and $|h|$ is integrable. Dominated convergence therefore gives
\[
 H_n=\int_{\mathbb R^2}h(x)\mathbf1_{E_n}(x)\,dx\longrightarrow0.
\]

For every $n$, the product $f\chi_n$ is almost everywhere measurable, because $f$ is integrable and $\chi_n$ is measurable. Furthermore,
\[
 |f\chi_n|\le B|f|\qquad\text{almost everywhere}.
\]
The right-hand side is integrable, including when $B=0$, so $f\chi_n$ is integrable. By intersecting the countably many full-measure sets on which these bounds hold with the full-measure set on which $\chi_n\to1$, we obtain a single full-measure set on which all bounds hold and $f\chi_n\to f$. A second application of dominated convergence yields
\[
 I_n\longrightarrow I:=\int_{\mathbb R^2}f(x)\,dx.
\]

Continuity of the real square-root function gives $C\sqrt{H_n}\to0$. The assumed inequality and nonnegativity give
\[
 0\le |I_n|\le C\sqrt{H_n},
\]
so the squeeze theorem implies $|I_n|\to0$. On the other hand, continuity of absolute value and $I_n\to I$ imply $|I_n|\to|I|$. Uniqueness of limits in $\mathbb R$ gives $|I|=0$, and hence $I=0$.
\end{proof}

Exact Lean-compatible statement specification. This definition states the full proposition without asserting or assuming its proof. It is intended for the parent's locked Mathlib environment and has not been compiled here.

```lean
import Mathlib

open Filter MeasureTheory
open scoped Topology

namespace PositiveHardyR02

abbrev Plane := EuclideanSpace ℝ (Fin 2)

-- Statement specification only; no certification is claimed.
def N0001Statement : Prop :=
  ∀ (f h : Plane → ℝ) (χ : ℕ → Plane → ℝ) (B C : ℝ),
    Integrable f volume →
    Integrable h volume →
    (∀ᵐ x ∂volume, 0 ≤ h x) →
    0 ≤ B →
    0 ≤ C →
    (∀ n, Measurable (χ n)) →
    (∀ n, ∀ᵐ x ∂volume, |χ n x| ≤ B) →
    (∀ᵐ x ∂volume,
      Tendsto (fun n : ℕ => χ n x) atTop (nhds (1 : ℝ))) →
    (∀ n : ℕ,
      |∫ x, f x * χ n x ∂volume| ≤
        C * Real.sqrt
          (∫ x in {x : Plane | (n : ℝ) ≤ ‖x‖}, h x ∂volume)) →
    (∫ x, f x ∂volume) = 0

end PositiveHardyR02
```

The use of EuclideanSpace specifies the Euclidean norm on ℝ². In the proof implementation, integrability of each product and each restricted integrand must be established before using its integral. The required analytic steps are dominated convergence for the indicator tails, dominated convergence for the cutoff products, continuity of square root and absolute value, squeeze, and uniqueness of limits. No PDE interface or unproved analytic axiom belongs in this node.

Non-vacuity. Let A=[0,1]×[0,1], D=[2,3]×[0,1], f=𝟙_A−𝟙_D, h=0, χₙ=1, B=1, and C=0. The two rectangles have Lebesgue measure one, so f is a nonzero integrable function with integral zero. All tested integrals and all tail integrals vanish; every hypothesis holds. This is an elementary non-vacuity example, not an FNS application.

Parameter checks. The premises force B≥1: on a common full-measure set, |χₙ|≤B and χₙ→1 imply 1≤B, and Lebesgue measure on ℝ² is nonzero. Thus B<1 makes the premises impossible, without invalidating the theorem. C=0 is admissible and directly forces every Iₙ=0. Nonnegativity of h ensures the tail integrals are nonnegative, so the square root has its intended meaning. No spatial moment, cutoff derivative, compact support, or regularity beyond the stated measurability and integrability is needed.

Source scope. Only the supplied excerpts were inspected. The proof above independently derives the general scalar cutoff-tail implication. It does not certify the complete source theorem, its solution class, or its applicability to the full compressible system.

N0001 的原目标可由两次支配收敛、夹逼及极限唯一性完整推出；每个积分的可积性已分别说明。
Lean 规格明确采用二维欧氏空间及 Lebesgue 测度；尚未编译，也未提供已认证的 Lean 证明。
前提非空，且允许非零 f；B<1 的参数窗为空，C=0 则完全合法。
未推导任何子节点，未声称 FNS 强迫项满足测试不等式或零均值条件。

UNRESOLVED
主控须实际完成 Lean 证明、构建、传递公理检查及完整类型核验。
独立盲重推、红队检查及语义审查尚未执行；节点不能据此解锁子节点。
所给文献材料仅为页码摘录，未完成原文完整定理位置及全部适用假设核验。
import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.MeasureTheory.Measure.SeparableMeasure
import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import Mathlib.Tactic
open MeasureTheory Filter Set Topology
open scoped ENNReal
namespace N0005MissingInterface
abbrev R2 := EuclideanSpace ℝ (Fin 2)
/-- FAILED ATTEMPT, deliberately retained with the unresolved analytic goal.
This is the first compactness obligation in the independent proof of N0005.
No weakly convergent subsequence, reflexivity, or range condition is assumed. -/
theorem lp_ball_weakly_compact (p : ℝ≥0∞) (hp : 1 < p) (hpfin : p < ∞)
    (C : ℝ) :
    letI : Fact (1 ≤ p) := ⟨le_of_lt hp⟩
    IsCompact (closure ((toWeakSpace ℝ (Lp ℝ p (volume : Measure R2))) ''
      Metric.closedBall 0 C)) := by
  letI : Fact (1 ≤ p) := ⟨le_of_lt hp⟩
  apply NormedSpace.isCompact_closure_of_isBounded
  · simpa only [Set.preimage_image_eq _ (toWeakSpace ℝ (Lp ℝ p (volume : Measure R2))).injective]
      using Metric.isBounded_closedBall (x := (0 : Lp ℝ p (volume : Measure R2))) (r := C)
  -- MISSING: Lp reflexivity / the closure-in-range theorem below.
  -- Banach-Alaoglu proves compactness in the weak-star bidual, not that its limit is Lp.
end N0005MissingInterface


import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import FNSTree.N0007

open MeasureTheory Filter
open scoped Topology ContDiff

namespace FNSTree.N0007

/-- A locally integrable temporal residual which vanishes against every
compactly supported smooth time test vanishes at almost every time.
This is the fixed-spatial-test part of the N0007 time-slice passage. -/
theorem temporal_residual_ae_zero
    (F : ℝ → ℝ) (hF : Integrable F volume)
    (hweak : ∀ η : ℝ → ℝ, ContDiff ℝ ∞ η → HasCompactSupport η →
      (∫ t, η t * F t) = 0) :
    ∀ᵐ t ∂(volume : Measure ℝ), F t = 0 := by
  apply ae_eq_zero_of_integral_contDiff_smul_eq_zero hF.locallyIntegrable
  intro η hη hc
  simpa only [smul_eq_mul] using hweak η hη hc

/-- Both momentum components and every member of a countable family of
spatial tests share one exceptional time set. The dense-family extension
to *all* compact spatial tests is a separate still-open N0007 obligation. -/
theorem common_time_ae_for_countable_tests
    {J : Type*} [Countable J]
    (F : Fin 2 → J → ℝ → ℝ)
    (hF : ∀ i j, Integrable (F i j) volume)
    (hweak : ∀ i j (η : ℝ → ℝ), ContDiff ℝ ∞ η →
      HasCompactSupport η → (∫ t, η t * F i j t) = 0) :
    ∀ᵐ t ∂(volume : Measure ℝ), ∀ i j, F i j t = 0 := by
  have hJ (i : Fin 2) :
      ∀ᵐ t ∂(volume : Measure ℝ), ∀ j, F i j t = 0 := by
    exact eventually_countable_forall.mpr
      (fun j => temporal_residual_ae_zero (F i j) (hF i j)
        (hweak i j))
  exact eventually_all.mpr hJ

end FNSTree.N0007

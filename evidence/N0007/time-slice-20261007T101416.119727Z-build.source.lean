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

/-- Time-slice version on a finite open lifespan. Only time tests supported
inside (0,T) are required, exactly as in the original distributional PDE. -/
theorem temporal_residual_ae_zero_on_interval
    (T : ℝ) (F : ℝ → ℝ)
    (hF : IntegrableOn F (Set.Ioo 0 T) volume)
    (hweak : ∀ η : ℝ → ℝ, ContDiff ℝ ∞ η → HasCompactSupport η →
      tsupport η ⊆ Set.Ioo 0 T → (∫ t, η t * F t) = 0) :
    ∀ᵐ t ∂(volume : Measure ℝ), t ∈ Set.Ioo 0 T → F t = 0 := by
  apply IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero
    (U := Set.Ioo 0 T) isOpen_Ioo hF.locallyIntegrableOn
  intro η hη hc hs
  simpa only [smul_eq_mul] using hweak η hη hc hs

/-- One full-measure time set works for two components and any countable
spatial test family on the original interval (0,T). -/
theorem common_time_ae_for_countable_tests_on_interval
    {J : Type*} [Countable J] (T : ℝ)
    (F : Fin 2 → J → ℝ → ℝ)
    (hF : ∀ i j, IntegrableOn (F i j) (Set.Ioo 0 T) volume)
    (hweak : ∀ i j (η : ℝ → ℝ), ContDiff ℝ ∞ η →
      HasCompactSupport η → tsupport η ⊆ Set.Ioo 0 T →
      (∫ t, η t * F i j t) = 0) :
    ∀ᵐ t ∂(volume : Measure ℝ), t ∈ Set.Ioo 0 T →
      ∀ i j, F i j t = 0 := by
  have hJ (i : Fin 2) :
      ∀ᵐ t ∂(volume : Measure ℝ),
        ∀ j, t ∈ Set.Ioo 0 T → F i j t = 0 := by
    exact eventually_countable_forall.mpr
      (fun j => temporal_residual_ae_zero_on_interval T (F i j)
        (hF i j) (hweak i j))
  have hIJ : ∀ᵐ t ∂(volume : Measure ℝ),
      ∀ i j, t ∈ Set.Ioo 0 T → F i j t = 0 :=
    eventually_all.mpr hJ
  filter_upwards [hIJ] with t ht hti i j
  exact ht i j hti
end FNSTree.N0007


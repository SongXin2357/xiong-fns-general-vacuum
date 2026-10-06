import Mathlib

/-!
N0001: a general Lebesgue-analysis lemma on the Euclidean plane.
No assertion here supplies these hypotheses for a Navier--Stokes solution.
-/

open MeasureTheory Filter Set
open scoped Topology

namespace FNSTree.N0001

abbrev Plane := EuclideanSpace ℝ (Fin 2)

def tailSet (n : ℕ) : Set Plane := {x | (n : ℝ) ≤ ‖x‖}

lemma measurableSet_tailSet (n : ℕ) : MeasurableSet (tailSet n) :=
  measurableSet_le measurable_const continuous_norm.measurable

lemma tail_integrable {h : Plane → ℝ} (hh : Integrable h volume) (n : ℕ) :
    IntegrableOn h (tailSet n) volume := hh.integrableOn

lemma tail_nonneg {h : Plane → ℝ} (hh : ∀ᵐ x ∂volume, 0 ≤ h x) (n : ℕ) :
    0 ≤ ∫ x in tailSet n, h x :=
  setIntegral_nonneg_of_ae hh

lemma tail_integral_tendsto_zero {h : Plane → ℝ} (hh : Integrable h volume) :
    Tendsto (fun n : ℕ => ∫ x in tailSet n, h x) atTop (𝓝 0) := by
  have hlim : ∀ x : Plane,
      Tendsto (fun n : ℕ => (tailSet n).indicator h x) atTop (𝓝 0) := by
    intro x
    obtain ⟨N, hN⟩ := exists_nat_gt ‖x‖
    apply tendsto_const_nhds.congr'
    filter_upwards [eventually_ge_atTop N] with n hn
    have hlarge : ‖x‖ < (n : ℝ) :=
      lt_of_lt_of_le hN (by exact_mod_cast hn)
    simp [tailSet, not_le.mpr hlarge]
  have ht := tendsto_integral_of_dominated_convergence
    (fun x => ‖h x‖)
    (fun n => hh.aestronglyMeasurable.indicator (measurableSet_tailSet n))
    hh.norm
    (fun n => Filter.Eventually.of_forall (fun x => by
      by_cases hx : x ∈ tailSet n
      · simp [Set.indicator_of_mem hx]
      · simp [Set.indicator_of_notMem hx]))
    (Filter.Eventually.of_forall hlim)
  simpa only [integral_indicator (measurableSet_tailSet _), integral_zero] using ht

lemma tested_integrable {f : Plane → ℝ} {chi : ℕ → Plane → ℝ} {B : ℝ}
    (hf : Integrable f volume) (hchi : ∀ n, Measurable (chi n))
    (hbound : ∀ n x, |chi n x| ≤ B) (n : ℕ) :
    Integrable (fun x => f x * chi n x) volume := by
  apply (hf.norm.mul_const B).mono'
    (hf.aestronglyMeasurable.mul (hchi n).aestronglyMeasurable)
  exact Filter.Eventually.of_forall (fun x => by
    simpa only [norm_mul, Real.norm_eq_abs] using
      mul_le_mul_of_nonneg_left (hbound n x) (abs_nonneg (f x)))

lemma tested_integral_tendsto {f : Plane → ℝ} {chi : ℕ → Plane → ℝ} {B : ℝ}
    (hf : Integrable f volume) (hchi : ∀ n, Measurable (chi n))
    (hbound : ∀ n x, |chi n x| ≤ B)
    (hlim : ∀ᵐ x ∂volume, Tendsto (fun n => chi n x) atTop (𝓝 1)) :
    Tendsto (fun n => ∫ x, f x * chi n x) atTop (𝓝 (∫ x, f x)) := by
  apply tendsto_integral_of_dominated_convergence (fun x => ‖f x‖ * B)
    (fun n => (tested_integrable hf hchi hbound n).aestronglyMeasurable)
    (hf.norm.mul_const B)
  · intro n
    exact Filter.Eventually.of_forall (fun x => by
      simpa only [norm_mul, Real.norm_eq_abs] using
        mul_le_mul_of_nonneg_left (hbound n x) (abs_nonneg (f x)))
  · filter_upwards [hlim] with x hx
    simpa only [mul_one] using tendsto_const_nhds.mul hx

/-- The exact registered general analysis implication, with all integrals explicit.
The two sign hypotheses retain the intended nonnegative flux-tail interpretation. -/
theorem zero_mean_from_cutoffs_and_flux_tails
    (f h : Plane → ℝ) (chi : ℕ → Plane → ℝ) (B C : ℝ)
    (hf : Integrable f volume) (hh : Integrable h volume)
    (hh_nonneg : ∀ᵐ x ∂volume, 0 ≤ h x)
    (hchi : ∀ n, Measurable (chi n)) (hB : 0 ≤ B)
    (hbound : ∀ n x, |chi n x| ≤ B)
    (hlim : ∀ᵐ x ∂volume, Tendsto (fun n => chi n x) atTop (𝓝 1))
    (hC : 0 ≤ C)
    (hflux : ∀ n : ℕ, |∫ x, f x * chi n x| ≤
      C * Real.sqrt (∫ x in tailSet n, h x)) :
    ∫ x, f x = 0 := by
  have htested := tested_integral_tendsto hf hchi hbound hlim
  have htail := tail_integral_tendsto_zero hh
  have hrhs : Tendsto (fun n : ℕ => C * Real.sqrt (∫ x in tailSet n, h x))
      atTop (𝓝 0) := by
    simpa using tendsto_const_nhds.mul (Real.continuous_sqrt.continuousAt.tendsto.comp htail)
  have hzero : Tendsto (fun n => |∫ x, f x * chi n x|) atTop (𝓝 0) :=
    squeeze_zero (fun n => abs_nonneg _) hflux hrhs
  exact abs_eq_zero.mp (tendsto_nhds_unique htested.abs hzero)

end FNSTree.N0001
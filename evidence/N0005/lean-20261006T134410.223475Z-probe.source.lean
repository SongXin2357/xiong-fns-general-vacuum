import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import Mathlib.MeasureTheory.Function.LpSpace.ContinuousFunctions
import Mathlib.Topology.MetricSpace.UniformConvergence
import Mathlib.Tactic

/-! Independent auxiliary proofs for N0005. This file does NOT prove N0005.
The missing Lp weak compactness / representation step is not an assumption here. -/
open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal ContDiff
namespace N0005Attempt

section Perturbation
variable {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E]
  [NormedSpace ℝ E] [CompleteSpace E] {μ : Measure α}

/-- The local density error is integrable and obeys its actual Bochner integral bound. -/
theorem density_error_bound {ρ ρ₀ φ : α → ℝ} {u : α → E} {δ : ℝ}
    (hδ : 0 ≤ δ)
    (hm : AEStronglyMeasurable (fun x => ((ρ x - ρ₀ x) * φ x) • u x) μ)
    (hbase : Integrable (fun x => ‖φ x‖ * ‖u x‖) μ)
    (hρ : ∀ᵐ x ∂μ, φ x ≠ 0 → ‖ρ x - ρ₀ x‖ ≤ δ) :
    Integrable (fun x => ((ρ x - ρ₀ x) * φ x) • u x) μ ∧
    ‖∫ x, ((ρ x - ρ₀ x) * φ x) • u x ∂μ‖ ≤
      δ * ∫ x, ‖φ x‖ * ‖u x‖ ∂μ := by
  have hdom : ∀ᵐ x ∂μ, ‖((ρ x - ρ₀ x) * φ x) • u x‖ ≤
      δ * (‖φ x‖ * ‖u x‖) := by
    filter_upwards [hρ] with x hx
    by_cases hφ : φ x = 0
    · simp [hφ]
    · rw [norm_smul, norm_mul, mul_assoc]
      exact mul_le_mul_of_nonneg_right (hx hφ) (mul_nonneg (norm_nonneg _) (norm_nonneg _))
  have hg := hbase.const_mul δ
  constructor
  · exact hg.mono' hm hdom
  · simpa only [integral_const_mul] using norm_integral_le_of_norm_le hg hdom

/-- Genuine Holder integrability for the bound appearing above. -/
theorem test_velocity_product_integrable {p q : ℝ≥0∞} [p.HolderConjugate q]
    {u : α → E} {φ : α → ℝ} (hu : MemLp u p μ) (hφ : MemLp φ q μ) :
    Integrable (fun x => ‖φ x‖ * ‖u x‖) μ := by
  exact memLp_one_iff_integrable.mp (hu.norm.mul hφ.norm)

/-- Holder's bound with real exponents and real integrals; all powers are integrable
because the MemLp hypotheses are explicit. -/
theorem test_velocity_product_bound {p q : ℝ} (hpq : p.HolderConjugate q)
    {u : α → E} {φ : α → ℝ}
    (hu : MemLp u (ENNReal.ofReal p) μ) (hφ : MemLp φ (ENNReal.ofReal q) μ) :
    (∫ x, ‖φ x‖ * ‖u x‖ ∂μ) ≤
      (∫ x, ‖φ x‖ ^ q ∂μ) ^ (1 / q) * (∫ x, ‖u x‖ ^ p ∂μ) ^ (1 / p) := by
  simpa only [norm_norm] using integral_mul_norm_le_Lp_mul_Lq hpq.symm hφ.norm hu.norm

/-- Density perturbations tend to zero when their uniform errors tend to zero and the
Holder product integrals are uniformly bounded. No default nonintegrable integral is used. -/
theorem density_error_tendsto {ι : Type*} {l : Filter ι}
    {ρ : ι → α → ℝ} {ρ₀ φ : α → ℝ} {u : ι → α → E} {δ : ι → ℝ} {C : ℝ}
    (hδ : ∀ i, 0 ≤ δ i) (hδlim : Tendsto δ l (𝓝 0))
    (hm : ∀ i, AEStronglyMeasurable (fun x => ((ρ i x - ρ₀ x) * φ x) • u i x) μ)
    (hbase : ∀ i, Integrable (fun x => ‖φ x‖ * ‖u i x‖) μ)
    (hbound : ∀ i, (∫ x, ‖φ x‖ * ‖u i x‖ ∂μ) ≤ C)
    (hρ : ∀ i, ∀ᵐ x ∂μ, φ x ≠ 0 → ‖ρ i x - ρ₀ x‖ ≤ δ i) :
    Tendsto (fun i => ∫ x, ((ρ i x - ρ₀ x) * φ x) • u i x ∂μ) l (𝓝 0) := by
  apply squeeze_zero_norm (fun i => ?_) (by simpa using hδlim.mul_const C)
  exact (density_error_bound (hδ i) (hm i) (hbase i) (hρ i)).2.trans
    (mul_le_mul_of_nonneg_left (hbound i) (hδ i))
/-- Uniform convergence of the density on the test support gives convergence of the
actual error integral, with no weak-limit or Lp-representation assumption. -/
theorem density_uniform_error_tendsto {ι : Type*} {l : Filter ι}
    {ρ : ι → α → ℝ} {ρ₀ φ : α → ℝ} {u : ι → α → E} {C : ℝ}
    (hC : 0 ≤ C)
    (hconv : TendstoUniformlyOn ρ ρ₀ l (Function.support φ))
    (hm : ∀ i, AEStronglyMeasurable (fun x => ((ρ i x - ρ₀ x) * φ x) • u i x) μ)
    (hbase : ∀ i, Integrable (fun x => ‖φ x‖ * ‖u i x‖) μ)
    (hbound : ∀ i, (∫ x, ‖φ x‖ * ‖u i x‖ ∂μ) ≤ C) :
    Tendsto (fun i => ∫ x, ((ρ i x - ρ₀ x) * φ x) • u i x ∂μ) l (𝓝 0) := by
  apply Metric.tendsto_nhds.mpr
  intro ε hε
  have hden : 0 < C + 1 := by linarith
  have hd : 0 < ε / (C + 1) := div_pos hε hden
  filter_upwards [Metric.tendstoUniformlyOn_iff.mp hconv (ε / (C + 1)) hd] with i hi
  have herr := (density_error_bound hd.le (hm i) (hbase i)
    (Filter.Eventually.of_forall (fun x hx => by
      have hb := (hi x hx).le
      simpa only [dist_comm, dist_eq_norm] using hb))).2
  rw [dist_zero_right]
  calc
    _ ≤ ε / (C + 1) * C := herr.trans (mul_le_mul_of_nonneg_left (hbound i) hd.le)
    _ < ε / (C + 1) * (C + 1) := mul_lt_mul_of_pos_left (by linarith) hd
    _ = ε := div_mul_cancel₀ ε (ne_of_gt hden)
end Perturbation

section Identify
abbrev R2 := EuclideanSpace ℝ (Fin 2)
variable {m : ℕ}

/-- Once equality of the actual conservative distributions has been established,
the real-valued finite-dimensional momentum fields coincide almost everywhere. -/
theorem momentum_identification {ρ₀ : R2 → ℝ} {v u₀ : R2 → EuclideanSpace ℝ (Fin m)}
    (hv : LocallyIntegrable (fun x => ρ₀ x • v x) volume)
    (hu₀ : LocallyIntegrable (fun x => ρ₀ x • u₀ x) volume)
    (htest : ∀ φ : R2 → ℝ, ContDiff ℝ ∞ φ → HasCompactSupport φ →
      (∫ x, φ x • (ρ₀ x • v x)) = ∫ x, φ x • (ρ₀ x • u₀ x)) :
    ∀ᵐ x, ρ₀ x • v x = ρ₀ x • u₀ x :=
  ae_eq_of_integral_contDiff_smul_eq hv hu₀ htest

/-- Positive density identifies the unweighted representative. This is only the last
step of N0005; it does not supply its existential Lp representative. -/
theorem positive_density_transfer {p : ℝ≥0∞} {ρ₀ : R2 → ℝ}
    {v u₀ : R2 → EuclideanSpace ℝ (Fin m)} (hv : MemLp v p volume)
    (heq : ∀ᵐ x, ρ₀ x • v x = ρ₀ x • u₀ x) (hpos : ∀ᵐ x, 0 < ρ₀ x) :
    MemLp u₀ p volume := by
  apply hv.ae_eq
  filter_upwards [heq, hpos] with x hx hp
  exact (smul_right_injective _ (ne_of_gt hp)) hx
end Identify
end N0005Attempt


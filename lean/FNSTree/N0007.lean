import FNSTree.N0002

open MeasureTheory
open scoped ENNReal ContDiff

namespace FNSTree.N0007

abbrev Plane := FNSTree.N0001.Plane

/-- A genuine source-space auxiliary for the Wang-v1 application:
bounded nonnegative density and weighted L² temperature give L² pressure.
This does NOT formalize the full PDE reduction, time product rule, or N0007 target. -/
theorem pressure_memLp_of_bounded_density
    (ρ θ : Plane → ℝ) (R B : ℝ)
    (hρmeas : Measurable ρ)
    (hρnonneg : ∀ᵐ x ∂(volume : Measure Plane), 0 ≤ ρ x)
    (hρbound : ∀ᵐ x ∂(volume : Measure Plane), ρ x ≤ B)
    (hweighted : MemLp (fun x => Real.sqrt (ρ x) * θ x) 2 volume) :
    MemLp (fun x => R * ρ x * θ x) 2 volume := by
  have hsqrt_meas : AEStronglyMeasurable (fun x : Plane => Real.sqrt (ρ x)) volume :=
    hρmeas.sqrt.aestronglyMeasurable
  have hsqrt_bound : ∀ᵐ x ∂(volume : Measure Plane),
      ‖Real.sqrt (ρ x)‖ ≤ Real.sqrt B := by
    filter_upwards [hρbound] with x hx
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _)]
    exact Real.sqrt_le_sqrt hx
  have hsqrt : MemLp (fun x : Plane => Real.sqrt (ρ x)) ∞ volume :=
    memLp_top_of_bound hsqrt_meas (Real.sqrt B) hsqrt_bound
  have hproduct :
      MemLp (fun x : Plane => Real.sqrt (ρ x) *
        (Real.sqrt (ρ x) * θ x)) 2 volume := by
    exact hweighted.mul' hsqrt
  have htarget : MemLp (fun x : Plane => ρ x * θ x) 2 volume := by
    apply hproduct.ae_eq
    filter_upwards [hρnonneg] with x hx
    rw [← mul_assoc, Real.mul_self_sqrt hx]
  convert htarget.const_mul R using 1 <;> funext x <;> ring

/-- A second genuine source-space auxiliary: finite mass and a weighted L²
time-derivative component imply the corresponding density-weighted source is L¹.
This is still not the full material derivative identity of N0007. -/
theorem weighted_source_integrable
    (ρ v : Plane → ℝ)
    (hρmeas : Measurable ρ)
    (hρnonneg : ∀ᵐ x ∂(volume : Measure Plane), 0 ≤ ρ x)
    (hρint : Integrable ρ volume)
    (hweighted : MemLp (fun x => Real.sqrt (ρ x) * v x) 2 volume) :
    Integrable (fun x => ρ x * v x) volume := by
  have hsqrt_meas : AEStronglyMeasurable (fun x : Plane => Real.sqrt (ρ x)) volume :=
    hρmeas.sqrt.aestronglyMeasurable
  have hsqrt_sq : (fun x : Plane => (Real.sqrt (ρ x)) ^ 2) =ᵐ[volume] ρ := by
    filter_upwards [hρnonneg] with x hx
    exact Real.sq_sqrt hx
  have hsqrt_int : Integrable (fun x : Plane => (Real.sqrt (ρ x)) ^ 2) volume :=
    hρint.congr hsqrt_sq.symm
  have hsqrt : MemLp (fun x : Plane => Real.sqrt (ρ x)) 2 volume :=
    (memLp_two_iff_integrable_sq hsqrt_meas).2 hsqrt_int
  have hproduct :
      MemLp (fun x : Plane => Real.sqrt (ρ x) *
        (Real.sqrt (ρ x) * v x)) 1 volume := by
    exact hweighted.mul' hsqrt
  have htarget : MemLp (fun x : Plane => ρ x * v x) 1 volume := by
    apply hproduct.ae_eq
    filter_upwards [hρnonneg] with x hx
    rw [← mul_assoc, Real.mul_self_sqrt hx]
  exact memLp_one_iff_integrable.mp htarget
/-- A third source-space auxiliary: a weighted L² velocity component, an L²
velocity-gradient component, and bounded density give an L¹ convective product.
The PDE identification of g with an actual velocity derivative remains open. -/
theorem weighted_convection_integrable
    (ρ u g : Plane → ℝ) (B : ℝ)
    (hρmeas : Measurable ρ)
    (hρnonneg : ∀ᵐ x ∂(volume : Measure Plane), 0 ≤ ρ x)
    (hρbound : ∀ᵐ x ∂(volume : Measure Plane), ρ x ≤ B)
    (hweighted_u : MemLp (fun x => Real.sqrt (ρ x) * u x) 2 volume)
    (hg : MemLp g 2 volume) :
    Integrable (fun x => ρ x * u x * g x) volume := by
  have hsqrt_meas : AEStronglyMeasurable (fun x : Plane => Real.sqrt (ρ x)) volume :=
    hρmeas.sqrt.aestronglyMeasurable
  have hsqrt_bound : ∀ᵐ x ∂(volume : Measure Plane),
      ‖Real.sqrt (ρ x)‖ ≤ Real.sqrt B := by
    filter_upwards [hρbound] with x hx
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _)]
    exact Real.sqrt_le_sqrt hx
  have hsqrt : MemLp (fun x : Plane => Real.sqrt (ρ x)) ∞ volume :=
    memLp_top_of_bound hsqrt_meas (Real.sqrt B) hsqrt_bound
  have hweighted_g : MemLp (fun x : Plane => Real.sqrt (ρ x) * g x) 2 volume := by
    exact hg.mul' hsqrt
  have hproduct :
      MemLp (fun x : Plane =>
        (Real.sqrt (ρ x) * u x) * (Real.sqrt (ρ x) * g x)) 1 volume := by
    exact hweighted_g.mul' hweighted_u
  have htarget : MemLp (fun x : Plane => ρ x * u x * g x) 1 volume := by
    apply hproduct.ae_eq
    filter_upwards [hρnonneg] with x hx
    calc
      (Real.sqrt (ρ x) * u x) * (Real.sqrt (ρ x) * g x) =
          (Real.sqrt (ρ x) * Real.sqrt (ρ x)) * u x * g x := by ring
      _ = ρ x * u x * g x := by rw [Real.mul_self_sqrt hx]
  exact memLp_one_iff_integrable.mp htarget

/-- A fixed-time material-source bridge. Its inputs are exactly the three
componentwise weighted and gradient-space facts; this does not assert that a
Wang-v1 solution supplies compatible time derivatives. -/
theorem material_source_integrable
    (ρ u₁ u₂ v g₁ g₂ : Plane → ℝ) (B : ℝ)
    (hρmeas : Measurable ρ)
    (hρnonneg : ∀ᵐ x ∂(volume : Measure Plane), 0 ≤ ρ x)
    (hρbound : ∀ᵐ x ∂(volume : Measure Plane), ρ x ≤ B)
    (hρint : Integrable ρ volume)
    (hv : MemLp (fun x => Real.sqrt (ρ x) * v x) 2 volume)
    (hu₁ : MemLp (fun x => Real.sqrt (ρ x) * u₁ x) 2 volume)
    (hu₂ : MemLp (fun x => Real.sqrt (ρ x) * u₂ x) 2 volume)
    (hg₁ : MemLp g₁ 2 volume)
    (hg₂ : MemLp g₂ 2 volume) :
    Integrable (fun x => ρ x * (v x + u₁ x * g₁ x + u₂ x * g₂ x))
      volume := by
  have htime := weighted_source_integrable ρ v hρmeas hρnonneg hρint hv
  have hconv₁ :=
    weighted_convection_integrable ρ u₁ g₁ B hρmeas hρnonneg hρbound hu₁ hg₁
  have hconv₂ :=
    weighted_convection_integrable ρ u₂ g₂ B hρmeas hρnonneg hρbound hu₂ hg₂
  have hsum := (htime.add hconv₁).add hconv₂
  apply hsum.congr
  exact Filter.Eventually.of_forall (fun x => by dsimp; ring)

/-- Conditional fixed-time application of N0002. The weak stress equation and
L² stress are visible hypotheses; their derivation from the original PDE,
including the common time null set, is still the open full N0007 target. -/
theorem conditional_material_source_zero_mean
    (ρ u₁ u₂ v g₁ g₂ : Plane → ℝ) (B : ℝ) (V : Plane → Plane)
    (hρmeas : Measurable ρ)
    (hρnonneg : ∀ᵐ x ∂(volume : Measure Plane), 0 ≤ ρ x)
    (hρbound : ∀ᵐ x ∂(volume : Measure Plane), ρ x ≤ B)
    (hρint : Integrable ρ volume)
    (hv : MemLp (fun x => Real.sqrt (ρ x) * v x) 2 volume)
    (hu₁ : MemLp (fun x => Real.sqrt (ρ x) * u₁ x) 2 volume)
    (hu₂ : MemLp (fun x => Real.sqrt (ρ x) * u₂ x) 2 volume)
    (hg₁ : MemLp g₁ 2 volume)
    (hg₂ : MemLp g₂ 2 volume)
    (hV : MemLp V 2 volume)
    (hdiv : ∀ φ : Plane → ℝ, ContDiff ℝ ∞ φ → HasCompactSupport φ →
      (∫ x, (ρ x * (v x + u₁ x * g₁ x + u₂ x * g₂ x)) * φ x) =
        -(∫ x, inner ℝ (V x) (gradient φ x))) :
    ∫ x, ρ x * (v x + u₁ x * g₁ x + u₂ x * g₂ x) = 0 := by
  exact N0002.zero_integral_of_distributional_divergence
    (fun x => ρ x * (v x + u₁ x * g₁ x + u₂ x * g₂ x)) V
    (material_source_integrable ρ u₁ u₂ v g₁ g₂ B
      hρmeas hρnonneg hρbound hρint hv hu₁ hu₂ hg₁ hg₂)
    hV hdiv
end FNSTree.N0007
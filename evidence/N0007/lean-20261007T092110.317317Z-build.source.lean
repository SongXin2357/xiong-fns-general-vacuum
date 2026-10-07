import FNSTree.N0002

open MeasureTheory
open scoped ENNReal

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
    simp only [mul_assoc, Real.mul_self_sqrt hx]
  convert htarget.const_mul R using 1 <;> funext x <;> ring

end FNSTree.N0007
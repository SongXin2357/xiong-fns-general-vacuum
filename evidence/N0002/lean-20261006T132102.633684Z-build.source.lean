import Mathlib
import FNSTree.N0001

open MeasureTheory Filter Set
open scoped Topology

noncomputable section
namespace FNSTree.N0002

abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- A genuine smooth radial bump: one on the unit ball, zero outside radius two. -/
def base : ContDiffBump (0 : Plane) where
  rIn := 1
  rOut := 2
  rIn_pos := by norm_num
  rIn_lt_rOut := by norm_num

def cutoff (R : ℝ) (x : Plane) : ℝ := base (R⁻¹ • x)

lemma base_smooth : ContDiff ℝ ∞ (base : Plane → ℝ) := base.contDiff

lemma cutoff_smooth (R : ℝ) : ContDiff ℝ ∞ (cutoff R) :=
  base_smooth.comp (contDiff_const.smul contDiff_id)

lemma cutoff_compact {R : ℝ} (hR : 0 < R) : HasCompactSupport (cutoff R) := by
  exact base.hasCompactSupport.comp_homeomorph
    (Homeomorph.smul (Units.mk0 R⁻¹ (inv_ne_zero hR.ne')))

lemma cutoff_bound (R : ℝ) (x : Plane) : |cutoff R x| ≤ 1 := by
  rw [abs_of_nonneg (base.nonneg)]
  exact base.le_one

lemma cutoff_one {R : ℝ} (hR : 0 < R) {x : Plane} (hx : ‖x‖ ≤ R) :
    cutoff R x = 1 := by
  apply base.one_of_mem_closedBall
  simp only [Metric.mem_closedBall, dist_zero_right, norm_smul, Real.norm_eq_abs,
    abs_of_pos (inv_pos.mpr hR)]
  change R⁻¹ * ‖x‖ ≤ 1
  exact (inv_mul_le_one₀ hR).mpr hx

lemma cutoff_gradient_scale {R : ℝ} (hR : 0 < R) (x : Plane) :
    gradient (cutoff R) x = R⁻¹ • gradient (base : Plane → ℝ) (R⁻¹ • x) := by
  apply (InnerProductSpace.toDual ℝ Plane).injective
  simp only [toDual_gradient, map_smul, RingHom.id_apply]
  have hb := (base_smooth.differentiable (by simp) (R⁻¹ • x)).hasFDerivAt
  have hs := (hasFDerivAt_id x).const_smul R⁻¹
  have hc := (hb.comp x hs).fderiv
  convert hc using 1
  ext y
  simp

lemma base_gradient_continuous : Continuous (gradient (base : Plane → ℝ)) := by
  exact (InnerProductSpace.toDual ℝ Plane).symm.continuous.comp
    (base_smooth.continuous_fderiv (by simp))

lemma base_gradient_compact : HasCompactSupport (gradient (base : Plane → ℝ)) := by
  exact (base.hasCompactSupport.fderiv ℝ).comp_left (map_zero _)

lemma base_energy_integrable :
    Integrable (fun x : Plane => ‖gradient (base : Plane → ℝ) x‖ ^ 2) volume := by
  exact (base_gradient_continuous.norm.pow 2).integrable_of_hasCompactSupport
    (base_gradient_compact.norm.pow (by norm_num))

lemma cutoff_gradient_continuous (R : ℝ) : Continuous (gradient (cutoff R)) := by
  exact (InnerProductSpace.toDual ℝ Plane).symm.continuous.comp
    ((cutoff_smooth R).continuous_fderiv (by simp))

lemma cutoff_gradient_compact {R : ℝ} (hR : 0 < R) :
    HasCompactSupport (gradient (cutoff R)) := by
  exact ((cutoff_compact hR).fderiv ℝ).comp_left (map_zero _)

lemma cutoff_energy_integrable {R : ℝ} (hR : 0 < R) :
    Integrable (fun x : Plane => ‖gradient (cutoff R) x‖ ^ 2) volume := by
  exact ((cutoff_gradient_continuous R).norm.pow 2).integrable_of_hasCompactSupport
    ((cutoff_gradient_compact hR).norm.pow (by norm_num))

/-- The exact scale-invariant Dirichlet energy identity in dimension two. -/
lemma cutoff_energy {R : ℝ} (hR : 0 < R) :
    (∫ x : Plane, ‖gradient (cutoff R) x‖ ^ 2) =
      ∫ x : Plane, ‖gradient (base : Plane → ℝ) x‖ ^ 2 := by
  simp_rw [cutoff_gradient_scale hR, norm_smul, Real.norm_eq_abs,
    abs_of_pos (inv_pos.mpr hR), mul_pow]
  rw [integral_const_mul, Measure.integral_comp_inv_smul_of_nonneg volume _ hR.le]
  have hd : Module.finrank ℝ Plane = 2 := by simp [Plane]
  rw [hd, smul_eq_mul]
  field_simp

lemma cutoff_gradient_zero_inner {R : ℝ} (hR : 0 < R) {x : Plane}
    (hx : ‖x‖ < R) : gradient (cutoff R) x = 0 := by
  have he : cutoff R =ᶠ[𝓝 x] fun _ => (1 : ℝ) := by
    have hn : ∀ᶠ y in 𝓝 x, ‖y‖ < R :=
      (isOpen_lt continuous_norm continuous_const).mem_nhds hx
    filter_upwards [hn] with y hy
    exact cutoff_one hR hy.le
  rw [he.gradient_eq, gradient_fun_const]

lemma cutoff_tendsto_one (x : Plane) :
    Tendsto (fun n : ℕ => cutoff (n + 1) x) atTop (𝓝 1) := by
  obtain ⟨N, hN⟩ := exists_nat_gt ‖x‖
  apply tendsto_const_nhds.congr'
  filter_upwards [eventually_ge_atTop N] with n hn
  have hn' : (N : ℝ) ≤ n := by exact_mod_cast hn
  exact (cutoff_one (by positivity : 0 < (n : ℝ) + 1) (by linarith)).symm

end FNSTree.N0002
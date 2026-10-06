import Mathlib
import FNSTree.N0001

open MeasureTheory Filter Set
open scoped Topology ContDiff

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
  base_smooth.comp ((contDiff_id : ContDiff ℝ ∞ (fun x : Plane => x)).const_smul R⁻¹)

lemma cutoff_compact {R : ℝ} (hR : 0 < R) : HasCompactSupport (cutoff R) := by
  exact base.hasCompactSupport.comp_homeomorph
    (Homeomorph.smul (Units.mk0 R⁻¹ (inv_ne_zero hR.ne')))

lemma cutoff_bound (R : ℝ) (x : Plane) : |cutoff R x| ≤ 1 := by
  change |base (R⁻¹ • x)| ≤ 1
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
  have hs := (hasFDerivAt_id (𝕜 := ℝ) x).const_smul R⁻¹
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
    (base_gradient_compact.comp_left (g := fun v : Plane => ‖v‖ ^ 2) (by simp))

lemma cutoff_gradient_continuous (R : ℝ) : Continuous (gradient (cutoff R)) := by
  exact (InnerProductSpace.toDual ℝ Plane).symm.continuous.comp
    ((cutoff_smooth R).continuous_fderiv (by simp))

lemma cutoff_gradient_compact {R : ℝ} (hR : 0 < R) :
    HasCompactSupport (gradient (cutoff R)) := by
  exact ((cutoff_compact hR).fderiv ℝ).comp_left (map_zero _)

lemma cutoff_energy_integrable {R : ℝ} (hR : 0 < R) :
    Integrable (fun x : Plane => ‖gradient (cutoff R) x‖ ^ 2) volume := by
  exact ((cutoff_gradient_continuous R).norm.pow 2).integrable_of_hasCompactSupport
    ((cutoff_gradient_compact hR).comp_left (g := fun v : Plane => ‖v‖ ^ 2) (by simp))

/-- The exact scale-invariant Dirichlet energy identity in dimension two. -/
lemma cutoff_energy {R : ℝ} (hR : 0 < R) :
    (∫ x : Plane, ‖gradient (cutoff R) x‖ ^ 2) =
      ∫ x : Plane, ‖gradient (base : Plane → ℝ) x‖ ^ 2 := by
  simp_rw [cutoff_gradient_scale hR, norm_smul, Real.norm_eq_abs,
    abs_of_pos (inv_pos.mpr hR), mul_pow]
  rw [integral_const_mul, Measure.integral_comp_inv_smul_of_nonneg volume (fun x : Plane => ‖gradient (base : Plane → ℝ) x‖ ^ 2) hR.le]
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

lemma cutoff_zero {R : ℝ} (hR : 0 < R) {x : Plane} (hx : 2 * R ≤ ‖x‖) :
    cutoff R x = 0 := by
  apply base.zero_of_le_dist
  simp only [dist_zero_right, norm_smul, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr hR)]
  change 2 ≤ R⁻¹ * ‖x‖
  exact (le_inv_mul_iff₀ hR).mpr hx

lemma cutoff_gradient_zero_outer {R : ℝ} (hR : 0 < R) {x : Plane}
    (hx : 2 * R < ‖x‖) : gradient (cutoff R) x = 0 := by
  have he : cutoff R =ᶠ[𝓝 x] fun _ => (0 : ℝ) := by
    have hn : ∀ᶠ y in 𝓝 x, 2 * R < ‖y‖ :=
      (isOpen_lt continuous_const continuous_norm).mem_nhds hx
    filter_upwards [hn] with y hy
    exact cutoff_zero hR hy.le
  rw [he.gradient_eq, gradient_fun_const]

lemma cutoff_gradient_support {R : ℝ} (hR : 0 < R) :
    Function.support (gradient (cutoff R)) ⊆ {x | R ≤ ‖x‖ ∧ ‖x‖ ≤ 2 * R} := by
  intro x hx
  constructor
  · by_contra h
    exact hx (cutoff_gradient_zero_inner hR (lt_of_not_ge h))
  · by_contra h
    exact hx (cutoff_gradient_zero_outer hR (lt_of_not_ge h))

lemma cutoff_gradient_memLp {R : ℝ} (hR : 0 < R) :
    MemLp (gradient (cutoff R)) 2 volume :=
  (memLp_two_iff_integrable_sq_norm
    (cutoff_gradient_continuous R).aestronglyMeasurable).2 (cutoff_energy_integrable hR)

/-- Pointwise inner-product integrability is proved before using its Bochner integral. -/
lemma inner_integrable {A B : Plane → Plane} (hA : MemLp A 2 volume)
    (hB : MemLp B 2 volume) : Integrable (fun x => inner ℝ (A x) (B x)) volume := by
  apply (hA.norm.integrable_mul hB.norm).mono'
    (hA.aestronglyMeasurable.inner hB.aestronglyMeasurable)
  exact Filter.Eventually.of_forall fun x => norm_inner_le_norm _ _

lemma inner_l2_bound {A B : Plane → Plane} (hA : MemLp A 2 volume)
    (hB : MemLp B 2 volume) :
    |∫ x, inner ℝ (A x) (B x)| ≤
      Real.sqrt (∫ x, ‖A x‖ ^ 2) * Real.sqrt (∫ x, ‖B x‖ ^ 2) := by
  have hp : (2 : ℝ).HolderConjugate 2 := by norm_num [Real.holderConjugate_iff]
  have hcs := integral_mul_norm_le_Lp_mul_Lq hp (by simpa using hA) (by simpa using hB)
  have hcs' : (∫ x, ‖A x‖ * ‖B x‖) ≤
      Real.sqrt (∫ x, ‖A x‖ ^ 2) * Real.sqrt (∫ x, ‖B x‖ ^ 2) := by
    simpa only [Real.rpow_two, one_div, Real.sqrt_eq_rpow] using hcs
  calc
    |∫ x, inner ℝ (A x) (B x)| ≤ ∫ x, ‖inner ℝ (A x) (B x)‖ := by
      simpa only [Real.norm_eq_abs] using norm_integral_le_integral_norm
        (fun x => inner ℝ (A x) (B x))
    _ ≤ ∫ x, ‖A x‖ * ‖B x‖ :=
      integral_mono (inner_integrable hA hB).norm (hA.norm.integrable_mul hB.norm)
        (fun x => norm_inner_le_norm _ _)
    _ ≤ _ := hcs'

lemma cutoff_flux_bound {V : Plane → Plane} (hV : MemLp V 2 volume) (n : ℕ) :
    |∫ x, inner ℝ (V x) (gradient (cutoff ((n : ℝ) + 1)) x)| ≤
      Real.sqrt (∫ x, ‖gradient (base : Plane → ℝ) x‖ ^ 2) *
        Real.sqrt (∫ x in N0001.tailSet n, ‖V x‖ ^ 2) := by
  have hR : 0 < (n : ℝ) + 1 := by positivity
  have hm := N0001.measurableSet_tailSet n
  have hVn := MemLp.indicator hm hV
  have hG := cutoff_gradient_memLp hR
  have heq : (fun x => inner ℝ (V x) (gradient (cutoff ((n : ℝ) + 1)) x)) =
      fun x => inner ℝ ((N0001.tailSet n).indicator V x)
        (gradient (cutoff ((n : ℝ) + 1)) x) := by
    funext x
    by_cases hx : x ∈ N0001.tailSet n
    · simp [Set.indicator_of_mem hx]
    · have hxn : ‖x‖ < (n : ℝ) := lt_of_not_ge hx
      rw [cutoff_gradient_zero_inner hR (by linarith)]
      simp
  have he : (∫ x : Plane, ‖(N0001.tailSet n).indicator V x‖ ^ 2) =
      ∫ x in N0001.tailSet n, ‖V x‖ ^ 2 := by
    rw [← integral_indicator hm]
    apply integral_congr_ae
    exact Filter.Eventually.of_forall fun x => by
      by_cases hx : x ∈ N0001.tailSet n <;> simp [hx]
  rw [heq]
  simpa only [he, cutoff_energy hR, mul_comm] using inner_l2_bound hVn hG

/-- Exact registered target: zero total integral for an L1 distributional divergence
of an L2 field in the Euclidean plane. The cutoffs and their flux bound are constructed above. -/
theorem zero_integral_of_distributional_divergence
    (f : Plane → ℝ) (V : Plane → Plane)
    (hf : Integrable f volume) (hV : MemLp V 2 volume)
    (hdiv : ∀ φ : Plane → ℝ, ContDiff ℝ ∞ φ → HasCompactSupport φ →
      (∫ x, f x * φ x) = -(∫ x, inner ℝ (V x) (gradient φ x))) :
    ∫ x, f x = 0 := by
  apply N0001.zero_mean_from_cutoffs_and_flux_tails f (fun x => ‖V x‖ ^ 2)
    (fun n => cutoff ((n : ℝ) + 1)) 1
    (Real.sqrt (∫ x, ‖gradient (base : Plane → ℝ) x‖ ^ 2)) hf
  · exact hV.integrable_norm_pow (by norm_num)
  · exact Filter.Eventually.of_forall fun x => sq_nonneg _
  · intro n
    exact (cutoff_smooth _).continuous.measurable
  · norm_num
  · intro n x
    exact cutoff_bound _ _
  · exact Filter.Eventually.of_forall cutoff_tendsto_one
  · exact Real.sqrt_nonneg _
  · intro n
    rw [hdiv _ (cutoff_smooth _) (cutoff_compact (by positivity)), abs_neg]
    exact cutoff_flux_bound hV n

end FNSTree.N0002
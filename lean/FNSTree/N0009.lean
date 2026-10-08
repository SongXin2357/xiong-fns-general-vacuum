import Mathlib

/-!
N0009 formalization in progress. The theorem below is an honest fixed-support
moment estimate on the plane. It does not prove that a Wang-v3 PDE solution has
fixed support, conserves mass, or satisfies the virial identity, and it does
not close the exact N0009 target.
-/

open MeasureTheory

namespace FNSTree.N0009

abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-! Algebraic strict-viscosity bridge for a symmetric planar strain matrix
with diagonal entries `a,d` and off-diagonal entry `b`. Identifying these
scalars with the distributional strain of a Wang-v3 solution remains open. -/
private theorem dissipation_decomposition (μ lam a b d : ℝ) :
    2 * μ * (a ^ 2 + d ^ 2 + 2 * b ^ 2) + lam * (a + d) ^ 2 =
      μ * (a - d) ^ 2 + 4 * μ * b ^ 2 + (μ + lam) * (a + d) ^ 2 := by
  ring

theorem strict_viscosity_dissipation_nonneg
    (μ lam a b d : ℝ) (hμ : 0 < μ) (hbulk : 0 ≤ μ + lam) :
    0 ≤ 2 * μ * (a ^ 2 + d ^ 2 + 2 * b ^ 2) + lam * (a + d) ^ 2 := by
  rw [dissipation_decomposition]
  positivity

theorem strict_viscosity_dissipation_rigidity
    (μ lam a b d : ℝ) (hμ : 0 < μ) (hbulk : 0 < μ + lam)
    (hQ : 2 * μ * (a ^ 2 + d ^ 2 + 2 * b ^ 2) + lam * (a + d) ^ 2 = 0) :
    a = 0 ∧ b = 0 ∧ d = 0 := by
  rw [dissipation_decomposition] at hQ
  have hA : 0 ≤ μ * (a - d) ^ 2 := mul_nonneg hμ.le (sq_nonneg _)
  have hB : 0 ≤ 4 * μ * b ^ 2 := by positivity
  have hD : 0 ≤ (μ + lam) * (a + d) ^ 2 := mul_nonneg hbulk.le (sq_nonneg _)
  have hAzero : μ * (a - d) ^ 2 = 0 := by linarith
  have hBzero : 4 * μ * b ^ 2 = 0 := by linarith
  have hDzero : (μ + lam) * (a + d) ^ 2 = 0 := by linarith
  have hAsq : (a - d) ^ 2 = 0 :=
    (mul_eq_zero.mp hAzero).resolve_left (ne_of_gt hμ)
  have hBsq : b ^ 2 = 0 := by
    have h4μ : 4 * μ ≠ 0 := ne_of_gt (by positivity)
    exact (mul_eq_zero.mp (by nlinarith [hBzero] : (4 * μ) * b ^ 2 = 0)).resolve_left h4μ
  have hDsq : (a + d) ^ 2 = 0 :=
    (mul_eq_zero.mp hDzero).resolve_left (ne_of_gt hbulk)
  have hdiff : a - d = 0 := sq_eq_zero_iff.mp hAsq
  have hbeq : b = 0 := sq_eq_zero_iff.mp hBsq
  have hsum : a + d = 0 := sq_eq_zero_iff.mp hDsq
  constructor
  · linarith
  constructor
  · exact hbeq
  · linarith

theorem fixed_support_moment_integrable
    (ρ : Plane → ℝ) (b : ℝ) (hb : 0 ≤ b)
    (hρint : Integrable ρ volume)
    (hρsupport : ∀ᵐ x ∂volume, ρ x ≠ 0 → ‖x‖ ≤ b) :
    Integrable (fun x : Plane => ρ x * ‖x‖ ^ 2) volume := by
  have hnorm : AEStronglyMeasurable (fun x : Plane => ‖x‖ ^ 2) volume :=
    ((continuous_norm : Continuous (fun x : Plane => ‖x‖)).pow 2).aestronglyMeasurable
  have hmeas : AEStronglyMeasurable (fun x : Plane => ρ x * ‖x‖ ^ 2) volume :=
    hρint.aestronglyMeasurable.mul hnorm
  have hdom : ∀ᵐ x ∂volume,
      ‖ρ x * ‖x‖ ^ 2‖ ≤ |ρ x| * b ^ 2 := by
    filter_upwards [hρsupport] with x hsupp
    by_cases hzero : ρ x = 0
    · simp [hzero]
    · have hsq : ‖x‖ ^ 2 ≤ b ^ 2 := by
        nlinarith [mul_nonneg (sub_nonneg.mpr (hsupp hzero))
          (add_nonneg (norm_nonneg x) hb)]
      calc
        ‖ρ x * ‖x‖ ^ 2‖ = |ρ x| * |‖x‖ ^ 2| := by
          rw [Real.norm_eq_abs, abs_mul]
        _ = |ρ x| * ‖x‖ ^ 2 := by
          have habs : |‖x‖ ^ 2| = ‖x‖ ^ 2 := abs_of_nonneg (sq_nonneg _)
          rw [habs]
        _ ≤ |ρ x| * b ^ 2 := mul_le_mul_of_nonneg_left hsq (abs_nonneg _)
  exact (hρint.abs.mul_const (b ^ 2)).mono' hmeas hdom

theorem fixed_support_moment_bound
    (ρ : Plane → ℝ) (b : ℝ) (hb : 0 ≤ b)
    (hρint : Integrable ρ volume)
    (hρnonneg : ∀ᵐ x ∂volume, 0 ≤ ρ x)
    (hρsupport : ∀ᵐ x ∂volume, ρ x ≠ 0 → ‖x‖ ≤ b) :
    (∫ x : Plane, ρ x * ‖x‖ ^ 2) ≤ (∫ x : Plane, ρ x) * b ^ 2 := by
  have hIint := fixed_support_moment_integrable ρ b hb hρint hρsupport
  have hpoint : ∀ᵐ x ∂volume, ρ x * ‖x‖ ^ 2 ≤ ρ x * b ^ 2 := by
    filter_upwards [hρnonneg, hρsupport] with x hnonneg hsupp
    by_cases hzero : ρ x = 0
    · simp [hzero]
    · have hsq : ‖x‖ ^ 2 ≤ b ^ 2 := by
        nlinarith [mul_nonneg (sub_nonneg.mpr (hsupp hzero))
          (add_nonneg (norm_nonneg x) hb)]
      exact mul_le_mul_of_nonneg_left hsq hnonneg
  calc
    (∫ x : Plane, ρ x * ‖x‖ ^ 2) ≤ ∫ x : Plane, ρ x * b ^ 2 :=
      integral_mono_ae hIint (hρint.mul_const (b ^ 2)) hpoint
    _ = (∫ x : Plane, ρ x) * b ^ 2 := by rw [integral_mul_const]

/-!
This is the last scalar step of the virial contradiction. Its growth hypothesis
must eventually be derived from the source PDE, energy identity, and two time
integrations; none of those analytic bridges is supplied by this theorem.
-/
theorem no_bounded_quadratic_growth
    (I : ℝ → ℝ) (a v c B : ℝ) (hc : 0 < c)
    (hupper : ∀ t : ℝ, 0 ≤ t → I t ≤ B)
    (hlower : ∀ t : ℝ, 0 ≤ t → a + v * t + c * t ^ 2 ≤ I t) :
    False := by
  obtain ⟨n, hn⟩ := exists_nat_gt ((|a| + |v| + |B| + 1) / c + 1)
  let t : ℝ := n
  have htlarge : (|a| + |v| + |B| + 1) / c + 1 < t := by
    exact_mod_cast hn
  have ht : 1 ≤ t := by
    have hnonneg : 0 ≤ (|a| + |v| + |B| + 1) / c :=
      div_nonneg (by positivity) hc.le
    linarith
  have hct : |a| + |v| + |B| + 1 ≤ c * t := by
    have hct' : |a| + |v| + |B| + 1 ≤ t * c :=
      (div_le_iff₀ hc).mp (by linarith)
    simpa [mul_comm] using hct'
  have hquad : (|a| + |v| + |B| + 1) * t ≤ c * t * t :=
    mul_le_mul_of_nonneg_right hct (by linarith)
  have hav : -|a| ≤ a := neg_abs_le a
  have hv : -|v| ≤ v := neg_abs_le v
  have hb : B ≤ |B| := le_abs_self B
  have ha_t : |a| ≤ |a| * t := by
    nlinarith [mul_nonneg (abs_nonneg a) (sub_nonneg.mpr ht)]
  have hb_t : |B| ≤ |B| * t := by
    nlinarith [mul_nonneg (abs_nonneg B) (sub_nonneg.mpr ht)]
  have hv_t : -|v| * t ≤ v * t :=
    mul_le_mul_of_nonneg_right hv (by linarith)
  have hlt : B < a + v * t + c * t ^ 2 := by
    nlinarith
  have hu := hupper t (by linarith)
  have hl := hlower t (by linarith)
  linarith

/-! A one-sided fundamental-theorem-of-calculus comparison, used below
without extending a physical solution to negative time. -/
theorem lower_bound_from_derivative
    (f f' : ℝ → ℝ) (c : ℝ)
    (hf : ∀ s : ℝ, 0 ≤ s → HasDerivAt f (f' s) s)
    (hf' : ∀ s : ℝ, 0 ≤ s → c ≤ f' s)
    (t : ℝ) (ht : 0 ≤ t) :
    f 0 + c * t ≤ f t := by
  let g : ℝ → ℝ := fun s => f s - c * s
  have hgderiv (s : ℝ) (hs : 0 ≤ s) : HasDerivAt g (f' s - c) s := by
    have hlin : HasDerivAt (fun z : ℝ => c * z) c s := by
      simpa using (hasDerivAt_id s).const_mul c
    exact (hf s hs).sub hlin
  have hgcont : ContinuousOn g (Set.Ici (0 : ℝ)) := by
    intro s hs
    exact (hgderiv s hs).continuousAt.continuousWithinAt
  have hgdiff : DifferentiableOn ℝ g (interior (Set.Ici (0 : ℝ))) := by
    intro s hs
    have hs0 : 0 ≤ s := by
      have hspos : 0 < s := by simpa only [interior_Ici, Set.mem_Ioi] using hs
      exact hspos.le
    exact (hgderiv s hs0).differentiableAt.differentiableWithinAt
  have hgmon : MonotoneOn g (Set.Ici (0 : ℝ)) :=
    monotoneOn_of_deriv_nonneg (convex_Ici (0 : ℝ)) hgcont hgdiff (by
      intro s hs
      have hs0 : 0 ≤ s := by
        have hspos : 0 < s := by simpa only [interior_Ici, Set.mem_Ioi] using hs
        exact hspos.le
      rw [(hgderiv s hs0).deriv]
      linarith [hf' s hs0])
  have hcmp : g 0 ≤ g t := hgmon (by simp) (by simpa using ht) ht
  dsimp [g] at hcmp
  norm_num at hcmp ⊢
  linarith

/-! This covers both integrations of the virial estimate on nonnegative time.
The derivative hypotheses must still be justified from Wang-v3 solutions. -/
theorem quadratic_growth_from_virial
    (I J J' : ℝ → ℝ) (c : ℝ)
    (hI : ∀ s : ℝ, 0 ≤ s → HasDerivAt I (2 * J s) s)
    (hJ : ∀ s : ℝ, 0 ≤ s → HasDerivAt J (J' s) s)
    (hJlower : ∀ s : ℝ, 0 ≤ s → c ≤ J' s)
    (t : ℝ) (ht : 0 ≤ t) :
    I 0 + 2 * J 0 * t + c * t ^ 2 ≤ I t := by
  have hJcmp (s : ℝ) (hs : 0 ≤ s) : J 0 + c * s ≤ J s :=
    lower_bound_from_derivative J J' c hJ hJlower s hs
  let F : ℝ → ℝ := fun s => I s - c * s ^ 2
  have hF (s : ℝ) (hs : 0 ≤ s) :
      HasDerivAt F (2 * J s - 2 * c * s) s := by
    have hsq : HasDerivAt (fun z : ℝ => c * z ^ 2) (2 * c * s) s := by
      simpa [mul_comm, mul_left_comm, mul_assoc] using
        (((hasDerivAt_id s).pow 2).const_mul c)
    change HasDerivAt (I - fun z : ℝ => c * z ^ 2) (2 * J s - 2 * c * s) s
    exact (hI s hs).sub hsq
  have hFlow (s : ℝ) (hs : 0 ≤ s) : 2 * J 0 ≤ 2 * J s - 2 * c * s := by
    nlinarith [hJcmp s hs]
  have hFcmp := lower_bound_from_derivative F
    (fun s => 2 * J s - 2 * c * s) (2 * J 0) hF hFlow t ht
  dsimp [F] at hFcmp
  norm_num at hFcmp ⊢
  nlinarith

/-! A bounded fixed-support second moment cannot satisfy the positive-energy
virial derivative inequality for every nonnegative time. The hypotheses here
are derivative/boundedness facts, not the full Wang-v3 PDE class. -/
theorem no_global_virial_profile
    (I J J' : ℝ → ℝ) (c B : ℝ) (hc : 0 < c)
    (hI : ∀ s : ℝ, 0 ≤ s → HasDerivAt I (2 * J s) s)
    (hJ : ∀ s : ℝ, 0 ≤ s → HasDerivAt J (J' s) s)
    (hJlower : ∀ s : ℝ, 0 ≤ s → c ≤ J' s)
    (hupper : ∀ s : ℝ, 0 ≤ s → I s ≤ B) : False := by
  apply no_bounded_quadratic_growth I (I 0) (2 * J 0) c B hc hupper
  intro t ht
  simpa [mul_assoc] using quadratic_growth_from_virial
    I J J' c hI hJ hJlower t ht

/-!
The finite-interval integrated form fits a.e. virial identities without a
two-sided derivative at time zero. The two integral representations, their
integrability, and the a.e. production lower bound are still premises here;
deriving them from the Wang-v3 PDE is the outstanding analytic task.
-/
theorem quadratic_growth_from_integrated_virial
    (I J A : ℝ → ℝ) (c T : ℝ)
    (hJint : ∀ t : ℝ, 0 ≤ t → t < T → IntervalIntegrable A volume 0 t)
    (hIint : ∀ t : ℝ, 0 ≤ t → t < T → IntervalIntegrable J volume 0 t)
    (hJrep : ∀ t : ℝ, 0 ≤ t → t < T →
      J t = J 0 + ∫ s in (0 : ℝ)..t, A s)
    (hIrep : ∀ t : ℝ, 0 ≤ t → t < T →
      I t = I 0 + ∫ s in (0 : ℝ)..t, 2 * J s)
    (hAlower : ∀ t : ℝ, 0 ≤ t → t < T →
      ∀ᵐ s ∂(volume.restrict (Set.Icc (0 : ℝ) t)), c ≤ A s)
    (t : ℝ) (ht : 0 ≤ t) (htT : t < T) :
    I 0 + 2 * J 0 * t + c * t ^ 2 ≤ I t := by
  have hJcmp (s : ℝ) (hs : 0 ≤ s) (hsT : s < T) :
      J 0 + c * s ≤ J s := by
    have hmon := intervalIntegral.integral_mono_ae_restrict hs
      (intervalIntegrable_const) (hJint s hs hsT) (hAlower s hs hsT)
    rw [intervalIntegral.integral_const] at hmon
    rw [hJrep s hs hsT]
    simp only [sub_zero, smul_eq_mul] at hmon
    linarith
  have hlinInt : IntervalIntegrable
      (fun s : ℝ => 2 * J 0 + 2 * c * s) volume 0 t := by
    apply Continuous.intervalIntegrable
    fun_prop
  have hJscaled : IntervalIntegrable
      (fun s : ℝ => 2 * J s) volume 0 t := (hIint t ht htT).const_mul 2
  have hmon := intervalIntegral.integral_mono_on ht hlinInt hJscaled (by
    intro s hs
    have hsT : s < T := lt_of_le_of_lt hs.2 htT
    nlinarith [hJcmp s hs.1 hsT])
  have hlinEval :
      (∫ s in (0 : ℝ)..t, 2 * J 0 + 2 * c * s) =
        2 * J 0 * t + c * t ^ 2 := by
    have hconst : IntervalIntegrable (fun _ : ℝ => 2 * J 0) volume 0 t := by
      apply Continuous.intervalIntegrable
      fun_prop
    have hlinear : IntervalIntegrable (fun s : ℝ => 2 * c * s) volume 0 t := by
      apply Continuous.intervalIntegrable
      fun_prop
    rw [intervalIntegral.integral_add hconst hlinear,
      intervalIntegral.integral_const, intervalIntegral.integral_const_mul,
      integral_id]
    simp only [sub_zero, smul_eq_mul]
    ring
  rw [hIrep t ht htT]
  linarith

theorem no_global_integrated_virial_profile
    (I J A : ℝ → ℝ) (c B : ℝ) (hc : 0 < c)
    (hJint : ∀ t : ℝ, 0 ≤ t → IntervalIntegrable A volume 0 t)
    (hIint : ∀ t : ℝ, 0 ≤ t → IntervalIntegrable J volume 0 t)
    (hJrep : ∀ t : ℝ, 0 ≤ t → J t = J 0 + ∫ s in (0 : ℝ)..t, A s)
    (hIrep : ∀ t : ℝ, 0 ≤ t → I t = I 0 + ∫ s in (0 : ℝ)..t, 2 * J s)
    (hAlower : ∀ t : ℝ, 0 ≤ t →
      ∀ᵐ s ∂(volume.restrict (Set.Icc (0 : ℝ) t)), c ≤ A s)
    (hupper : ∀ t : ℝ, 0 ≤ t → I t ≤ B) : False := by
  apply no_bounded_quadratic_growth I (I 0) (2 * J 0) c B hc hupper
  intro t ht
  have htT : t < t + 1 := by linarith
  simpa [mul_assoc] using quadratic_growth_from_integrated_virial
    I J A c (t + 1)
    (fun s hs _ => hJint s hs)
    (fun s hs _ => hIint s hs)
    (fun s hs _ => hJrep s hs)
    (fun s hs _ => hIrep s hs)
    (fun s hs _ => hAlower s hs)
    t ht htT

#check strict_viscosity_dissipation_nonneg
#print axioms strict_viscosity_dissipation_nonneg
#check strict_viscosity_dissipation_rigidity
#print axioms strict_viscosity_dissipation_rigidity
#check fixed_support_moment_integrable
#print axioms fixed_support_moment_integrable
#check fixed_support_moment_bound
#print axioms fixed_support_moment_bound
#check no_bounded_quadratic_growth
#print axioms no_bounded_quadratic_growth
#check lower_bound_from_derivative
#print axioms lower_bound_from_derivative
#check quadratic_growth_from_virial
#print axioms quadratic_growth_from_virial
#check no_global_virial_profile
#print axioms no_global_virial_profile
#check quadratic_growth_from_integrated_virial
#print axioms quadratic_growth_from_integrated_virial
#check no_global_integrated_virial_profile
#print axioms no_global_integrated_virial_profile

end FNSTree.N0009

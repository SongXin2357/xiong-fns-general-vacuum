import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import Mathlib.Topology.MetricSpace.UniformConvergence
import Mathlib.MeasureTheory.Measure.SeparableMeasure
import Mathlib.Tactic
open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal ContDiff
namespace N0005ExactAttempt
abbrev R2 := EuclideanSpace ℝ (Fin 2)
abbrev Velocity (m : ℕ) := R2 → EuclideanSpace ℝ (Fin m)

/-- Typed exact target. The momentum local-integrability hypotheses unpack the phrase
"conservative distributional trace" and keep the Bochner integral totalization out of the proof.
Finite real p expresses p < infinity. C is a real uniform bound, not a dual representation. -/
def InitialRepresentativeStatement : Prop :=
  ∀ (m : ℕ) (p T C : ℝ) (ρ : ℝ → R2 → ℝ) (ρ₀ : R2 → ℝ)
    (u : ℝ → Velocity m) (u₀ : Velocity m),
    1 < p → 0 < T → 0 ≤ C →
    (∀ t ∈ Ioo 0 T, MemLp (u t) (ENNReal.ofReal p) volume) →
    (∀ t ∈ Ioo 0 T, (eLpNorm (u t) (ENNReal.ofReal p) volume).toReal ≤ C) →
    (∀ K : Set R2, IsCompact K → MemLp ρ₀ ∞ (volume.restrict K)) →
    (∀ K : Set R2, IsCompact K →
      TendstoUniformlyOn ρ ρ₀ (𝓝[Ioo 0 T] (0 : ℝ)) K) →
    (∀ t ∈ Ioo 0 T, LocallyIntegrable (fun x => ρ t x • u t x) volume) →
    LocallyIntegrable (fun x => ρ₀ x • u₀ x) volume →
    (∀ φ : R2 → ℝ, ContDiff ℝ ∞ φ → HasCompactSupport φ →
      Tendsto (fun t => ∫ x, φ x • (ρ t x • u t x)) (𝓝[Ioo 0 T] (0 : ℝ))
        (𝓝 (∫ x, φ x • (ρ₀ x • u₀ x)))) →
    ∃ v : Velocity m, MemLp v (ENNReal.ofReal p) volume ∧
      ∀ᵐ x, ρ₀ x • v x = ρ₀ x • u₀ x

#check InitialRepresentativeStatement
#print InitialRepresentativeStatement
end N0005ExactAttempt

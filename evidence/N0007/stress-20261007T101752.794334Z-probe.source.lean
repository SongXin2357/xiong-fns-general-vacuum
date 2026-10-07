import FNSTree.N0007

open MeasureTheory
open scoped ENNReal

namespace FNSTree.N0007

/-- The stress row built from an L² velocity-gradient row, L² divergence,
and L² pressure belongs to L². For the physical stress take `e` to be
the i-th standard basis vector in the Euclidean plane. This does not
derive these input bounds from the original PDE solution class. -/
theorem stress_row_memLp
    (μ bulk : ℝ) (G : Plane → Plane) (d P : Plane → ℝ) (e : Plane)
    (hG : MemLp G 2 volume) (hd : MemLp d 2 volume)
    (hP : MemLp P 2 volume) :
    MemLp (fun x => μ • G x + (μ + bulk) • (d x • e) - P x • e)
      2 volume := by
  have he : MemLp (fun _ : Plane => e) ∞ volume := memLp_top_const e
  have hde : MemLp (fun x : Plane => d x • e) 2 volume := by
    simpa only using he.smul hd
  have hPe : MemLp (fun x : Plane => P x • e) 2 volume := by
    simpa only using he.smul hP
  have hstress := ((hG.const_smul μ).add (hde.const_smul (μ + bulk))).sub hPe
  convert hstress using 1 <;> funext x <;> rfl

end FNSTree.N0007


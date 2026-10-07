import FNSTree.N0007

open MeasureTheory
open scoped ENNReal

namespace FNSTree.N0007

/-- A physical stress row is in L² when its velocity-gradient row,
velocity divergence, and pressure are in L². Function addition and scalar
multiplication are pointwise; take `e` as the i-th plane basis vector.
The original PDE must still supply the input L² facts. -/
theorem stress_row_memLp
    (μ bulk : ℝ) (G : Plane → Plane) (d P : Plane → ℝ) (e : Plane)
    (hG : MemLp G 2 volume) (hd : MemLp d 2 volume)
    (hP : MemLp P 2 volume) :
    MemLp ((μ • G + (μ + bulk) • (d • (fun _ : Plane => e))) -
      (P • (fun _ : Plane => e))) 2 volume := by
  have he : MemLp (fun _ : Plane => e) ∞ volume := memLp_top_const e
  exact ((hG.const_smul μ).add ((he.smul hd).const_smul (μ + bulk))).sub
    (he.smul hP)

end FNSTree.N0007

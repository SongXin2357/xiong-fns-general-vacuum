import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import Mathlib.MeasureTheory.Function.LpSpace.ContinuousFunctions
open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal ContDiff
#check NormedSpace.isCompact_closure_of_isBounded
#check NormedSpace.inclusionInDoubleDualWeak
#check WeakDual.isSeqCompact_closedBall
#check ContinuousLinearMap.lpPairing
#check ContinuousLinearMap.lpPairing_eq_integral
#check ae_eq_of_integral_contDiff_smul_eq
#check MeasureTheory.MemLp.mul
#check MeasureTheory.MemLp.integrable
#check MeasureTheory.MemLp.locallyIntegrable
#check MeasureTheory.memLp_one_iff_integrable
#check MeasureTheory.integral_mul_norm_le_Lp_mul_Lq
#check MeasureTheory.norm_integral_le_of_norm_le
#check MeasureTheory.integral_mono_ae
#check Real.HolderConjugate
#check ENNReal.HolderConjugate
#check ContinuousLinearMap.integrable_mul
#check TendstoUniformlyOn
#check TendstoLocallyUniformlyOn
#check NormedSpace.Dual
#check Module.IsReflexive

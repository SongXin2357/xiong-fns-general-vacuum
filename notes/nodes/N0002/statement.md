# N0002 — Zero integral of an integrable distributional divergence in the plane

Preregistered 2026-10-06. Status exploring; Lean not run. Parent N0001.

Exact target: Let f : R^2 -> R be Lebesgue integrable, and let V : R^2 -> R^2 be measurable with integral |V|^2 finite (MemLp V 2 volume). Suppose for every real smooth compactly supported test function phi on R^2, integral f phi = - integral <V, grad phi>. Then integral f = 0.

All integrals use Euclidean R^2 and Lebesgue measure. Construct the cutoff tests and prove their scale-invariant L2 gradient control, supported in expanding annuli, inside the proof. Do not assume the tail estimate or the desired conclusion as a substitute for distributional divergence. The node may reuse verified N0001. The root import and evidence for N0001 must not be overwritten.

Intended application, not yet certified: each row of the FNS stress V_i = mu grad u_i + (mu+lambda)(div u)e_i - P e_i, f_i = rho material_derivative(u_i). Source-space matching is an additional proof obligation, not part of this generic lemma's certification. No zero-total-momentum assumption is permitted.

# N0002 — independent reconstruction, 2026-10-06

This note was reconstructed from the registered statement and the public N0001 interface. No candidate proof, private run, old manuscript, or other node proof was consulted. The theorem below is a general analysis statement, not an assertion that the FNS stress meets its hypotheses.

## Exact theorem

Let f ∈ L¹(R²; R), V ∈ L²(R²; R²), and suppose

  ∫ f φ = − ∫ ⟨V, ∇φ⟩

for every φ ∈ C_c^∞(R²; R), with Lebesgue measure and the Euclidean inner product. Then ∫ f = 0.

## Genuine cutoff construction

Set a(t) = exp(−1/t) for t > 0 and a(t) = 0 for t ≤ 0. This is smooth on R; every derivative at zero is zero. Define

  η(x) = a(4 − |x|²) / [a(4 − |x|²) + a(|x|² − 1)].

At every x the denominator is positive: its two arguments cannot both be nonpositive. Thus η is smooth. Moreover 0 ≤ η ≤ 1, η = 1 on |x| ≤ 1, and η = 0 on |x| ≥ 2. Its gradient vanishes on the open unit ball and outside the closed radius-two ball. Continuity also makes the gradient zero on the two boundary circles. Hence η and its gradient have compact support, and

  K = ∫ |∇η|² < ∞.

Equivalently, Mathlib's `ContDiffBump (0 : EuclideanSpace R (Fin 2))` with inner radius 1 and outer radius 2 supplies a genuine smooth bump with exactly these support/value properties; the Lean construction uses this library bump, not a postulated cutoff certificate.

For R > 0 define χ_R(x) = η(R⁻¹ x). Then χ_R is smooth with compact support in the closed radius-2R ball, 0 ≤ χ_R ≤ 1, χ_R = 1 on |x| ≤ R, and

  ∇χ_R(x) = R⁻¹ ∇η(R⁻¹ x).

In particular the gradient is supported in R ≤ |x| ≤ 2R. The substitution x = Ry has Jacobian R², so the actual two-dimensional energy calculation gives

  ∫ |∇χ_R(x)|² dx
  = R⁻² ∫ |∇η(R⁻¹x)|² dx
  = R⁻² R² ∫ |∇η(y)|² dy
  = K.

This is the critical place where dimension two is used. All integrals here are justified by continuity and compact support before applying the change of variables; zero by convention for a nonintegrable integral is never used.

## Flux and limit

Take R = n + 1 and write χ_n = χ_(n+1). The distributional hypothesis applies to this actual test function. The product fχ_n is integrable because |χ_n| ≤ 1. The flux is integrable by Cauchy–Schwarz since V ∈ L² and ∇χ_n ∈ L². Its annular support gives

  |∫ fχ_n|
  = |∫ ⟨V, ∇χ_n⟩|
  ≤ ∫_(|x|≥n) |V| |∇χ_n|
  ≤ (∫_(|x|≥n) |V|²)^(1/2) (∫ |∇χ_n|²)^(1/2)
  = sqrt(K) (∫_(|x|≥n) |V|²)^(1/2).

No tail estimate was assumed: it was derived from the distributional equation, the constructed cutoff, and Cauchy–Schwarz. Since h = |V|² is nonnegative and integrable, its tails tend to zero by dominated convergence. For every fixed x, χ_n(x) = 1 for all sufficiently large n. Dominated convergence with bound |f| therefore gives ∫ fχ_n → ∫ f. The displayed flux bound gives ∫ fχ_n → 0. Uniqueness of the limit proves ∫ f = 0. These final two convergence steps are exactly the public N0001 theorem, with B = 1, C = sqrt(K), and h = |V|².

## Assumption and boundary audit

* No zero momentum, finite second moment, positive lower density bound, or smallness is used.
* No boundary integration by parts is performed; the only weak identity is the assumed distributional divergence identity.
* The distributional sign is irrelevant after taking absolute values, but is retained exactly.
* A measurable representative of V suffices, and all estimates are invariant under almost-everywhere changes.
* The field need not be in L¹. Attempting to test directly with the constant function one would be invalid; χ_n are genuine compactly supported tests.
* The Cauchy–Schwarz constant is the finite number sqrt(K), independent of n.
* Nonvacuity: f = 0, V = 0 satisfy every hypothesis; there are also nonzero smooth compactly supported V with f = div V.

## Certification boundary

The mathematical proof above is complete. Its Lean status is determined only by the actual N0002 build/evidence, not by this note. A successful cutoff submodule alone does not certify the registered distributional-divergence theorem. No publication or descendant is authorized until the exact theorem, dependency coverage, axiom audit, and independent semantic review pass.
# N0007 — Momentum-source cancellation in the original Wang-v1 strong-solution class

Preregistered 2026-10-07. Parent: N0002. Explicit additional node dependencies: none. Status: exploring; exact-target Lean build NOT_RUN; no certificate; no descendants.

## Exact target

Let the physical parameters satisfy Wang's displayed conditions `μ > 0`, `μ + λ ≥ 0`, `R,c_v,κ > 0`, and let `a > 1`, `q > 2`, with `α = min(a/2,1)`. Let `(ρ,u,θ)` be a local strong solution of the **original conservative system (1.1)** on `R² × (0,T*)`, with the original initial-data conditions (1.6)–(1.7), the strong-solution meaning of Definition 1.1, and exactly the regularity class (1.8)–(1.9) in the user-provided Wang-v1 PDF. No extra smallness, positive density lower bound, zero total momentum, additional moment, compact-support exclusion, or improved far-field condition is assumed.

For every finite `T < T*`, prove that there is one null set `E ⊂ (0,T)` such that, for each `t ∈ (0,T) \ E` and each component `i ∈ {1,2}`, the fields
```text
P = R ρ θ,
d = div u,
f_i = ρ (∂_t u_i + u · ∇u_i),
(V_i)_j = μ ∂_j u_i + (μ+λ) d δ_ij − P δ_ij
```
satisfy, as spatial functions on `R²` at time `t`:

1. `f_i ∈ L¹(R²)` and `V_i ∈ L²(R²;R²)`;
2. for **every** smooth compactly supported real test function `φ`,
   `∫ f_i φ dx = −∫ V_i · ∇φ dx`;
3. hence, by the exact certified N0002 theorem, `∫ f_i dx = 0`.

The common exceptional set must be independent of `i` and `φ`. This conclusion is a spatial mean cancellation for almost every time, not a zero-total-momentum assumption and not a global-existence or uniform-continuation estimate.

## Source-fidelity boundary

The checked source is the user-provided 34-page PDF, SHA-256 `a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d`, arXiv:2212.13343v1. PDF p.1 (1.1) states the conservative momentum and continuity equations; p.3 Definition 1.1 and (1.8)–(1.9) state the strong-solution class; pp.19–20 (4.16) and its argument claim a stronger all-time cancellation inside an approximation estimate. That approximate-system passage is source context, **not** a proof of this target for the original final solution. The present almost-everywhere-time claim is weaker in its time quantifier and still needs an independent passage from the original equation and its actual function spaces.

Planned proof obligations: obtain bounded density from `W^{1,q}(R²)` with `q>2`; derive `P∈L²` from `√ρ θ∈L²`; derive `f_i∈L¹` from `ρ∈L¹∩L∞`, `√ρ u_t,√ρ u,∇u∈L²`; justify the conservative-to-material derivative product rule and the spatial weak stress identity on one common full-measure set; apply N0002. Each obligation must be proved rather than imported as an extra hypothesis in the final target.
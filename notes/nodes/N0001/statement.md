# N0001 — Zero mean from bounded cutoffs and vanishing flux tails

Status: exploring; Lean NOT_RUN. Parent: ROOT (administrative).
This is a general Lebesgue-analysis lemma. It does NOT assert that the FNS forcing meets its hypotheses.

Exact target: Let f and h be real-valued Lebesgue integrable functions on R², with h >= 0 almost everywhere. Let chi_n be measurable real functions, uniformly bounded in absolute value by B >= 0, and chi_n -> 1 almost everywhere. Let C >= 0. Assume for every natural n:
  |integral f(x)*chi_n(x) dx| <= C * sqrt(integral_{norm(x) >= n} h(x) dx).
Then integral f(x) dx = 0.

Every integral must be justified. Prove tail-integral convergence, dominated convergence of the tested integral, and uniqueness of limits. The RHS is an explicit flux-tail hypothesis; it is not claimed proved for the PDE. The next PDE application, if this node passes, must establish its own tests and bound from the actual momentum equation. An equivalent sharper formulation may use explicit L² field norms, but any changed target must be recorded before proof verification.

Source motivation: Fan–Lu–Wang arXiv:2610.04884v1, Lemma 3.3, PDF p.22. The generic cutoff-tail argument is to be independently derived, not assumed as an external axiom.

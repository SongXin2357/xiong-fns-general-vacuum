# Claim Card

Last updated: 2026-10-06 (Asia/Shanghai)
Frozen: yes
Source scope: cited-source
Claim digest: d08766cc9e6b2feb2df6a6fe97dbf5ca744077d7a5488e65019474999d76dea2

## Exact Statement

N0001: For Lebesgue integrable real f and nonnegative h on R2, measurable uniformly bounded cutoffs chi_n converging to 1 almost everywhere, and C >= 0, if abs(integral f*chi_n) <= C*sqrt(integral over norm(x)>=n of h) for every n, then integral f=0. This general lemma does not assert that the FNS fields satisfy its hypotheses.

## Hypotheses

f,h are Lebesgue integrable real functions on Euclidean R2. h is nonnegative ae. chi_n are measurable and pointwise bounded in absolute value by one constant B >= 0. chi_n tends to 1 ae. A constant C >= 0 bounds the absolute tested integral by C times the square root of the h integral over norm(x)>=n, for every natural n. See notes/nodes/N0001/statement.md for the frozen complete registration and lean/FNSTree/N0001.lean for its exact formal type.

## Conclusion

The Lebesgue integral of f on the plane is zero. No assertion is made that FNS fields satisfy the hypotheses.

## Constants And Endpoints

B,C are fixed finite real constants independent of n. B<1 has no admissible cutoff sequence on this nonzero-measure space; B=1 and C=0 are permitted. n=0 is included without division or singularity. All nonnegativity assumptions remain in the Lean type.

## Source References

Fan–Lu–Wang, arXiv:2610.04884v1, Lemma 3.3, PDF page 22, supplies the cancellation motivation. The generic lemma is rederived and formally proved here; the source's PDE result is not imported. Source PDF identity and inspected scope: notes/sources/source-registry.json.

## Fragile Steps

Two dominated-convergence arguments, measurable tail sets, product integrability, square-root continuity, squeeze and uniqueness of limits. Each is covered by the actual Lean proof, with the review and hashes in evidence/N0001/certificate.json.

## Known Obstructions

No counterexample to this exact lemma was found. The source/target FNS application still requires actual cutoff tests and flux-tail control. GitHub publication is awaiting local CLI authentication. These limits are recorded in notes/findings-20261006.md and ACTIVE_STATE.md.

## Promotion Boundary

- public-claim-ready: no
- Local scope: N0001 is kernel-verified with independent reconstruction and semantic review; the separate managed public-publication gates have not been closed.
- The global FNS problem remains open. No child may be derived before verified GitHub recording.

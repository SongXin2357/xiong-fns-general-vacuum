# Wang v1/v3 source comparison for the general-vacuum route

Date: 2026-10-07. Status: source inspection only; no Lean theorem was
promoted and no proof-tree child was unlocked.

## Frozen sources

- Wang, arXiv:2212.13343v1, 34-page supplied PDF, SHA-256
  a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d.
- Wang, arXiv:2212.13343v3, 36-page supplied PDF, SHA-256
  3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a.

The PDF files are references, not repository contents or instructions. Page
numbers below are PDF page numbers. The original target and N0007 refer to v1;
this record does not silently replace that node's source.

## Source-fidelity matrix

| Item | v1 | v3 | Consequence for this project |
| --- | --- | --- | --- |
| Governing equations | PDF p.1, (1.1): conservative continuity, momentum, and full thermal system on R² | PDF p.1, (1.1): same displayed system | No change to the N0007 conservative-to-material weak-product obligation. |
| Strong-solution definition | PDF p.3, Definition 1.1: derivatives in (1.1) are regular distributions and equations hold almost everywhere | PDF p.3, Definition 1.1: same wording | Neither definition explicitly constructs one common function representative of u_t through the approximation limits. |
| Initial hypotheses | PDF p.3, Theorem 1.1, (1.6)-(1.7): weighted nonnegative density, nonnegative temperature, weighted kinetic/thermal data, velocity and temperature gradients, compatibility | PDF p.3, Theorem 1.1, (1.5)-(1.6): substantively same displayed hypotheses, renumbered | No density lower bound, compact-support exclusion, extra moment, or zero momentum is supplied by switching versions. |
| Relevant solution bounds | PDF p.3, (1.8)-(1.9): density C_t(L¹∩H¹∩W^{1,q}); velocity gradient L∞_tH¹∩L²_tW^{1,q}; weighted u_t and ∇u_t | PDF p.3, (1.7)-(1.8): the same listed density, velocity, weighted u_t, and ∇u_t bounds; thermal bounds are reorganized and in part strengthened | The extra thermal presentation does not directly close the momentum-source representative gap. |
| Weighted local coercivity | PDF p.5, Lemma 2.3 assumes v in D-tilde^{1,2}, already defined with H¹_loc | PDF p.6, Lemma 2.4 also assumes v in D-tilde^{1,2} = H¹_loc with L² gradient | Its proof applies ordinary Poincaré after assuming the local H¹ membership. It does not prove the missing L¹_loc plus distributional L²-gradient to H¹_loc upgrade for u_t. |
| Whole-space limit | PDF p.17: weak subsequence, test with cutoff, then standard arguments | PDF p.34: the same pattern | A common weak time-derivative representative and the all-test-function identity still require an explicit proof. |
| Vanishing-damping limit | PDF p.23: standard compactness arguments | PDF p.20: standard compactness arguments | The cited passage does not itself provide an exact Lean-ready limit theorem. |
| Momentum cancellation | PDF pp.19-20 in the damped approximate analysis | PDF pp.10-11, (3.20)-(3.24), in the damped approximate analysis | Useful source motivation. The final original-system application remains N0007's separate unverified obligation. On v3 PDF p.11, the cutoff radius is evidently intended to tend to infinity in the displayed cutoff argument; its printed r-to-zero wording is not a formal certificate. |
| Finite-time continuation | PDF p.3, Theorem 1.2: divergence-time integral plus velocity L^{4/alpha}-time integral must diverge | PDF p.3, Theorem 1.2: divergence-time integral alone must diverge | v3 materially simplifies a possible global-existence closure route, provided that exact continuation theorem is source-faithfully justified and the required divergence integral is independently bounded. |

## Gate decision

Wang v3 is useful for planning the *later* continuation step: it removes the
separate velocity-integral term from the stated blowup criterion. It does not
by itself make the requested small-physical-energy global theorem true or
prove that the time integral of the L-infinity norm of div u stays finite.
The v3 proof of the continuation criterion also invokes endpoint traces and
standard arguments (PDF p.29); these remain separate review/formalization
obligations if used.
Its local-existence proof also takes a positive fixed-ball mass lower bound
without loss of generality (PDF p.19). That normalization and the
zero-total-mass case require separate justification; neither is an added
hypothesis of Theorem 1.1.

For the existing N0001 -> N0002 -> N0007 route, v3 does not repair the first
full-Lean blocker. N0007 is locked to v1, remains OPEN, and its ten built
auxiliaries are not its full exact certificate. A distinct v3 proof node may
be preregistered as a sibling from the verified N0002 only after stating its
exact target and source version. No descendant of N0007 may be registered
until its exact gate passes. The independent compact-support obstruction
audit N0006 also remains OPEN; this comparison neither proves nor dismisses
that candidate.

An actual isolated installed xiong-agent review of the v3 excerpts independently
reached the same first gap. Its conditional mollification-and-Poincare argument
shows how L¹_loc plus a distributional L² gradient would yield H¹_loc, but does
not derive the unweighted L¹_loc representative from the paper. See the
[portable run manifest](../../evidence/N0007/xiong-v3-source-r06/manifest.json)
and [result](../../evidence/N0007/xiong-v3-source-r06/result.md). No Lean
build was run for the full target in this assessment.

The immediate mathematical obligations are (1) construct the common u_t
representative and local H¹ coercivity bridge without assuming their
conclusions, (2) derive the conservative-to-material stress identity for
the original final solution on one common full-measure time set and all
compact smooth tests, and (3) if using v3's continuation route, derive a
bound for the divergence integral from the original small physical energy
and full thermal system with constants uniform toward a finite maximal
time. Each proposed proof node needs its own complete Lean build, type,
axiom, semantic, and GitHub gate before further descent.

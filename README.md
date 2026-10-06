# xiong-fns-general-vacuum

Research towards small-physical-energy global strong solutions of the two-dimensional full compressible Navier–Stokes system with heat conduction and far-field vacuum.

**The global theorem is OPEN.** This repository records exact proof scopes, failed attempts, and actual Lean evidence. A passed general lemma does not certify its application to the PDE.

## Research tree

```mermaid
flowchart TD
 ROOT["ROOT: original problem — OPEN"] --> N0001["N0001: cutoff-tail zero-mean lemma — LEAN VERIFIED; published on GitHub"]
 N0001 --> N0002["N0002: distributional divergence — LEAN VERIFIED; published on GitHub"]
 ROOT --> N0003["N0003: Li-Xin global route — UNCLOSED"]
 ROOT --> N0004["N0004: coupled thermal route — UNCLOSED"]
 ROOT --> N0005["N0005: initial trace — PARTIAL; full Lean target OPEN"]
 ROOT --> N0006["N0006: compact obstruction — PAPER DRAFT; Lean NOT_RUN"]
```

- [Problem and workflow](AGENTS.md)
- [Node N0001: exact target](notes/nodes/N0001/statement.md)
- [Claim ledger](notes/claims.md)
- [Machine-readable tree](notes/tree.json)

Each proof node must pass Lean build, transitive-axiom inspection and semantic review before its branch can extend. Failed nodes remain visible. Publication must include all certificate-bound files and the full dependency closure. The private [GitHub repository](https://github.com/SongXin2357/xiong-fns-general-vacuum) is active; [N0001 publication receipt](evidence/N0001/github-initial-publication.json) records full byte-for-byte remote readback.

## First verified node

N0001 uses actual Lebesgue integrals and two dominated-convergence arguments. [Lean source](lean/FNSTree/N0001.lean), [certificate](evidence/N0001/certificate.json), [independent proof](notes/nodes/N0001/independent-proof-20261006.md), [semantic review](notes/nodes/N0001/semantic-review-20261006.md), [red-team](notes/nodes/N0001/redteam-20261006.md).

The exact-target file is the immutable preregistration snapshot: its initial exploring / Lean NOT_RUN line records the status before proof work. Current status is recorded in the claim ledger, tree registry and certificate above.

N0002 has passed its exact local Lean/review gate; N0003 is an independent open global target. No PDE application is certified. N0001 is published at [commit 8211cef](https://github.com/SongXin2357/xiong-fns-general-vacuum/commit/8211cef495fded145823cfeedd35464ee7a18e6f). Its branch may extend only after the current evidence and publication gate passes.

[English TeX note](manuscript/cutoff_cancellation.tex) · [Compiled PDF](manuscript/cutoff_cancellation.pdf) · [Reproduction](REPRODUCE.md)

N0002 is published at [commit 1174efe](https://github.com/SongXin2357/xiong-fns-general-vacuum/commit/1174efed45e32e6a34ecb03e7a003d9a3ee1789b). Its [publication receipt](evidence/N0002/github-publication.json) records a complete remote byte comparison.

The strict-viscosity compact-support audit now has independent paper-level reconstruction and review. It provides substantial contrary evidence to the original target, but has no Lean certificate and no descendants. The initial-trace node has seven checked auxiliary lemmas; its full target remains open. No complete global paper or full-paper formalization pass is claimed.

## Current English research drafts

- [Main positive-estimate manuscript](manuscript/paper_en.tex) · [11-page compiled PDF](manuscript/paper_en.pdf).
- [Separate compact-support audit](manuscript/compact_audit.tex) · [12-page compiled PDF](manuscript/compact_audit.pdf).
- [Chinese substantive report](notes/research-outcome-20261006-zh.md) · [Full current TeX–Lean map](notes/current-tex-lean-map-20261006.json).

The main draft does not claim global existence. The compact audit is a paper-level conditional obstruction in the strict-viscosity original displayed class; its analytic Lean chain and local construction remain unverified. The editable originals remain in the user-requested parent project paths. Full-paper formalization is NOT_PASS.

# xiong-fns-general-vacuum

Research towards small-physical-energy global strong solutions of the two-dimensional full compressible Navier–Stokes system with heat conduction and far-field vacuum.

**The global theorem is OPEN.** This repository records exact proof scopes, failed attempts, and actual Lean evidence. A passed general lemma does not certify its application to the PDE.

## Research tree

```mermaid
flowchart TD
 ROOT["ROOT: original problem — OPEN"] --> N0001["N0001: cutoff-tail zero-mean lemma — LEAN VERIFIED; GitHub pending"]
```

- [Problem and workflow](AGENTS.md)
- [Node N0001: exact target](notes/nodes/N0001/statement.md)
- [Claim ledger](notes/claims.md)
- [Machine-readable tree](notes/tree.json)

Each proof node must pass Lean build, transitive-axiom inspection and semantic review before its branch can extend. Failed nodes remain visible. GitHub publication awaits local CLI authentication.

## First verified node

N0001 uses actual Lebesgue integrals and two dominated-convergence arguments. [Lean source](lean/FNSTree/N0001.lean), [certificate](evidence/N0001/certificate.json), [independent proof](notes/nodes/N0001/independent-proof-20261006.md), [semantic review](notes/nodes/N0001/semantic-review-20261006.md), [red-team](notes/nodes/N0001/redteam-20261006.md).

No PDE application or child is certified. Publication is waiting for GitHub CLI authentication.

[English TeX note](manuscript/cutoff_cancellation.tex) · [Compiled PDF](manuscript/cutoff_cancellation.pdf) · [Reproduction](REPRODUCE.md)

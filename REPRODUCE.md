# Reproduction

The global FNS target is open. This repository currently certifies only N0001.

## Portable Lean build

From `lean/`, with the version in `lean-toolchain` installed:

```sh
lake exe cache get
lake build
lake env lean FNSTree.lean
```

The tracked manifest pins Mathlib and its dependencies. Do not run `lake update` to change the pin. The actual local build reused already installed matching dependency sources and caches through ignored `lean/local-runtime/`; its commands and versions are in `evidence/N0001/lean-final-report.json` and the referenced JSON/log files. `evidence/N0001/lean-driver.py` reproduces that existing local environment only.

## Research gate

```sh
python scripts/tree_gate.py audit
python scripts/tree_gate.py can-extend N0001
```

The first command validates current evidence hashes and tree structure. The second checks the exact current certificate, all bound files and every parent/dependency against the recorded fetched GitHub commits. N0001 now has a verified private-repository publication. Before extension, fetch origin and retain actual remote readback evidence; an offline gate does not attest live GitHub freshness. A passing structural audit is not a global PDE proof.

## English note

```sh
cd manuscript
pdflatex -interaction=nonstopmode -halt-on-error cutoff_cancellation.tex
pdflatex -interaction=nonstopmode -halt-on-error cutoff_cancellation.tex
```

The source is standalone and embeds the project's existing Li–Xin-inspired layout. Two-page output and build/visual records are supplied. This is an analytic note, not a completed global-existence paper.

## Actual installed xiong-agent calls

`positive-hardy-r02` derived the registered target. `review-r02` independently red-teamed the supplied candidate (not a blind review). Both completed with exit 0; their process, rule-load, execution and result records are under `evidence/N0001/xiong-*`. The separate Lean reconstruction received only the statement and definitions and never read either candidate.

## Exact evidence bytes

The repository disables Git text conversion in `.gitattributes`. Certificates hash the exact saved bytes; clone and checkout must preserve those bytes on Windows and Linux. Line-ending changes to certified files require a new certificate review.

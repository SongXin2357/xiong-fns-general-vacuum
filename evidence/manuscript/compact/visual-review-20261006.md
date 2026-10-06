# Compact manuscript visual review - 2026-10-06

## Scope and artifact identity

Visual QA only. No mathematical derivation, proof-status assessment, source edit, or Git operation was performed.

- PDF inspected: `research/compact-recheck/paper_en_reviewed.pdf`.
- Actual PDF SHA-256, independently recomputed in this review: `e790d9e5b245556a798260ead362d3057483cd93b23780604621efbb06280b75`.
- Source SHA-256 recorded in `20261006T141158Z-build.json`: `44287e13676392d18e7b9989484b4f9e4703d8d1ed4643a6164cb280098fb887`.
- Build record: two pdflatex passes, both exit code 0. This review did not rerun the compiler.
- Render manifest: 12 pages, scale 1.8, matching PDF SHA-256, all pages rendered.
- Method: actually opened and visually inspected all twelve individual full-page images, `render/page-01.png` through `render/page-12.png`, using original image detail. No page was accepted based only on text extraction or contact sheets.

## Result

**PASS with one minor, nonblocking typography observation.**

No clipped formula, formula/number collision, overlapping text, text extending outside the page margins, missing-glyph box, malformed visible mathematical symbol, blank page, or orphaned section heading was observed. Running headers, top rules, page numbers, body typography, theorem headings, displayed-equation numbering, and blue cross-references are consistent across the twelve pages.

This is a visual readability result for the identified PDF only, not a mathematical correctness or publication-readiness certificate.

## Actual page-by-page inspection

| Page | Material visually checked | Finding |
| --- | --- | --- |
| 1 | Two-line title, abstract, keywords, Section 1 heading, equations (1.1)-(1.5) | Clear hierarchy and readable compact text. Equations and right-aligned numbers remain inside the text block. The abstract/keywords/section transition is distinct. |
| 2 | Introductory paragraphs, weights and exponents, equations (1.6)-(1.8), Definition 1.1 opening | No overlap or clipping. The definition begins with several lines before continuing on page 3; its heading is not orphaned. There is more lower-page whitespace than on most interior pages, but no blank or functionally unbalanced page. |
| 3 | Full regularity display (1.9), trace display (1.10), shorter list (1.11), data and moments (1.12)-(1.13) | Tall and multiline displays remain readable; radicals, time weights, exponents, and display numbers are separated. Bottom display stays within the page. |
| 4 | Theorem 1.1, lifespan fraction (1.16), Section 2, Lemma 2.1, equations (2.1)-(2.2) | Long fraction/radical is fully visible. Section and lemma headings have following content; bottom integrals are not clipped. |
| 5 | Proposition 2.2 and proof, equations (2.3)-(2.9) | Multiline bounds, integral limits, and the Jacobian exponential are readable. No number collisions or margin overflow. |
| 6 | Flow/transport argument, equations (2.10)-(2.15) | Dense paragraphs and displayed spatial/time conditions remain readable. Long inequality (2.11) and final three-line display fit. |
| 7 | Equations (2.16)-(2.18), Proposition 2.2 proof end, Section 3, Proposition 3.1, (3.1) | No clipping or overlap. Minor observation: the proof-ending sentence breaks after `T <`, leaving `T_*` alone on the following line before the proof square. This is a line-break blemish, not a missing symbol. The proposition statement continues onto page 8 in a readable way. |
| 8 | Proposition continuation, energy proof, equations (3.2)-(3.8) | Norm subscripts, time-space exponents, multiline estimate (3.7), and bottom equation are clear and within bounds. |
| 9 | Product-rule and energy-balance discussion, equations (3.9)-(3.13), final thermal trace display | Integral displays and absolute-value delimiters render correctly; paragraphs and final display do not overlap. |
| 10 | Proof conclusion from Section 3, Section 4 heading, equations (4.1)-(4.6) | Section heading is followed by substantial proof text. Wide virial inequality (4.4) fits without touching its number. |
| 11 | Theorem proof end, Corollary 4.1, piecewise bump function, equations (4.7)-(4.11) | Piecewise brace, compact-support data, compatibility display, and radicals are fully visible. No orphaned heading or broken symbol. |
| 12 | Equations (4.12)-(4.13), closing discussion, References | Final fraction and integral bounds are legible. Reference heading and its entry stay together. The remaining lower-page whitespace is normal for this final page. |

## Minor optional polish

On page 7, keep the inline comparison `T < T_*` together in the final sentence of the Proposition 2.2 proof, if a later typography-only pass is desired. The present rendering is understandable and does not warrant blocking delivery. No change was made during this QA pass.

## Observed comparison with the supplied Li-Xin article

The first page of the actual supplied file
`C:/Users/11988/xwechat_files/wxid_v55clnsg07kt22_8784/msg/file/2026-10/Li-Xin2019_Article_GlobalWell-PosednessAndLargeTi.pdf`
was rendered with Poppler and actually viewed at full-page detail. It is the Annals of PDE (2019) 5:7 article by Jing Li and Zhouping Xin, with a bold sans-serif title/heading hierarchy and a compact serif single-column body.

The reviewed manuscript shows a similar general typography hierarchy and single-column mathematical-journal presentation. Its first page is more compact because it proceeds from the abstract/keywords directly into equations; the supplied article has substantial author, publication, funding, and affiliation front matter. This is a limited visual comparison of first pages only. No claim of exact template matching or inspection of the rest of the supplied article is made.


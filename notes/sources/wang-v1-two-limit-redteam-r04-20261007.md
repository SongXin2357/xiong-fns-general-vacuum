# Independent source-limit red-team for the Wang-v1 $u_t$ representative

Date: 2026-10-07. The actual installed xiong-agent reviewed the
[pre-review candidate](wang-v1-two-limit-ut-pre-review-20261007.md)
against serialized original Wang-v1 PDF pp.3,5–9,16–23, without
shell/file tools or access to other runs. The [portable run manifest](../../evidence/N0007/limit-run-manifest.json)
records input/prompt hashes, installed root-rule hashes, execution exit
code and archived response. The complete [review](../../evidence/N0007/xiong-limit-r04/result.md)
is preserved. It was a nonblind source audit, not a Lean run.

The reviewer accepted the positive-mass local-compactness mechanism as
a **conditional reconstruction**, subject to a common interval and
the cited uniform estimates. It found these concrete corrections:

1. (3.10) and (4.6) are conditional mass anchors; choose an interval
   where the kinetic bound, anchor and asserted common lifespan hold.
   A continuity-equation cutoff shows the anchor persists there.
2. (2.11) controls the anchor ball directly. For arbitrary compact
   $K$, enlarge to a fixed ball containing both $K$ and the anchor,
   or use (2.9).
3. At the first stage, local $L^2$ of velocity comes from the weighted
   inequality, not an unstated global $L^{q_2}$ bound. At the second
   stage the representative reconstruction needs (4.2) and the
   anchor; invoking (4.3) would risk circularity because its proof
   uses cancellation (4.16).
4. Strong convergence follows from local $H^2/H^1$ compactness and
   time equicontinuity. The square-root-density estimate must be
   applied in space-time. Weak $L^2$ convergence alone does not
   recover the final $L^\infty_tL^2_x$ weighted derivative bound;
   use lower semicontinuity on every measurable time set.
5. The cutoff fields from (3.62) agree with originals on fixed
   compact sets for large $r$, but do not satisfy the original
   whole-plane equations without cutoff error terms.
6. PDF p.20's printed $r\to0$ at the end of the expanding-cutoff
   proof of (4.16) is the wrong limit direction. The argument needs
   $r\to\infty$. The source's every-time claim is stronger than the
   a.e.-time cancellation currently justified.

The [corrected reconstruction](wang-v1-two-limit-ut-bridge-20261007.md)
records these repairs. The agent did not receive the full PDF, the
cited Li–Liang proof, or N0002's exact Lean type. It did not verify
the continuation of all approximants to one common interval,
temperature compactness, nonlinear limit passages, initial traces,
uniqueness, or zero-mass existence. Those remain source-level open
obligations. Registered N0007 assumes a final solution already
satisfying (1.8), and its full Lean gate remains OPEN.
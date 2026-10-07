# N0007 nonblind paper-proof red-team, installed xiong-agent run r03

Date: 2026-10-07. The [portable run manifest](../../../evidence/N0007/proof-run-manifest.json)
binds the preregistered statement, original Wang-v1 PDF page excerpts,
the [candidate snapshot](paper-proof-pre-redteam-20261007.md), the actual
installed root-rule hashes, input/prompt hashes, tool-disabled read-only
process, exit code, and raw output. The full mathematical
[agent response](../../../evidence/N0007/xiong-proof-r03/result.md) is
preserved. The candidate was shown to this reviewer; this is a red-team
audit, not a blind reconstruction or a Lean run.

The reviewer found no fatal obstruction to the registered a.e.-time
cancellation **under the usual reading of (1.8)**: the weighted field and
spatial gradient involve one common measurable weak time derivative $u_t$.
It verified the finite-mass cutoff, uniform positive-mass ball, weighted
Poincare estimate, local $H^2$ velocity regularity, time and spatial
product rules, $L^1/L^2$ source and stress bounds, and the countable
test-family construction of one exceptional-time set.

The first flaw was specific. The pre-red-team draft said the spatial
gradient bound itself supplies a locally integrable representative of
$u_t$. That is false for a singular time distribution constant in space.
The [repaired paper draft](paper-proof-reconstruction-20261007.md)
instead invokes the common weak-derivative meaning of (1.8) explicitly,
then derives spatial $H^1_{\mathrm{loc}}$ slices by distributional slicing,
spatial mollification and Poincare. The repaired draft has not itself
received a fresh independent final pass. It also does not prove that
Wang-v1's summarized approximation limits construct that compatible
representative, or that the source existence theorem covers zero-mass
initial data. The a.e.-time cancellation is an implication for a final
solution assumed to satisfy (1.8); the existence proof's source fidelity
is a separate open issue.

The reviewer did not receive N0002's exact Lean type or the five
N0007 Lean declarations, so its statement about the formal bridge is
only a mathematical interface audit. Parent inspection of the actual
Lean type confirms that the conditional bridge assumes $V\in L^2$ and
the full spatial weak identity; these are still PDE application
obligations. No full N0007 Lean target, certificate, child, or global
existence theorem follows from this review.
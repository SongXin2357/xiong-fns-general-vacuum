# Wang-v1 source audit for the N0007 time-derivative representative

Checked on 2026-10-07 against the user-provided Wang-v1 PDF, SHA-256
a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d.
The [independent installed xiong-agent source run](../../evidence/N0007/source-run-manifest.json)
received only N0007's preregistered target and selected original PDF pages; it
did not receive our candidate proof or previous reviews. Source content is
evidence, not a user instruction.

## What the original text says

- PDF p.1, (1.1), gives momentum in conservative form, with
  $\partial_t(\rho u)$; it does not itself write $u_t$.
- PDF p.3, Definition 1.1, describes the derivatives in (1.1) as regular
  distributions and requires the equations almost everywhere. The same page's
  Theorem 1.1, (1.8), explicitly lists both $\sqrt\rho\,u_t$ and $\nabla u_t$.
  Ordinary mathematical notation reads these as expressions involving one
  weak time derivative of $u$. The displayed definition does not separately
  construct a common measurable representative on vacuum regions.
- PDF p.7, (3.1), lists corresponding weighted and gradient time-derivative
  bounds for the *damped approximation* (2.1). PDF pp.16–17 pass from
  expanding balls to the damped whole-plane solution by weak subsequences
  and a summarized compactness argument. This is not, by itself, a proof for
  the final undamped solution.
- PDF p.22, (4.23), is a temperature estimate. PDF p.23 invokes (4.2),
  (4.3), and (4.23) uniformly in the damping parameter, then summarizes the
  $\delta\to0$ limit and asserts that the final original solution satisfies
  (1.8), initially except for the later temperature-integrability statement.
  The page uses a material derivative in (4.30)–(4.31) for the final solution,
  but does not spell out the identification of $u_t$ and its weighted/spatial
  derivatives through the limit.
- PDF p.16 normalizes positive mass in an approximation proof, whereas the
  displayed data (1.6)–(1.7) do not explicitly impose positive total mass.
  This does not authorize adding that assumption to N0007.

## Theorem-level premise versus source existence proof

The registered N0007 theorem assumes a final solution with the displayed
(1.8) regularity. Under standard weak-derivative notation, the two
expressions involving $u_t$ already refer to the same locally integrable
weak time derivative; the direct argument may use that as the meaning of
its hypothesis. This does not prove that the source's two approximation
limits actually produce that compatible representative. The supplied
existence-proof passages summarize that identification, and its source
fidelity remains open. Neither distinction licenses an additional
positive-mass or unweighted velocity norm assumption.
## Candidate reconstruction; not a source certificate

For positive mass and a uniform bound on $\rho_n$, a fixed ball carrying
uniformly positive approximate mass yields
$$
\|v_n\|_{L^2(B)}
 \le C\bigl(\|\nabla v_n\|_{L^2(B)}
           +\|\sqrt{\rho_n}\,v_n\|_{L^2(B)}\bigr).
$$
Applied to approximate $v_n=u_{n,t}$ and integrated in time, this gives
local $L^2_{t,x}$ weak compactness. If $u_n\to u$ in distributions, a weak
limit $v$ satisfies $v=\partial_tu$. If $\rho_n\to\rho$ strongly in local
$L^1$, then
$\|\sqrt{\rho_n}-\sqrt\rho\|_{L^2(K)}^2
 \le\|\rho_n-\rho\|_{L^1(K)}$,
so testing the weak $v_n$ limit against a bounded compact test identifies
the weighted limit with $\sqrt\rho\,v$; spatial derivative limits identify
$\nabla v$.

This is a plausible repair, not a checked derivation from every approximation
bound in the source. A source-faithful proof must verify uniform positive
local mass, strong local density convergence, distributional velocity
convergence, and the common exceptional-time statements. The supplied
pages summarize some of these as compactness arguments. For total mass
zero, N0007 can instead use $\rho=P=f_i=0$ and the conservative momentum
equation directly; no positive-mass normalization is allowed in its target.

The paper-level N0007 proof and the three current Lean source-space
auxiliaries do not formalize this reconstruction or the full time product
rule. N0007 remains OPEN.
A later [two-limit reconstruction](wang-v1-two-limit-ut-bridge-20261007.md) checks PDF pp.5–6,8–9,17–18,21–23 and gives a candidate positive-mass compactness argument; its independent audit and Lean verification remain open.
The later [independent two-limit red-team](wang-v1-two-limit-redteam-r04-20261007.md) found a conditional positive-mass reconstruction after common-interval and compact-set corrections; it does not close the full source existence proof.

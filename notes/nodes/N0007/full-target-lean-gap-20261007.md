# N0007 exact Lean target: attempted full-scope audit, gate still open

Date: 2026-10-07. The user explicitly required the complete N0007 theorem
to pass Lean. This record reports what was actually checked; it is **not** a
replacement theorem or a successful full-target certificate.

The original supplied Wang-v1 PDF (SHA-256
`a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d`)
was reread at pp.1 and 3. Definition 1.1 requires the derivatives appearing
in the conservative system (1.1) to be regular distributions and its
equations to hold almost everywhere. Theorem 1.1 (1.8) separately lists
`√ρ u_t` and `∇u_t`. The conventional interpretation is a single weak
time-derivative representative `u_t`; the displayed conservative
definition alone does not construct that representative through the
source's approximation limits. The recorded N0007 exact statement remains
the controlling target.

The installed xiong-agent was actually invoked in a fresh isolated
nonblind run using only the exact statement, selected original PDF text,
the current paper derivation, and actual Lean source. Its
[portable run evidence](../../../evidence/N0007/full-lean-run-manifest.json)
records loaded root rules, input hash, command, exit code and response.
The agent did **not** run Lean. Independently, the parent inspected the
locked Mathlib 0df444a... sources: its SobolevInequality module treats
compactly supported C¹ subcritical inequalities, while the searched
weak-derivative and Poincaré APIs did not yield a ready theorem for the
Wang-v1 local weighted step. This search does not prove absence of every
possible alternative library lemma.

## First exact analytic obligation

On a bounded planar ball B, assume `0 ≤ r ≤ M` a.e., `∫_B r ≥ c > 0`,
`v ∈ L¹(B)`, the **distributional** spatial gradient of `v` belongs
to `L²(B)`, and `√r v ∈ L²(B)`. Prove in Lean, without placing the
conclusion among the premises, that `v ∈ H¹(B)` and

```text
‖v‖_{L²(B)} ≤ C(B,c,M)
  (‖∇v‖_{L²(B)} + ‖√r v‖_{L²(B)}).
```

This must include the unweighted L¹-to-H¹ upgrade and ordinary Poincaré
estimate for weak gradients. The positive mass anchor must itself be
derived from the original continuity equation and L¹ continuity, not
postulated as an extra positive-density hypothesis. The zero-total-mass
case needs its separate conservative-equation argument.

## Remaining exact-target obligations

After that step, the verified chain still needs a faithful formal
definition of Wang's full solution class and common weak `u_t`
representative, the 2D `W^{1,q}`/local `H²` embeddings, temporal and
spatial weak product rules, the derivation of the material-source weak
stress identity from the original **conservative** equations, Fubini
and integrability for the temporal residual, and a countable supported
C¹-dense test family with extension to **all** compact smooth tests.
Only then may the already certified N0002 theorem be applied.

The previously built ten N0007 auxiliaries, including the finite-interval
time-slice and stress-row lemmas, have real locked builds and axiom logs.
They assume key intermediate facts; no complete Wang-v1 PDE theorem was
stated and built in Lean. **N0007: OPEN; full-target Lean: NOT_RUN; no
certificate; no descendants; global-existence target: OPEN.** The
agent's paper-level route and this obligation inventory are not proof
authority and must not be promoted under the tree gate.

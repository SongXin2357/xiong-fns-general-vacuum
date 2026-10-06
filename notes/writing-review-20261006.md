# Writing review — 2026-10-06

## Assignment and input boundary

This writing pass replaced only manuscript/paper_en.tex and research/general-vacuum/paper_general_vacuum.tex, with identical mathematical content. The root process reported a preserved snapshot at frozen/before-research-integration-20261006T134854Z before the edits.

Read inputs:
- Project AGENTS.md, for manuscript style and scope rules.
- notes/sources/wang-v1-baseline-20261006.md.
- notes/nodes/N0001/statement.md.
- notes/nodes/N0002/statement.md, primary-proof-20261006.md, and independent-proof-20261006.md.
- notes/nodes/N0003/derivation-20261006.md.
- notes/nodes/N0004/derivation-20261006.md.
- manuscript/li_xin_style.sty and only the first 15 lines of the old manuscript/paper_en.tex, for existing macro semantics.
- Bibliographic corrections supplied directly by the root after its own reading of the primary PDF title pages: Li–Xin's full 2019 article title/DOI and the Fan–Lü–Wang title, authors, and v1 date.

No old positive or negative argument, other run, source history, or compact-support audit was read. The mathematics-proof skill was used only for checking the calculation details. Its Chinese teaching-note output format was superseded by the explicit English manuscript assignment. No new node or proof-state promotion was created.

## Retained mathematical scope

Title: Planar Cancellation and Energy Estimates for Heat-Conducting Compressible Flow.

1. Full original PDE, physical coefficient assumptions, conservative initial traces, original weighted initial conditions, and the entire recorded local strong-solution class. In particular:
   - alpha = min(a/2, 1);
   - p_u = 4/alpha;
   - p_theta = 6/(2alpha - 1);
   - physical E0 = integral rho0 |u0|^2/2 + cv rho0 theta0;
   - the original weak far-field qualification and the distinction between u itself and an equivalence class modulo constants;
   - no new support, moment, positivity, momentum, entropy, or small higher-norm premise.
   The printed source's lack of a separately explicit positive-mass assumption is recorded without silently repairing it or asserting a contradiction.

2. General bounded-cutoff lemma (N0001 scope), with integrability, two dominated-convergence arguments, and uniqueness of limits fully explicit.

3. General planar distributional-divergence theorem (N0002 scope), with an actual smooth cutoff, the exact two-dimensional change-of-variables calculation, annular support, an L2–L2 flux pairing, and the derived integrable-tail bound. It is not applied to the FNS stress/forcing. No weighted Hardy or elliptic corollary was introduced.

4. The N0003/N0004 energy and pressure identities are written as classical propositions only under an explicit smooth rapid-decay assumption that justifies each integration by parts, time derivative, and cutoff limit. The paper separately displays a general L1-flux cutoff bound. The source local class is not asserted to provide these assumptions.

5. The retained classical calculations are:
   - kinetic/internal/total physical energy balance and its pressure-dependent dissipation estimate;
   - effective-flux pressure feedback with the exact nonabsorbable coefficients;
   - pressure evolution and pressure-square identity, retaining heating and the mixed density-gradient conduction term;
   - the thermal quadratic test;
   - momentum tested against u theta, with all L2 pairings and Young inequalities shown;
   - the localized thermal test including both derivative-of-weight terms;
   - the total specific-energy equation, both versions of its square multiplier, the velocity-weighted flux bound, and its explicit conditional Gronwall estimate.

6. A smooth concentrated-temperature family separates small physical energy from small instantaneous pressure square or specific-energy square. Every datum satisfies the displayed regularity and momentum compatibility. The text expressly states that higher norms are not uniform in that family and that the example does not disprove a spacetime estimate or global existence.

## Deliberate omissions and unresolved obligations

- No extension of the classical integrated energy identities to the full original Wang solution class is claimed.
- No original-class application of N0002, source-space matching theorem, weighted Hardy theorem, harmonic-part normalization, or initial representative selection is claimed.
- The optional N0003 weighted interpolation and potential-representation pressure estimate were not included; they are unnecessary for the retained results and would add source/representation obligations.
- No uniform density bound, velocity supremum bound, material-acceleration bound, pressure-square spacetime bound, or temperature-weighted heating bound is claimed from small E0.
- The generic mean-zero theorem does not prove the global PDE problem.
- The original continuation integral remains uncontrolled:
  integral_0^T (||div u||_infty + ||u||_(4/alpha)) dt,
  with constants uniform as T approaches a finite maximal time.
- Both the abstract and conclusion explicitly say that no global-existence result has been established.
- N0003/N0004 remain draft analytic targets; they were not promoted to Lean-verified or published nodes by this writing pass.

## Static review performed

The preserved macro semantics include \R, \dd, \dt, \Div, \supp, \norm, and \cH.
In particular, every norm call uses the original two-argument form \norm{f}{p}.
The source contains six sections, one lemma, one theorem, and five propositions, each with a proof.
Static parsing found no duplicate equation labels, no missing referenced labels, no missing bibliography keys, and no mismatched LaTeX environments.

Both TeX files currently have SHA-256:
70CEBF073EA172F4FEF9457975EB30AC91B223FFDBE3ACF069D750D86FBA5F1A

No LaTeX compilation, PDF rendering, Lean build, or git operation was run by this writer, as instructed. Root compilation and visual review remain necessary. The recorded hash describes the settled writer handoff; subsequent root layout corrections may change it.

Root review alignment: Lemma lem:tail now uses the exact pointwise bound for every n and x, matching the immutable N0001 certificate. The smooth rapid-decay scope explicitly asserts neither positive-energy solution existence nor a local construction/non-vacuity result for that auxiliary class. These are conditional identities only.

# N0002 primary proof and exact-scope review — 2026-10-06

The primary reviewer independently reran lake build N0002Check and direct Lean type/axiom printing after inspecting the complete canonical source. The reconstructed proof is as follows.

Choose an actual smooth radial bump eta that equals one on the unit ball, vanishes outside the radius-two ball, and takes values in [0,1]. Its smooth compactly supported gradient has integrable square, with finite integral K. For chi_n(x)=eta(x/(n+1)), the chain rule and planar change of variables give integral |grad chi_n|^2=K. Its gradient vanishes for |x|<n+1 and outside |x|<=2(n+1).

The distributional identity applies to chi_n. Both products are integrable: f chi_n is dominated by |f|; the flux is an L2-L2 pairing. Replacing V in this pairing by its indicator on |x|>=n changes no pointwise value. Cauchy-Schwarz gives |integral f chi_n|<=sqrt(K) sqrt(integral_{|x|>=n}|V|^2). Thus N0001 applies with h=|V|^2, B=1 and C=sqrt(K), yielding integral f=0.

This is exactly the registered theorem. Measurability in the registered statement is realized by the usual ae-strongly-measurable L2 representative. No cutoff existence, flux estimate or zero integral is hidden as an assumption. The finite-dimensional gradient is the actual Frechet gradient on EuclideanSpace R (Fin 2). No totalized nonintegrable integral is used to obtain the result: energy, cutoff products and flux pairings have separate integrability proofs. The weak identity for smooth compact tests is the permitted distributional equation, not the conclusion.

The independent blind reconstruction/Lean worker received only the target, definitions and verified N0001 interface. The installed xiong review-r03 received candidate/source/printed output and is correctly labeled NONBLIND. Its paper and semantic verdicts pass. Its administrative reservations are addressed here by the actual command/exit logs, pinned dependency audit and the certificate. The immutable registration status line remains historical; notes/tree.json is canonical current status.

Parent rerun build and direct print both exit 0. Top-level transitive axioms are only propext, Classical.choice, Quot.sound. The source/root of N0001 remain byte-identical to its existing certificate. The actual installed Mathlib HEAD was separately read as 0df444a360eaa60ab8c11dca51a86af692955474. The harmless unused positivity variable in the gradient chain rule does not change downstream positive-radius hypotheses.

Verdict: PASS for N0002 only. The FNS source-space mapping, global estimates, initial-representative audit and full global existence remain unverified by this certificate. No child has yet been derived from N0002.

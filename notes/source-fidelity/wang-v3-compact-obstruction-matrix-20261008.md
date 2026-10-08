# Wang-v3 source matrix for N0009 (2026-10-08)

Source: user-supplied Xue Wang, arXiv:2212.13343v3, 36-page PDF,
SHA-256 `3d57bb0d85391db8515c8c554509f645886c7e1851efe9a13ee4cc321c63e00a`.
The first three PDF pages were extracted and checked against the user-supplied
v1 PDF (SHA-256 `a5c89e5c8f33b2a74adb276abf99649a0efd4d47ca1196c57a5e08a4a939856d`).
This is a source-scope audit, not a proof or Lean certificate.

| Needed for N0009 | Wang-v3 exact location and content | Scope result |
|---|---|---|
| Conservative mass, momentum and thermal equations | PDF p.1, (1.1), including `P=R rho theta` and thermal conduction `kappa Delta theta` | Present. No material-form time derivative is assumed. |
| Dissipation sign and strict subcase | PDF p.1, (1.2): `mu>0`, `mu+lambda>=0` | `mu+lambda>0` is an allowed subcase, sufficient to test a universal global claim. The endpoint is outside N0009. |
| Initial trace | PDF p.2, (1.3): `(rho,rho u,rho theta)` at zero | Conservative traces only; no unweighted velocity or temperature trace may be imported. The displayed line does not specify a trace topology; the manuscript transparently interprets it as distributional convergence. |
| Compact support allowed | PDF p.3, (1.5): weighted density `L1 cap H1 cap W1q`, `q>2`, `a>1`; no noncompact-support requirement | Smooth nonnegative compactly supported density lies in the class. |
| Signs | PDF p.3, Theorem 1.1: `rho>=0`, `theta>=0` for the solution; (1.5) requires nonnegative initial density and temperature | Available for the exterior superharmonic-temperature argument. |
| Finite velocity exponent and spatial Lipschitz control | PDF p.3, (1.7)-(1.8): `u in L-infinity_t L^{q1}_x`, `q1=4/alpha`; `grad u in L2_t W1q_x`; `alpha=min(a/2,1)>1/2` | `q1<infinity` and `u, grad u in L1_t L-infinity_x` follow on finite intervals by standard 2D embeddings plus local means. |
| Temperature sign, exponent and derivatives | PDF p.3, (1.7)-(1.8): `theta>=0`, `theta in L2_t L^{q2}_x`, `q2=6/(2alpha-1)<infinity`, and `grad theta in L2_t H1_x` | At a.e. time `theta in H2_loc cap L^{q2}`; enough for the two-dimensional exterior nonnegative superharmonic Liouville step. |
| Weighted physical fields and time derivative gradient | PDF p.3, (1.7): `sqrt(rho)u`, `sqrt(rho)theta`, `sqrt(rho)u_t` in `L-infinity_t L2`; `grad u_t in L2_{t,x}` | Source displays the required bounds. Identification of `u_t` with an actual distributional derivative remains a separate semantic/limit obligation, also tracked at N0008. |
| Momentum compatibility | PDF p.3, (1.6): `-mu Delta u0-(mu+lambda)grad div u0+R grad(rho0 theta0)=sqrt(rho0)g`, `g in L2` | For the proof-note family `rho0=psi^2`, `u0=0`, `theta0=epsilon phi`, choose `g=R epsilon(2 phi grad psi+psi grad phi)`; the equation holds exactly. |

The v1 PDF p.3 (1.8)-(1.9) uses different labels (`q2` for velocity,
`q3` for temperature), while v3 p.3 (1.7)-(1.8) calls the *same formulas*
`q1` and `q2`. The regularity used by the compact-support mechanism is
retained in v3. No inference is made from v3's continuation criterion to
global existence. The source's positive-mass normalization in the local
construction is compatible with N0009's positive-mass witness; this audit
does not independently certify that local construction.

Classification: N0009's **assumptions** form a nonempty allowed strict-viscosity
subclass of the displayed v3 theorem. The obstruction conclusion remains a
new mathematical claim requiring independent proof, adversarial check, and
full exact-target Lean formalization. N0006's v1 paper argument is not a
verified dependency and cannot be imported to pass N0009.

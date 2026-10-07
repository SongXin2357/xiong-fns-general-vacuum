# N0002

Exact generic divergence theorem: Lean verified and independently reviewed. [Certificate](../../../evidence/N0002/certificate.json). [Registered statement](statement.md) is the immutable preregistration snapshot. Publication must be recorded before branch extension. No FNS or global-existence claim is certified.

## Continuation status (2026-10-07)

The recorded can-extend N0002 gate exited 0: the exact Lean, review, and publication evidence permits a child. No child was registered in the 2026-10-06 run. This is unfinished research workflow, not a failed N0002 gate.

The proposed next proof node is the application to each row of the original FNS momentum equation. It must verify, in Wang-v1's actual solution class and for the relevant time slices, the weak divergence identity, integrability of V_i = mu grad u_i + (mu+lambda)(div u)e_i - P e_i in L2, and integrability of f_i = rho dot u_i in L1. The present generic certificate proves none of these application premises. If certified, it would yield integral rho dot u_i = 0 (a momentum-balance consequence), not the pressure/temperature bounds or continuation criterion needed for global existence. N0003 and N0004 are separate ROOT branches, and N0006 is an unverified obstruction audit.

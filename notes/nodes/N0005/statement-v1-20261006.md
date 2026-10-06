# N0005 — Initial representative and the stated local-solution class

Preregistered 2026-10-06. Parent ROOT. Status exploring; Lean not run. Independent source/trace audit, not a presupposed counterexample.

Exact target: Given 1<p<infinity, a velocity u uniformly bounded in Lp(R2) for 0<t<T, density rho(t) converging locally uniformly to rho0 as t decreases to zero, and conservative distributional trace rho(t)u(t) -> rho0 u0, establish existence of v in Lp with rho0 v = rho0 u0. In particular if rho0>0 almost everywhere, establish u0 in Lp. Prove carefully using a sequence of admissible times, weak compactness or a direct test-function argument; do not assume strong unweighted initial convergence.

Source question: Does Wang v1 explicitly impose an initial representative condition that supplies this necessary consequence? Independently check rho0=A exp(-|x|^2), u0=c constant nonzero, theta0=0 against every initial condition, compatibility and the exact time range/meaning of the far-field statement. Assess whether these data lie in the literal displayed class, and distinguish that reading from a tacit far-field restriction at time zero. Never claim this proves nonexistence in a different homogeneous/normalized class.

The source-to-lemma mapping and the data verification must be explicit. Do not extend any child from this node until actual Lean verification and semantic review have passed. An analytic argument not yet in Lean remains a draft, even if the source mismatch is concerning.

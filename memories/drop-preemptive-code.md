---
name: drop-preemptive-code
description: Code added "for symmetry" or "we'll need it next" but with no call sites yet is dead code — drop it and add it back when the work that needs it actually starts. Doc references describing future design are exempt.
metadata:
  type: feedback
---

Code added preemptively — an enum case, type, helper, parameter — "for symmetry" or "we'll need this for the next phase anyway," but with **no call sites reading it yet**, is dead code. Drop it; add it back when the work that actually needs it begins.

**Why:** a definition with no readers carries inert weight and can actively cause problems (e.g. a lint/consistency gate failing on a reference whose counterpart doesn't exist yet). "A future phase plans to read it" doesn't make it live now — and if removing it later is cheap, there's no cost to deferring.

**How to apply:**
- Before adding something "for symmetry" / "for parity" / "we'll need it next," ask whether adding it later is cheap. If yes, defer.
- When a CI/lint failure is caused by a preemptive reference, "delete the reference" is a valid fix — often cleaner than making the rest of the world catch up to it.
- (A dead-code detector like `knip`, or a language equivalent, can help surface definitions that have no readers — preemptive or merely abandoned.)
- Exception: **doc references are not code.** A design doc describing future/planned state legitimately mentions things that don't exist in code yet; don't delete those just because their code counterpart is absent.
- Exception: **load-bearing shape is not preemptive.** A schema field or a control-flow seam whose later addition would be *expensive* (a data migration, reshaping stored records) earns its place now even before its "smart" reader exists — that's holding the architecture's shape, per [[design-full-shape-slice-vertically]]. The same cost test decides both cases: cheap to re-add → drop it; expensive to re-add → keep it. What this memory drops is the *code symbol* that's cheap to add back when its call site arrives.

Related: [[let-patterns-emerge]] (don't build ahead of real usage), [[scale-intervention-to-repo-maturity]] (match the change's boldness to repo fragility), [[design-full-shape-slice-vertically]] (the cost-of-deferral boundary — inert code drops, expensive-to-add shape stays), and [[tests-pay-rent]] (the same YAGNI — "You Aren't Gonna Need It" — judgment applied to tests: write one only when its value beats its forever-cost).

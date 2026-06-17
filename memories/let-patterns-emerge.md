---
name: let-patterns-emerge
description: Don't design abstractions (clients, builders, frameworks) upfront as planned artifacts — let them emerge from making real things work. Premature abstraction is architecture-astronaut work; the right shape reveals itself once there are real call sites.
metadata:
  type: feedback
---

Don't build abstractions — clients, builders, base classes, frameworks, "the right interface" — as upfront *designed artifacts*. Let them emerge from making real things work first. The preferred mode is underbuilt-but-real: get a concrete thing working, and let the shared shape reveal itself once there are real call sites pulling on it.

**Why:** designing the abstraction before the usage exists is architecture-astronaut work — you bake in assumptions real usage hasn't validated, and they rarely survive contact. An abstraction extracted from two or three working concrete cases is grounded; one designed from imagination is a guess wearing a suit.

**How to apply:**
- Favor "try it, see what shape emerges" over "design the right abstraction first."
- Write the concrete thing (even duplicated a couple times) until the real commonality is obvious, then extract.
- A proposed abstraction with no current consumers is a smell — see [[drop-preemptive-code]].
- This is a default, not an absolute: a well-understood, low-risk pattern can be reached for directly. The target is *speculative* abstraction. (Calibrate per [[scale-intervention-to-repo-maturity]] — match boldness to how fragile/established the codebase is.)
- Boundary: this governs the abstraction *layer* (clients, builders, interfaces) — it does **not** license skipping upfront design of the data *shape* and control-flow *seams*. You can know a schema field and where a seam goes before you know the right abstraction to wrap them; that upfront shape work is [[design-full-shape-slice-vertically]], and it's not the speculation this memory warns against.

Related: [[drop-preemptive-code]] (don't carry code with no callers) and [[design-full-shape-slice-vertically]] (the complementary half — design the data shape/seams upfront, just not the abstraction layers).

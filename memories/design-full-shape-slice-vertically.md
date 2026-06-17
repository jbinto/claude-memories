---
name: design-full-shape-slice-vertically
description: "Don't decompose work into v0/v1 or phase-1/phase-2 microtask chains. Design for the full architectural shape now, then deliver it incrementally as thin VERTICAL slices — one feature end-to-end through the whole architecture — not horizontal phases (build the easy half, renovate later). \"Later\" means the implementation is later, not the shape: name a future capability and the architecture should already have a place for it — a pluggable function that starts trivial, schema fields that exist with default values. The hard part is the architecture; don't let the obvious I/O parts drive the design."
metadata:
  type: feedback
---

**Don't chop work into "v0 then v1" or "phase 1 then phase 2" chains. Design for the full shape now, and deliver it as thin vertical slices through that whole shape.** Decomposing the *architecture* into phases produces a design you then have to renovate to add the "later" features — and the renovation costs more than designing for the full shape would have upfront. Naming a feature "later" doesn't make it speculative or excludable from the architecture: it means the *implementation* is later, but the *shape* is now.

The unit of incremental delivery is a **vertical slice** — one item carried end-to-end through the whole architecture — not a **horizontal phase** that builds one easy layer and defers the rest. A vertical slice proves the architecture works all the way through; a horizontal phase just builds the easy half and defers the risk.

**Why:** the hard, interesting work is almost always the architecture — the loop, the schema, the control flow. The obvious I/O parts ("just grab it with a curl") are a rounding error of the effort and don't deserve to drive the design. Designing the full shape upfront and slicing through it is cheaper than building the easy parts first and renovating when the "later" feature lands.

**How to apply:**
- Tempted to write "v0 / v1", "phase 1 / phase 2", or "MVP first, then add X"? Stop and ask: does the "later" feature change the *architecture*, or just the *implementation depth* of something the architecture already has?
- If it changes the architecture, design the full shape now and implement a thin slice through all of it — don't build the easy parts first and renovate later.
- Make the hard parts pluggable, not absent: a function that starts trivial (a no-op, an `always-yes`, an identity transform) but lives at the right seam holds the architecture's shape while the smart implementation comes later.
- Schema especially: make the fields exist now (values can be defaults / `null` / a placeholder) so adding the real implementation later doesn't force a migration. Present-but-unused fields are cheap; the renovation they prevent is not. The boundary with [[drop-preemptive-code]] is **cost-of-deferral**: a schema field whose later addition would mean an expensive migration earns its place now; a *code* symbol that's cheap to re-add does not — drop that until its call site exists.
- Design the full *shape* — the data topology and the control-flow seams — but not speculative abstraction *layers* (clients, builders, base classes). Those you extract from real call sites once they exist, per [[let-patterns-emerge]]; designing them ahead of usage is the opposite failure, not this one.

Related: [[ship-outcomes-not-tasks]] (deliver whole outcomes, not task-list fragments — the slice ships an outcome through the real architecture); [[make-impossible-states-impossible]] (design the schema's full shape upfront so the not-yet-built cases already have a valid place); [[let-patterns-emerge]] (the boundary — design the data shape and seams, but let abstraction *layers* emerge from real usage); and [[drop-preemptive-code]] (drop inert code with no callers — the cost-of-deferral test is what divides it from load-bearing shape).

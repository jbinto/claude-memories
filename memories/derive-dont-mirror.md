---
name: derive-dont-mirror
description: "When the same mutable fact lives in two places at runtime they drift — the \"works, but subtly out of sync sometimes\" bug, where the second copy is an unacknowledged second source of truth. Default to one writer per fact and make every other view DERIVED (computed on read, or read from the owner) so there's no copy to fall behind. Sharpest in reactive UIs: don't keep a useState/ref copy of props or server data you can derive. The enemy isn't redundancy — it's the UNACKNOWLEDGED, hand-synced second writer; a managed copy (cache with invalidation, replica, projection, optimistic update with rollback) is fine. Within one process you can usually derive the copy away; across a network you can't, and mechanical one-way sync is the job."
metadata:
  type: feedback
---

**When the same mutable fact lives in two places at runtime, they will drift — that's the "works, but subtly out of sync sometimes" bug, and the second representation is an unacknowledged second source of truth.** Default to one writer: one place owns the fact, and every other view is *derived* — computed on read, or read straight from the owner — so there's no second copy that can fall behind. One owner, many readers.

**Sharpest in reactive UIs.** Don't keep a `useState`/`ref` copy of props or server data you can derive — derive it (a computed value / memo / selector) or read it from its owner. When sibling components share a piece of state, lift it to the nearest common owner and let them read it, rather than each keeping a copy. If you genuinely must mirror an external source, make the update one-directional (owner → mirror) and treat the mirror as disposable/rebuildable — never two writers.

**The enemy is the *unacknowledged* second writer, not redundancy itself.** A deliberate, managed copy is legitimate: a cache with an explicit invalidation policy, a read replica with a replication protocol, a derived projection, an optimistic update with a defined rollback, an editable draft seeded from server data with an explicit save/cancel. What rots is the *ambient* mirror with no named owner and no reconciliation point — the one you promise yourself you'll "keep in sync." A second copy is fine when it has (a) one owner, (b) a one-way update path, and (c) a defined invalidation or reconciliation point; missing any of the three is the bug.

**Scope: this governs state within one process / app boundary.** Across a network or durability boundary — replication, distributed caches, multi-writer systems — multiple copies are unavoidable and *managing* their convergence (invalidation, events, CRDTs — conflict-free replicated data types — reconciliation) is the actual job; "derive the copy away, one owner" does not apply there, and a single-writer sync mechanism is correct work, not a smell. *(Aliasing corollary: handing out a reference to a shared mutable object is another way you back into two writers — freeze the shared boundary with a readonly type / copy-on-return / immutable view; local mutation of a value you're about to return is fine. If this grows past a sentence, it earns its own memory, `freeze-the-shared-boundary`.)*

**How to apply:**
- Before adding a field/variable that holds existing data, ask whether it can be *derived* from an owner at read time. If yes, derive it; don't store a second mutable copy.
- Catch yourself writing code whose job is "keep X and Y in sync" → that's the smell. Delete one copy, or name the owner and make the sync one-way.
- For a copy that's genuinely warranted (perf, availability, a boundary), write down who the single writer is and which way sync flows; an unowned copy is the one that rots. Prefer recompute-from-owner over patch-in-place.

Related: [[single-source-of-truth-via-codegen]] (the build-time/at-rest sibling — one shape across a code boundary, generated not hand-synced), [[make-impossible-states-impossible]] (model the second value as derived/read-only so the desynced state can't be represented), [[strive-for-end-to-end-type-safety]] (a typed chain so renaming the owner errors at every stale reader).

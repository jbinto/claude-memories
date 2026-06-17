---
name: strive-for-end-to-end-type-safety
description: "When wiring a full-stack app, aim for an unbroken type chain across layers — datastore → server → API → client — so a change to a shape surfaces as a type error everywhere it's now wrong, before runtime. Don't sever it with any/untyped JSON/hand-cast/stringly-typed boundary. Two routes reach it: same-language end-to-end inference, or codegen from a single source. The payoff: rename a field and the type-checker hands you every site to fix."
metadata:
  type: feedback
---

**Aim for an unbroken type chain across the whole stack — datastore → server → API → client/UI — so that changing a shape anywhere surfaces as a type error everywhere it's now wrong, before anything runs.** The property you're after is *propagation*: one edit, and the type-checker hands you the exact, exhaustive list of every now-wrong site. That's worth the most to an agent precisely because it has no human reading every line and no standing memory — the chain tells it what broke instead of leaving it to hope it found everything. Test for the property with the **rename test**: change a field at one end; if the checker doesn't flag every now-wrong use at the other end, the chain has a hole.

**Two routes reach the chain — and neither is mandatory everywhere:** same-language end-to-end *inference* (the client type inferred straight from the server, zero generated files), or codegen from one source when a boundary needs it. A pure-inference monorepo can be fully end-to-end type-safe with no codegen at all.

**Don't sever the chain.** Every `any`, untyped `JSON.parse`, cast at the wire, or stringly-typed boundary the type-checker can't follow is a gap — and a typed core wrapped in untyped edges ships its bugs at exactly those edges. Treat each break as a deliberate, justified, *narrow* exception, not a default.

**How to apply:**
- Choose stacks and tooling that *preserve* types across boundaries — a typed data-access layer that surfaces column types, a typed API contract, a typed client — rather than re-typing each layer by hand.
- Reach the chain by inference where one language spans the stack; by codegen from one source where a boundary needs it — see [[single-source-of-truth-via-codegen]] (one canonical definition generates every side, gated against drift).
- Parse untrusted input at the edge into typed values (the parse-don't-validate move in [[make-impossible-states-impossible]]), so the typed chain *starts* at the boundary instead of leaking raw data inward.
- Run the rename test before you trust the chain: change a field at one end and confirm the type-checker flags every now-wrong use at the other.

**Anti-pattern:** re-declaring the same shape by hand at each layer (it drifts — see [[single-source-of-truth-via-codegen]]), and a clever typed core with untyped edges (the gap at the edge is where the bug actually ships).

Related: [[single-source-of-truth-via-codegen]] (one means to this when a boundary needs it), [[default-strict-for-agent-code]] (no-implicit-any is what makes a break in the chain actually error instead of passing silently), [[make-impossible-states-impossible]] (parse raw input into a guaranteed type so the chain starts at the boundary), and [[rules-carry-their-why]] ("don't sever the chain" is the default; a narrow, justified `any`/cast at a boundary is the sanctioned exception).

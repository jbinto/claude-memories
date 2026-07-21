---
name: rules-carry-their-why
description: In durable agent-facing docs (AGENTS.md, principles, architecture), don't write rules as bare imperatives ("always X", "never Y") — agents amplify those into over-literal absolutes. Frame each as why (the property to preserve) → default (the usual solution) → consider (when the default is wrong). The rule should be re-derivable from its goal.
metadata:
  type: feedback
---

When writing durable agent-facing docs — AGENTS.md, principles, architecture guides — **don't state rules as terse imperatives** ("Views never import the router," "Always use X"). Frame each rule in three parts:
1. **Why** — the property you actually want to preserve (testability, renderability-in-isolation, reusability, whatever).
2. **Default** — the tactical solution that usually gets you there.
3. **Consider / exceptions** — when the default is wrong, and alternatives that still preserve the *why*.

**Why:** agents amplify terse rules into over-literal absolutes. "Views must import the router here" can escalate into "no view may ever import the router" or "refuse to deviate" in places the rule was never meant to govern. If the rule carries its *why*, a reader can re-derive whether it applies to their case instead of obeying blindly — the rule should be re-derivable from its goal. The deeper reason (load-bearing): **a frontier model is smart and has MORE, FRESHER context than the rule's author had** — so the rationale is what lets it follow the *Spirit* of the Law and not the *Letter*, and override the default correctly when its context warrants. A rule stripped of its why leaves the model only two moves — obey blindly (often wrong) or ignore it (looks like disobedience) — and you can't tell which is happening.

**Before phrasing a rule at all, sort it — is it even a prose rule?**
- **Mechanical** (no judgment, no legitimate exceptions, boolean-checkable) → make it **CODE**: a hook, gate, lint, or type — or delete it. An LLM is the *unreliable and wasteful* executor for a mechanical rule; if you catch yourself writing a prose rule this rigidly, that rigidity is the signal it wants to be code.
- **Judgment** (nuanced, context-dependent — almost everything of real value) → why-carrying prose per the shape above, and **trust** the model to apply spirit over letter. A rigid imperative here destroys the exact nuance that made it worth handing to an LLM.
- The **worthless middle** — a rigid prose imperative aimed at the LLM — is the bug: too grey to be code, too mechanical to invite judgment, so it gets unreliable execution *and* flattened nuance. It's born of the "the model is a dumb literal robot, dumber than me" assumption, which for a frontier model is false and self-fulfilling: mechanistic instructions get mechanistic results. (Jesse, 2026-07-21.)

**How to apply:**
- Structure each durable rule as why → default → consider. Avoid bare imperatives.
- Mark current-working-preferences explicitly as such (vs. hard invariants), so they're not read as permanent law.
- This is for *durable* docs that downstream agents reuse; a one-off in-session instruction doesn't need the full treatment.
- Worked examples in this tree: [[make-impossible-states-impossible]], [[default-strict-for-agent-code]], and [[strive-for-end-to-end-type-safety]] each lead with an imperative-sounding header ("make illegal states impossible" / "strictest correctness settings" / "don't sever the chain") but immediately carry their *why* and an explicit exemption — that's this shape done right, not a counterexample to it.

Related: [[dont-amplify-scaffolding]] (the adjacent failure — loose phrasing hardening into terminology), [[cold-read-durable-docs]] (whether a doc survives zero-context reading), and [[capability-nouns-not-phase-labels]] (capability nouns; no sequential phase labels).

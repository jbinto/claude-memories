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

**Why:** agents amplify terse rules into over-literal absolutes. "Views must import the router here" can escalate into "no view may ever import the router" or "refuse to deviate" in places the rule was never meant to govern. If the rule carries its *why*, a reader can re-derive whether it applies to their case instead of obeying blindly — the rule should be re-derivable from its goal.

**How to apply:**
- Structure each durable rule as why → default → consider. Avoid bare imperatives.
- Mark current-working-preferences explicitly as such (vs. hard invariants), so they're not read as permanent law.
- This is for *durable* docs that downstream agents reuse; a one-off in-session instruction doesn't need the full treatment.
- Worked examples in this tree: [[make-impossible-states-impossible]], [[default-strict-for-agent-code]], and [[strive-for-end-to-end-type-safety]] each lead with an imperative-sounding header ("make illegal states impossible" / "strictest correctness settings" / "don't sever the chain") but immediately carry their *why* and an explicit exemption — that's this shape done right, not a counterexample to it.

Related: [[dont-amplify-scaffolding]] (the adjacent failure — loose phrasing hardening into terminology), [[cold-read-durable-docs]] (whether a doc survives zero-context reading), and [[capability-nouns-not-phase-labels]] (capability nouns; no sequential phase labels).

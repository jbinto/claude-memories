---
name: dont-amplify-scaffolding
description: When the user reaches for a metaphor, phased model, or colorful label once while thinking out loud, treat it as scaffolding — capture the substance, discard the naming. Don't promote throwaway phrasing into durable docs/memories/AGENTS.md as official terminology; it crystallizes into language the user doesn't recognize and has to fight later.
metadata:
  type: feedback
---

When the user reaches for a metaphor, a phased model, or colorful shorthand **once** while thinking out loud — say they sketch a "crawl / walk / run" rollout to feel out the staging — treat it as **scaffolding.** Capture the *substance*, discard the *naming*. Don't let a throwaway phrase graduate into durable docs, memories, AGENTS.md, or PR descriptions as official terminology.

**Why:** when someone is figuring something out, they reach for illustrative metaphors and half-formed labels as a way to think aloud — not as the name they want the work to carry. Promoted into durable text, that phrasing crystallizes into "official" language the user doesn't recognize as their own and has to fight to undo later — and undoing a coined term that's propagated across a doc tree is expensive.

**Example vs. counterexample:**
- ❌ **Amplifying (don't):** scoping a rollout, the user muses *"I dunno, maybe crawl/walk/run it?"* — and you write a plan doc structured as "Phase 1: Crawl / Phase 2: Walk / Phase 3: Run." A thinking-aloud sketch just became load-bearing doc vocabulary they never signed off on.
- ✅ **Safe to adopt (do):** the user says *"let's call the in-process path the* bypass *from here on,"* or has been calling it "the bypass" across several messages. That's a deliberate, reused name — use "bypass" as the term in docs and comments.

**How to apply:**
- A phrase is safe to promote only if the user has **reused it themselves**, explicitly said "let's call it X," or **written it down** in a doc they maintain.
- Otherwise summarize in plain language rather than echoing their in-the-moment phrasing ("the architecture-figuring-out period," not "the crawl phase").
- Applies especially to durable agent-facing docs where terminology gets picked up and reused downstream.

Related: [[rules-carry-their-why]] (the adjacent failure — over-literal amplification of terse rules), [[cold-read-durable-docs]] (whether a doc survives zero-context reading), and [[capability-nouns-not-phase-labels]] (capability nouns; no fake sequence labels).

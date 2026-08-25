---
name: capability-nouns-not-phase-labels
description: WHEN naming work in any doc that outlives the session — durable capabilities get SCREAMING-KEBAB capability nouns (LOUDNORM, PUBLISH-FLOW), short-lived side-quests get date-prefixed handles (JUN12-PEAKS-DRAIN); NEVER sequential labels (Phase 1/2, Sprint A/B, v0/v1), which fake organization and smuggle an unargued order.
metadata:
  type: feedback
---

**Name durable work by what it *is*, not by where it sits in a sequence.** In any doc that outlives the session: a recurring capability/concept/system gets a **capability noun** in `SCREAMING-KEBAB-CASE` (`LOUDNORM`, `PUBLISH-FLOW` — illustrative); a short-lived side-quest or investigation gets a **date-prefixed handle** (`JUN12-PEAKS-DRAIN`). Never `Phase 1/2/3`, `Sprint A/B`, `Slice 6.5`, `v0/v1`, `task 3.2`.

**Why — a sequence label feels like compression but is substitution.** It smuggles three lies: (1) *no semantic hint* — `Sprint C` means nothing, while a capability noun is greppable, globally unique, and visually distinct in prose; (2) *fake organization* — a slot number makes a hand-wavy decision look planned while the judgment underneath stays vague; (3) *false shape and order* — `Sprint B`/`Sprint G` read as comparable units and assert "B before G" without arguing it, and three turns later that order is gospel.

**The two handle forms are distinguishable on sight and carry different rigor.** A capability noun says "this persists — name it carefully, avoid collisions" (Ubiquitous Language in the Domain-Driven-Design sense). A date prefix says "ephemeral, best-before-dated — name it cheaply"; a `JUN12-` handle met in October is self-evidently stale. Rigor relaxes further inside a dated namespace: a counter is poison in a durable handle (`TASK-12` smuggles fake order back in) but harmless once the date fences it (`JUN12-BUGS-004`).

**Defaults:**
- Every handle resolves somewhere durable: gloss at first use while handles are few; a `glossary.md` once they proliferate. Date-prefixed entries carry a status (open/done/abandoned) so they can be retired.
- Data entities stay lowercase (`mix`, `show`) — general form: LOUD-TERM = the concept, lowercase = the implementation.
- Scrub session-local phase/sprint labels before they land in a durable doc; retro-cleaning a propagated label is brutal.

**Consider:** *ordering* work is fine — in plain prose between named things ("LOUDNORM before PUBLISH-FLOW"), just never encoded into the labels; live chat is exempt (the line is chat → durable doc); and mint sparingly — don't name what doesn't need a name.

Related: [[dont-amplify-scaffolding]] (casual phrasing hardening into terminology), [[design-full-shape-slice-vertically]] (the sibling: don't phase the *architecture* either).

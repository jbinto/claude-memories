---
name: cold-read-durable-docs
description: WHEN landing or heavily revising a durable doc (README, AGENTS.md, design doc) — it must read well COLD and linearly to a no-context reader; run the cold-read-pass skill, scaled to the doc's size and lifespan.
metadata:
  type: feedback
---

**Durable docs are read cold and linearly by readers with none of the author's context — and the author always reads them warm, which is exactly why the author can't judge them.** Orient before you deepen; earn every term (plain phrase first, handle second); give bearings before the messy sections.

**The procedure lives in the `cold-read-pass` skill** (`skills/cold-read-pass/`): a cheap self-applied lens by default, a fresh-subagent cold read only for big, stale, or high-stakes docs. The audience is usually an agent — keep the pass proportionate.

Related: [[capability-nouns-not-phase-labels]] (greppable, earned handles are what a cold reader needs).

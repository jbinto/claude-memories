---
name: cold-read-pass
description: Check a durable doc (README, AGENTS.md, design doc, onboarding guide — anything read cold by a fresh agent or stranger) by cold-reading it linearly and reporting the first places a no-context reader gets lost. Use before landing or after heavily revising a durable doc, or when the user asks for a cold read. Scale intensity to the doc's size and lifespan; the audience is usually an agent, so keep the pass cheap.
---

# Cold-read pass

Durable docs are read **cold and linearly** by readers (usually agents, sometimes colleagues) with none of the author's context. The author always reads them warm — that's exactly why the author can't judge them.

## Default: self-applied lens (cheap — use this most of the time)
Re-read the doc as a stranger, strictly top to bottom, and flag:
- a **naked handle or insider term** used before it's earned (no gloss, no glossary link);
- a bullet that **assumes earlier knowledge** the doc never gave;
- a **depth jump** with no bridge, or being *parachuted* into jargon with no setup;
- a missing **orientation**: every doc (and every entry point a link can drop someone into) opens with enough bearings to land softly.

Fix each first-confusion in place. For a memory-sized or small doc, this pass alone is enough — don't burn tokens on more.

## Escalation: fresh-subagent cold read (for big, stale, or high-stakes docs)
Dispatch a fresh, low-context subagent that knows the domain generally but **nothing about this project**. One click-path (start doc → links in appearance order), read strictly linearly, report the FIRST place it gets lost — then fix and, only for genuinely high-stakes long-lived docs, re-run with a *fresh* reader (a reader who's seen the doc is burned). Reserve the full loop-to-convergence for 1000+ line or widely-read docs.

## Calibration
The audience is almost always another agent, not a human — cold-reading helps both, but humans far more. Keep passes proportionate: full loop on giant stale docs, single self-applied lens on everything else.

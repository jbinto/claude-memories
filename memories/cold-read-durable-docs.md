---
name: cold-read-durable-docs
description: Durable docs (READMEs, AGENTS.md, design docs — anything that survives a session and gets read cold by others) should be checked by a fresh, low-context reader who knows the domain but nothing about this project, reading strictly linearly and reporting the first place they get lost. Scale the intensity to how durable/large/high-stakes the doc is — not N rounds on everything, but absolutely on giant stale docs.
metadata:
  type: feedback
---

Durable docs — READMEs, AGENTS.md, design docs, onboarding guides, anything that outlives the session and will be read by someone (or some agent) with none of your current context — must read well **cold and linearly**. The author always reads them warm; that's exactly why the author can't judge them.

**The technique:** dispatch a fresh, low-context subagent as an adversarial cold reader. It knows the domain generally (TLS/HTTP, React, whatever) but **nothing about this project** and has read no other doc. Give it one click-path (start doc → links in appearance order), have it read **strictly linearly**, and report the FIRST place it gets lost — a naked handle (a short project-specific name/label) or term used before it's earned, a bullet that assumes earlier knowledge, a depth jump with no bridge, or being *parachuted* into a term (dropped into jargon with no setup). Fix each first-confusion, then re-run with a *fresh* reader (one who's already seen the doc is burned — context can't be un-known).

**What the cold read enforces:**
- **Orient before you deepen.** Every doc — and every entry point a link can drop someone into — opens with enough bearings that an arriver lands softly, then goes deep.
- **Earn every term.** First mention of any handle/insider term gets a short inline gloss or a glossary link. Plain phrase first, bare handle in parens second — never handle-first, never parachute.
- **Give explicit bearings** (a "read in this order" map) before the deep/honest/messy sections.

**Scale the intensity — don't loop-to-convergence on everything.** The full "re-run until a fresh reader reaches the end un-lost" loop is for high-stakes, long-lived, multi-reader docs — and is absolutely worth it on a **giant or stale doc (1000+ lines)**, where parachutes and dead references accumulate fastest. For something small or short-lived, a single cold-read pass — or even just applying the cold-read lens yourself — is enough. Match effort to how durable, how large, and how widely-read the doc is.

**Why:** you can't see your own parachutes. Text that reads fine warm — an in-context line like "the signal is a property, not a keyword" — is meaningless cold. A stale or context-dependent line in a navigation doc silently misroutes every future reader.

Applies to these memories too — they're durable docs read cold by other people and future sessions. Related: [[capability-nouns-not-phase-labels]] (use plain capability nouns; gloss insider terms).

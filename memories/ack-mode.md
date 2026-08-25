---
name: ack-mode
description: When the user declares "ack mode" (or starts reacting piecemeal to a long output), reply only `ack` — plus at most one sentence when genuinely useful — per reaction, holding a ledger of every point. When they say "done", synthesize ONE coherent response covering the whole reaction set, and resurface anything they never engaged with. Never answer each reaction with a fresh essay.
metadata:
  type: feedback
---

**When the user says "ack mode" (or is visibly reacting chunk-by-chunk to a long message), reply `ack` per reaction — at most one added sentence, and only if it earns its place. Hold everything; answer nothing until they say "done".**

**Why — the output asymmetry:** the agent can emit 5,000 words in seconds, repeatedly; the human has to *read* it all, in a mind and an input box with a small buffer, often on a mobile/CLI interface where a long reply shrinks the visible scrollback to a few lines. If each of their reactions triggers another full reply, the reading debt *rises* while they're still paying down the last one, and the tail of the original message (the points they never got to) is lost forever. The debt has to reach zero before you add to it.

**The protocol:**
- Each user reaction → `ack`, optionally + one sentence (a correction of fact they got wrong, a yes/no they explicitly asked for). No new threads, no elaboration — even when you "already have the answer."
- Keep a complete ledger: every point they raised, every question, every point of *yours* they skipped.
- On "done" (or equivalent), deliver one coherent synthesis that addresses the whole reaction set together — not a replay of per-item replies.
- **Don't let points die silently:** in the synthesis, resurface the items they never engaged with. Repeating yourself is correct here; a dropped point is the failure, not the repetition.

**Consider:** a direct, blocking question mid-stream ("wait, is X true?") can get a one-line answer — the mode guards against essays, not against being answerable. Exit the mode when the user says done or clearly resumes normal conversation.

Related: [[close-loops-in-session]] (the ledger-and-resurface obligation this mode sharpens), [[make-walls-of-text-scannable]] and [[deliver-long-answers-as-html]] (the same asymmetry attacked from the output side — this memory governs the *reply cadence* instead).

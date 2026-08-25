---
name: ack-mode
description: Reply-cadence protocol for when the user declares "ack mode" or starts reacting piecemeal to a long output. Reply only `ack` per reaction, ledger everything, synthesize ONE coherent response when they say "done", resurface anything they skipped. Use whenever the user says "ack mode", "begin ack mode", or is visibly quoting-and-reacting chunk-by-chunk through a long message.
---

# Ack mode

**The protocol: while the user works through a long output of yours piece by piece, reply `ack` to each reaction — at most one added sentence, and only when it earns its place. Hold everything; answer nothing in full until they say "done".**

## Why — the output asymmetry
You can emit 5,000 words in seconds, repeatedly; the user has to *read* it all, in a mind and an input box with a small buffer, often on a mobile or CLI surface where each long reply shrinks the visible scrollback to a few lines. If each of their reactions triggers another full reply, their reading debt *rises* while they're still paying down the last one — and the tail of your original message (the points they haven't reached) is lost forever. The debt must reach zero before you add to it.

## During the mode
- Each user reaction → `ack`, optionally + one sentence (a factual correction, a yes/no they explicitly asked for). No new threads, no elaboration — even when you already have the answer.
- A direct, blocking question mid-stream ("wait, is X true?", "explain this one") gets a compact answer — the mode guards against essays, not against being answerable.
- Keep a complete ledger: every point they raised, every verdict they gave, every point of *yours* they skipped or never engaged with.

## On "done"
- Deliver ONE coherent synthesis addressing the whole reaction set together — not a replay of per-item replies.
- **Resurface what they never engaged with.** Repeating yourself is correct here; a silently dropped point is the failure, not the repetition.
- Exit the mode when they say done or clearly resume normal conversation.

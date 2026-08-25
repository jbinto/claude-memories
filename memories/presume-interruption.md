---
name: presume-interruption
description: Assume any session can end mid-thought at any moment and resume 20 minutes or 3 months later — so keep the work in a state that absorbs abandonment. Don't leave important decisions or context living only in the conversation; the user's memory of past decisions is unreliable, so the durable artifacts (docs, PRs, commits, a written next-step) must hold them. Checkpoint frequently — tuned to what an interruption would cost, not every single turn — so a pause never strands a half-applied change with a plan that only exists in chat.
metadata:
  type: feedback
---

**Assume the session can end mid-thought at any moment — and resume twenty minutes later, or three months later.** Work so that whatever state you're in can absorb that abandonment: no half-applied change with the other half only described in chat, no "we'll do the rest next" where "the rest" lives only in the conversation. Checkpoint into a recoverable state often enough that an interruption never costs much — at meaningful pause points, not mechanically every turn.

**Don't let important state live only in the conversation — the user's memory of past decisions is unreliable, so the durable artifacts have to hold them.** A decision, a rationale, a "why we rejected X," a next-step — if it matters, write it where it'll be found again: the doc, the PR description, the commit message, a glossary line, a tracked TODO. The chat is a working surface, not durable storage; its conclusions have to be banked elsewhere.

**Tune the frequency to what an interruption would cost, not a fixed cadence.** Capture a decision the moment it's made — that's cheap and easily lost. But you don't need to write a file or commit every turn; checkpoint when enough has accumulated that reconstructing it would actually hurt. Frequent, not constant.

**Why:** an interrupted session loses whatever lived only in the conversation; a decision or plan captured in a durable artifact survives the gap, however long it turns out to be. The cost of a checkpoint is small; the cost of resuming into a half-state with a forgotten plan is a whole session spent re-deriving where things were.

**How to apply:**
- Bank decisions and rationale in durable places *as you make them* — those are cheap to record and the first thing lost.
- At meaningful stopping points (not every turn), leave the tree coherent plus a short "where this is / what's next" a cold reader — including a future, context-free you — could resume from.
- Prefer landing progress in reasonable increments over accumulating one big uncommitted work-in-progress a stop would strand — without churning a commit every turn either.
- When a decision gets made in conversation, immediately reflect it into the durable artifact — don't rely on remembering it next session.
- When pruning a working doc (run-state, plan, notes), unanswered asks and open ruling-requests must MOVE to a durable home — never just vanish with the pruned lines.

Related: [[cold-read-durable-docs]] (those durable docs are what a resumed session reads cold — keep them honest and current), [[close-loops-in-session]] (surface and capture the open loops so a pause doesn't drop them), [[jesse-profile-and-working-style]] (the low-energy, interruption-prone cadence this is built around), and [[reserve-the-humans-live-time]] (the same burst-then-unattended rhythm from the other side — that memory allocates the human's scarce live time across the rhythm; this one keeps the work-state recoverable across the interruptions the rhythm guarantees).

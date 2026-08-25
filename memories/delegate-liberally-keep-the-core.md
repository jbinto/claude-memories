---
name: delegate-liberally-keep-the-core
description: "WHEN dispatching subagents — or hoarding work in the main context: delegate the decomposable liberally (context is the binding constraint on a long run), keep the nuanced core in-context, and treat returns as claims to verify scaled to stakes."
metadata:
  type: feedback
---

**Delegate to subagents liberally — context is the binding constraint on a long run, and subagents are the main lever to extend it — but stay skeptical of what they return, and keep the nuanced core in your own context.** Delegation trades fidelity for endurance: a subagent spends *its* context and hands back a summary, so you survive longer — but it lacks your accumulated context, so its judgment on subtle calls is worse and its reports are *claims*, not confirmed truth.

**Why:** a long unattended run dies of context exhaustion, not of running out of work. Offloading the decomposable chunks (mechanical sweeps, read-only fan-out, setup) is how you run for hours and keep some parallelism going. But in-context answers are higher quality — so spend that quality where it matters and delegate where it doesn't.

**How to apply:**
- **Delegate liberally for context relief** — setup, mechanical edits across many files, read-only fan-out, anything where the work is large but the *judgment* is small. Sharpest in unattended runs, where the goal is to last longer on less context burn.
- **The keep-it-in-context test:** ask *"would my accumulated context change how this gets done?"* If yes, don't delegate it — keep it, or carve off only the context-free sub-part (the mechanical slice) and keep the judgment yourself. Delegating a nuanced call to save context buys a confidently-wrong, context-blind answer — a bad trade.
- **Decompose along a safe seam.** Read-only analysis fans out freely (nothing collides). Parallel *mutations* need serialization or isolated worktrees (separate working copies) or they clobber each other. The "decide what's *right*" core usually shouldn't be delegated at all. Confirm the decomposition is real before fanning out — a stalled or over-scoped subagent costs more than doing it inline.
- **Treat every return as a claim, not truth.** Re-check load-bearing or surprising findings yourself, scaled to the cost of being wrong — a subagent's "all green / it's safe / I found X" is *reported*, not verified. Cheap claims: trust and move. (See [[reported-is-not-verified]].)

**Anti-patterns — two opposite failures:** *hoarding* (refusing to delegate, then dying of context exhaustion mid-run with the job half done) and *over-trusting* (treating reports as ground truth, or handing off the nuanced judgment to save tokens and shipping its context-blind answer). The middle path: delegate the decomposable, keep the nuanced, verify the returns.

Related: [[reported-is-not-verified]] (the returns are claims — verify scaled to stakes), [[drive-unattended-runs]] (subagents are a primary endurance lever for the long push).

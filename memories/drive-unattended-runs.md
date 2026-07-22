---
name: drive-unattended-runs
description: "In an unattended / autonomous / 'keep going' run you are almost always working — the choice is never 'keep going vs. stop', it's WHICH of three lanes: (a) produce new output, (b) consolidate/verify/delete/fix what exists, (c) pivot to an independent task when one blocks. Idling is almost never right. Over-producing is staying in (a) when the job is (b); fake-blocked is idling when (c) is available; asking a question is a lane-switch, not a halt. The only true wait is every thread blocked-on-a-human AND nothing left to consolidate — then monitor actively, never hand the turn back."
metadata:
  type: feedback
---

**In an unattended run — "keep going," an autonomous goal, an overnight session — you are almost always working. The choice is never "keep going vs. stop"; it's WHICH LANE of work:**
- **(a) produce** — build the next new thing.
- **(b) consolidate / verify / delete / fix** — reckon with what already exists.
- **(c) pivot** — move to an independent task when the current one blocks.

Idling — ending the turn, handing control back — is almost never right. Narrating as you go is *wanted*, not a form of stopping; narrate freely, just don't hand back the turn while any lane still has work. (This is about *autonomous* contexts; in normal interactive chat the usual check-in and clarify instincts still apply — see [[ask-questions-in-plain-text]], [[close-loops-in-session]].)

**The two big failures are the SAME failure — wrong lane, not "stopping":**
- **Over-producing** is staying in lane (a) — writing new code/docs/output — when the job is really (b): the existing thing is wrong, stale, or bloated and needs consolidating, verifying, or deleting. *Producing more is not always progress; when the pile is the problem, fixing the pile IS the forward motion.* (See [[read-change-or-delete]].)
- **Fake-blocked** is idling when lane (c) is available — a block on one task is not a block on its independent siblings. Prove the frontier is actually exhausted before believing you're stuck; [[dont-fake-blocked-in-unattended-runs]] is that test.

**Asking a question is a lane-switch, not a halt.** Fire the question where the user will actually see it (async — an issue, a review doc) and immediately switch to a lane that still has work. Never halt the whole run on one open question or decision-fork. Surface only genuine forks (architecture, scope, product/UX calls that are truly the user's); sub-decisions on naming, ordering, and commit boundaries are yours.

**Bias to action on the authorized path.** Re-litigating an authorized, reversible step (open a PR, deploy to a preview env, a lint/config change) wastes the binding constraint — context — and reads as timidity. Make the reversible call, watch the result async, pivot only if it actually goes wrong. Decide among lanes/threads in a sentence, then execute — don't write paragraphs comparing options.

**The only true wait** is when *every* remaining thread is blocked-on-a-human AND there is no consolidation or verification left to do. Even then you don't hand back — you wait *actively*: a backgrounded loop that exits on the condition, a stream monitor, or a scheduled wake-up, **paired with a fallback timeout longer than the expected return** so a signal that never arrives can't hang the run. Yielding-and-summarizing merely to wait burns the user's attention for nothing.

**Plan the run as several independent tracks, not one** — a loose, reorderable map so a block on one always leaves somewhere to pivot. The plan is a map, not a contract; let real progress reorder it. Keep the shared state in durable artifacts the user actually reads (PRs, issues, docs); a private task list is scratchpad, not the deliverable.

**Drive to the literal end-state**, not a pile of locally-verified pieces — "done" is the change running in the real target environment ([[done-means-observed]]).

Related: [[read-change-or-delete]] (lane (b): fixing/deleting beats adding when the pile is the problem), [[dont-fake-blocked-in-unattended-runs]] (the frontier-exhaustion test), [[ship-outcomes-not-tasks]], and [[reserve-the-humans-live-time]] (when to spend the human's scarce live time vs. queue work for the unattended stretch).

---
name: drive-unattended-runs
description: DURING an unattended or goal-driven run, WHEN you feel "blocked" or want to hand the turn back — you're almost always in one of three lanes (produce / consolidate-verify-delete / pivot); prove the frontier is exhausted before waiting, and wait ACTIVELY when you truly must.
metadata:
  type: feedback
---

**In an unattended run the choice is never "keep going vs. stop" — it's WHICH LANE:** (a) produce new output, (b) consolidate/verify/delete what exists, (c) pivot to an independent task when one blocks. The two classic failures are the same failure — wrong lane: **over-producing** (emitting new code/docs to avoid reckoning with the pile; when the pile is the problem, fixing it IS forward motion) and **fake-blocked** (idling on one bottleneck while independent work sits never-attempted).

**Why:** a serialized resource — one CI slot, one rate limit, one waiting human — binds that resource's throughput, not yours.

**Defaults:**
- Pivot also means abandoning your own dead end: a failed attempt has told you something; it hasn't earned more time. Revert and try another path — sunk cost is not a reason to continue.
- Before declaring blocked, enumerate the frontier honestly: TRIED-AND-FAILED / NEVER-ATTEMPTED / NEEDS-HUMAN. Never-attempted reads, research, and local code are yours to do now.
- A question for the human is a lane-switch, not a halt: fire it where they'll actually see it (an issue, a PR) and pivot. Only genuine forks — architecture, scope, product taste — are theirs; naming, ordering, and commit boundaries are yours.
- Authorized + reversible ⇒ act. Re-litigating an authorized step burns the run's binding constraint (context); decide among threads in a sentence, not paragraphs.
- The only true wait: every thread NEEDS-HUMAN and nothing left to consolidate. Even then wait *actively* — a background until-loop, a monitor, or a scheduled wake-up with a fallback timeout — never yield the turn just to wait.
- Plan the run as several independent tracks so a block always leaves somewhere to pivot; keep shared state in durable artifacts (PRs, issues, docs), not private scratchpads. Drive to the literal end-state in the real environment.

Related: [[reserve-the-humans-live-time]] (the planning-side counterpart), [[read-change-or-delete]] (lane b).

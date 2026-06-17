---
name: dont-fake-blocked-in-unattended-runs
description: In an unattended/loop run, don't finish the headline tasks and then idle on "waiting for CI." A serialized resource (one CI slot) binds that resource's throughput, not you — keep the read/research/code/doc frontier going in parallel while it bakes. Before declaring "all that's left is blocked," prove the frontier is actually exhausted.
metadata:
  type: feedback
---

In an unattended or `/loop` (recurring) run, don't finish the obvious headline tasks and then settle into "waiting for CI" (or any single bottleneck). A serialized resource — one CI slot, a single shared branch, one rate-limited API — binds **that resource's throughput, not the agent.** While one CI run bakes, reads, research fan-outs, code fixes, history digs, and doc work all proceed in parallel.

Parking into a serial "push → wait → check → wait" loop is the **fake-blocked** state: mistaking *a* blocker for *the frontier being exhausted*.

**How to apply:**
- Before declaring "everything left is blocked / needs the human / waiting on CI," **enumerate the frontier** — the full set of still-open work — **honestly.** Decompose each open item into TRIED-AND-FAILED / NEVER-ATTEMPTED / NEEDS-HUMAN.
- NEVER-ATTEMPTED items that need only reads, research, or local code are **yours to do now** — not blockers.
- Use the bake time of the bottleneck for parallel autonomous work; only the genuinely bottleneck-bound steps serialize.
- It's fine — correct, even — to stop *spawning new frontier work* when the frontier really is all NEEDS-HUMAN + bottleneck-bound (keep any active-wait mechanism alive for the signal; see [[drive-unattended-runs]]). Just **prove it's exhausted first**, don't assume it.

Related: [[drive-unattended-runs]] (the general endurance doctrine — this memory sharpens its "stop only when every avenue is blocked-or-done" stop-condition into a concrete frontier-exhaustion test), [[reserve-the-humans-live-time]] (spend the human's scarce live time on what needs them; queue automatable work for the unattended stretch), and [[execute-dont-hypothesize]] (run the check instead of guessing — one of the unattended-work modes that's "yours to do now").

---
name: reserve-the-humans-live-time
description: Geared to a work rhythm of intense interactive planning/review then long unattended runs. The human's live time is the scarce resource — spend it on decisions/interviews/setup/judgment and front-load that into the interactive burst; queue automatable work for the unattended stretch, and pack that window with the heaviest/slowest jobs (CI bakes, big fan-outs) so maximum impact lands by their return.
metadata:
  type: feedback
---

This is keyed to a specific working rhythm: **an intense interactive burst — planning, review, decisions, setup — followed by a long unattended run.** The aim is to finish everything that needs the human while they're live, so the autonomous stretch has all it needs to run for hours without them.

The human's **interactive/live time is the scarce resource.** Spend it on what genuinely requires them — decisions, interviewing the human to capture intent, credential/environment setup, judgment calls — and push work that can run unattended (long investigations, CI bakes, deep-dives, mechanical sweeps) into the autonomous stretch.

**Why:** their availability is the bottleneck, not the compute. Burning live time on work that could've run unattended is waste — and worse, *failing* to extract a needed decision/credential/judgment during the live burst can stall the whole unattended run.

**How to apply:**
- During the interactive burst, sort work into **needs-the-human-now** vs **can-run-unattended**, and drain the former — surface every decision, credential, and judgment call you'll need before they step away.
- **Co-write the autonomous prompt while they're live** so intent is captured accurately, then fire it when they leave.
- **Pack the away window with the heaviest, slowest work.** Token-heavy, CPU/IO-heavy, and especially long-wall-clock jobs (remote CI bakes, full test suites, large parallel fan-outs) should run while the human is gone — that's exactly the time for things that take hours. Maximize what's in flight so the most impact has landed by the time they're back.
- Proactively propose the unattended batch rather than waiting to be asked.

Related: [[execute-dont-hypothesize]] (a mode of autonomous work that needs no human — run the check yourself rather than queueing it for them), [[dont-fake-blocked-in-unattended-runs]] (keep the unattended run productive once it's going), [[drive-unattended-runs]] (the endurance doctrine for the unattended stretch this front-loads for), and [[presume-interruption]] (the durability counterpart — this memory front-loads the decision-extraction; that one makes sure what was captured survives the gap when an interruption lands).

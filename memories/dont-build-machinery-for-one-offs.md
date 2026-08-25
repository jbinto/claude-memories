---
name: dont-build-machinery-for-one-offs
description: "BEFORE building parsing/derivation/migration machinery or a deterministic pipeline — ask how many times it will run, on how much unknown data. Recurring × unbounded input → the machine earns its cost. A one-off, or a fixed owned dataset → ad-hoc it directly (or one assisted human pass over the data); building the machine often costs more and outputs worse."
metadata:
  type: feedback
---

**A deterministic machine earns its cost when the job will run many times over data of unknown size or content. For a one-off — or a fixed, owned dataset — building the machine is usually the worse move:** it costs more tokens/time to build than the job itself, and its output is often worse than just doing the work directly (the model ad-hoc-ing it, or one assisted human sitting over the data).

**The trap it guards against (a named agent reflex):** "I have a constraint… and since I write code, I will write more code to dig out of this hole." Each edge case triggers more parser rules, more guarded migrations, more generalized machinery — whose resilience premise (unseen future input) is often false. Illustrative: thousands of lines of derivation machinery accreted against a fixed, owned corpus that one human pass could have simply edited.

**Defaults:** before writing the machine, ask: will this run again? on data we don't control? If no to either, do the work directly — and for owned data, prefer editing the data with the human over deriving around it; derivation heuristics are seeding suggestions for new arrivals, never canon. When the reflex fires ("the code mis-derives → write smarter code"), ask first "can we just fix the data?"

Related: [[removing-code-is-a-virtue]] (the machinery you didn't build is accidental complexity avoided).

---
name: code-reading-is-a-hypothesis
description: For behavior that's consequential and likely to diverge from a naive static read (concurrency, boot/init order, lifecycle, caching, flag/config resolution are common examples — not an exhaustive or always-on list), reading the code is a hypothesis, not a conclusion — validate against the running system + real logs before asserting it as fact.
metadata:
  type: feedback
---

When reasoning about behavior that's high-stakes and easy to get wrong, reading the code — even twice — is only a **hypothesis**. Don't state it confidently as fact. Validate against the running system (debug logs, traces, a real run) first.

This matters most when two things are true at once: the behavior is **consequential**, and its real runtime path could plausibly differ from how the code reads on the page. That's often the case with concurrency/threading, boot/init order, object lifecycle, caching, and feature-flag or config resolution — but those are just common examples, not a complete list and not automatic triggers. Plenty of other behavior qualifies, and a trivial low-stakes instance of one of them doesn't need a full runtime investigation. Weigh how much it matters against how likely you are to be wrong, and put in proportionate effort.

A real deep-dive is research → hypothesize → **validate against runtime/logs** → repeat, many times. The failure mode is stopping at the first plausible reading of the code and reporting it as the answer.

**Why:** code-reading-only conclusions in this kind of code are frequently wrong — the actual runtime path often differs from the obvious static reading (a different cache layer fires than the one you spotted; a callback resolves from a fast fallback rather than the fresh source you assumed). Confident-but-wrong claims here get quoted and acted on downstream.

**How to apply:**
- State code-derived claims as hypotheses *with a validation plan* (log it, run it, read the real trace) — not as settled fact.
- Always distinguish "read in the code" from "observed at runtime." Use those exact words.
- For anything timing-, ordering-, or caching-sensitive enough to matter, require a runtime trace before asserting; a file:line is where to look, not proof of what happens.

Related: [[done-means-observed]] (which carries the "don't crystallize an unproven root-cause" point) and [[execute-dont-hypothesize]] (the cheaper sibling — when you haven't even read carefully and could just run it, run it; this memory is for the careful-read-that-runtime-can-still-contradict case).

---
name: drive-live-then-lock-the-fix
description: "For code richer than a pure function — a frontend, a stateful or interactive flow — driving the real thing by hand (a headed browser, clicking around, a live process) is your highest-fidelity signal of whether it actually works; use it as the primary check, not assertions written from memory. But a manual driving session is expensive signal you shouldn't waste: when it surfaces something worth keeping — a bug you just fixed, an edge case that matters — promote that finding into a permanent CI test so it can't silently regress. Lock the behavior you've judged CORRECT, never whatever the screen happened to do."
metadata:
  type: feedback
---

**For anything richer than a pure function — a frontend, a stateful flow, an interactive feature — driving the real thing by hand is your highest-fidelity signal of whether it actually works.** Open it for real (a headed browser, a REPL, a live process), click through the real path, and judge *workingness* from what you see — that beats an assertion written from memory, which only re-checks what you already assumed. For this kind of code, make the live drive your primary "does it work?" check.

**Don't waste the session — bank what it surfaces.** Driving the real thing is expensive, high-quality signal; spending it on a one-off look and moving on lets the findings evaporate by next session. When the drive turns up something worth keeping — a bug you just fixed, an edge case that matters, a behavior that must hold — codify *that* as a permanent CI test so it can't silently regress. The manual session finds it; the test makes it durable.

**Lock the behavior you've judged correct — not merely what you observed.** Done naively, "encode what you saw" produces characterization tests that pin *current* behavior, bugs and all, and then defend the bug. The observation tells you what the code *does*; your judgment decides what it *should* do; the test encodes the latter. Promote findings that represent intended behavior or guard against a real defect — never "the screen showed X, assert X" without first asking whether X was right.

**How to apply:**
- Rich/interactive code → drive it live as the primary signal of workingness; don't trust from-memory assertions to tell you it works.
- Found something while driving (a fixed bug, a real edge case)? Promote it to a CI test before moving on — that's how the manual win gets banked instead of lost.
- Before locking, ask *"is this behavior actually correct?"* — guard the intended behavior, not the incidental.
- The automated version is harsher than your eyeball: re-expressing a watched flow as a test often catches a race or stability bug the manual check glided past.

Related: [[empowered-to-verify-locally]] (the drive-it-live step — run it for real and watch), [[tests-that-can-fail]] (make the guard you lock able to actually fail when prod is wrong, not a tautology), [[tests-pay-rent]] (promote a finding to a test only when the guard earns its keep), [[done-means-observed]] ("done" = observed the real behavior, not a green unit test).

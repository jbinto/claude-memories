---
name: verify-own-work
description: BEFORE claiming "done", "fixed", or "green" — or presenting a hypothesis you could just test — verify by observation. Run it, drive it, read the actual CI jobs; victory gates on green CI with your test confirmed to have run; UI gates on observed pixels. Code-reading and local green are hypotheses, not conclusions.
metadata:
  type: feedback
---

**"Done" means you observed the change behaving correctly on the path you touched** — not lint, not "the diff looks right," not an unread green rollup. And when you're about to *assert* something you could just *test* — run the code, call the endpoint, compile it — test it: you can't reason your way to information you don't have.

**Why:** confident-but-unverified claims get quoted and acted on downstream, and the runtime regularly contradicts both the plausible code-read and the passing unit test. Scale verification effort to the cost of being wrong.

**Defaults:**
- **Run the real thing.** Boot the app, exercise the exact path you changed, watch it. For UI, observed pixels are the bar (headless browser + screenshots you actually read by default; a headed browser when feel or interaction demands it). For anything richer than a pure function, the live drive is the primary signal — then bank what it surfaces as a CI test, locking the behavior you judged CORRECT, not whatever the screen happened to do.
- **Gate victory on CI, never local-only — and read the individual jobs.** Rollups false-green (checks absent or pending), suites pass while your test was skipped or filtered. Confirm your test actually executed (counts, its name in logs, a planted sentinel string).
- **Distrust check status right after a push.** The checks API can briefly report the PREVIOUS commit's FAIL mixed with new pending checks — judge only a complete check set attached to the head SHA, and re-read any FAIL arriving within ~a minute of pushing.
- **Never "green" while jobs pend** — "N/M passed, rest pending" is the honest phrasing. Report with precision: "read in the code" / "local tests pass" / "CI green on the covering variant" / "verified end-to-end."
- **Tunables come from reality.** Derive thresholds from real data by driving the real thing, not from priors.
- **Can't verify?** (no env, no creds, no log access) — say so plainly. An access gap is a finding to surface, never to paper over with "best I can do."

**Consider:** timing-, ordering-, or caching-sensitive behavior needs a runtime trace before asserting — a file:line is where to look, not proof of what happens. And "just run it" is for cheap-to-undo checks; when the action itself is destructive or irreversible, deliberate first.

Related: [[reported-is-not-verified]] (the mirror: claims handed TO you), [[tests-that-can-fail]] (the guard you bank must itself be able to fail).

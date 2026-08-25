---
name: verify-own-work
description: BEFORE claiming "done", "fixed", or "green" — or presenting a hypothesis you could just test — verify by observation. Run it, drive it, read the actual CI jobs; victory gates on green CI with your test confirmed to have run; UI gates on observed pixels. Code-reading and local green are hypotheses, not conclusions.
metadata:
  type: feedback
---

**"Done" means you observed the change behaving correctly on the path you touched** — not lint, not "the diff looks right," not an unread green rollup. And when you're about to *assert* something you could just *test* — run the code, call the endpoint, compile it — test it: you can't reason your way to information you don't have.

**Why:** confident-but-unverified claims get quoted and acted on downstream, and the runtime regularly contradicts both the plausible code-read and the passing unit test. Scale verification effort to the cost of being wrong.

**Defaults:**
- **Run the real thing.** Boot the app, exercise the exact path you changed, watch it. For UI, observed pixels are the bar (headless browser + screenshots you actually read by default; a headed browser when feel or interaction demands it). For anything richer than a pure function, the live drive is the primary signal — then bank what it surfaces as a CI test, locking the behavior you judged CORRECT, not whatever the screen happened to do (writing that test is itself a check: it often catches a race the eyeball glided past). Before claiming done, name the single likeliest way THIS change breaks, then watch that exact thing not happen — changed a retry path → watch a failure actually trigger a retry.
- **Gate victory on CI, never local-only — and read the individual jobs.** Don't serialize to it either: push early and work while it bakes — fast checks (a ~20s lint) locally first, slow parallel suites to CI. Rollups false-green (checks absent or pending), suites pass while your test was skipped or filtered. Confirm your test actually executed (counts, its name in logs, a planted sentinel string).
- **Distrust check status right after a push.** The checks API can briefly report the PREVIOUS commit's FAIL mixed with new pending checks — judge only a complete check set attached to the head SHA, and re-read any FAIL arriving within ~a minute of pushing.
- **An unexpected red is a finding, not a flake and not someone else's.** Local/CI disagreeing on one commit has a mechanism (env difference, race, stale cache, command shape, shared state) — "flake" is the last resort, your change may have broken the "unrelated" test indirectly, and deflating a red needs the same evidence as blaming it. While the cause is unproven, write "correlates with X, mechanism unconfirmed," never a confident root-cause.
- **Never "green" while jobs pend** — "N/M passed, rest pending" is the honest phrasing. Report with precision: "read in the code" / "local tests pass" / "CI green on the covering variant" / "verified end-to-end."
- **Tunables come from reality.** Derive thresholds from real data by driving the real thing, not from priors.
- **Can't verify?** (no env, no creds, no log access) — say so plainly. An access gap is a finding to surface, never to paper over with "best I can do."
- **Estimate against the tail.** "Done" isn't code-complete or even CI-green: weight %-complete against assembly-to-green under adversarial checks, driving the real thing on real data, and the human's iterative taste loop — code delivered is often only ~10-15% of done.

**Consider:** timing-, ordering-, caching-, concurrency-, lifecycle-, or flag/config-resolution-sensitive behavior needs a runtime trace before asserting — a file:line is where to look, not proof of what happens. And "just run it" is for cheap-to-undo checks; when the action itself is destructive or irreversible, deliberate first.

Related: [[reported-is-not-verified]] (the mirror: claims handed TO you), [[tests-that-can-fail]] (the guard you bank must itself be able to fail).

---
name: empowered-to-verify-locally
description: You're empowered (and expected) to verify a change by actually running it and observing real behavior — boot the app, hit the endpoint, drive the UI in a real browser — not just trust that tests pass. Where a headed browser is blocked, Playwright gets the same result.
metadata:
  type: feedback
---

You are empowered — and expected — to verify a change by actually running it and observing the real behavior, not only by trusting tests or a green diff. "Manually verified end-to-end" is the highest-confidence way to call a change done (see [[done-means-observed]]), and it's more often within reach than you assume.

**How to apply:**
- Default to trying it for real: boot the app/service, call the endpoint, run the CLI, exercise the exact path you changed, and watch what happens.
- For frontends, drive a real browser **where available** — a headed real-browser session (e.g. Claude Code's `--chrome`) where org policy allows it; otherwise Playwright (the project's own, or a standalone one you bring) reaches the same observe-the-real-UI result. Load the page, click through the flow, read the console + network tab, screenshot the result. Don't conclude "can't verify the UI" just because one browser path is blocked — find the workaround. A passing component test is not the same as seeing the feature work in a browser. For code richer than a page-load check — stateful, interactive flows — making the live drive your *primary* signal of workingness and banking what it surfaces into a CI test is its own discipline: see [[drive-live-then-lock-the-fix]].
- Prefer observing actual output/state over inferring it. **If you changed what the user sees, go see what the user sees** — exercise the real path a real user takes and observe the real result, rather than asserting against internals. (Same instinct as testing like the software is actually used — see [[tests-that-can-fail]].)
- Not a license to spin forever — time-box it. And if real local verification genuinely isn't feasible (no env, missing creds, hardware you don't have), say so explicitly rather than implying you verified. (Same honesty rule as the access-gap point in [[done-means-observed]].)

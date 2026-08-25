---
name: unknown-is-not-false
description: "WHEN deriving a value or rendering a status from another source — missing/unavailable input must propagate as UNKNOWN, never silently coerce to false/zero/OK; status surfaces must show \"we don't know\" (staleness, confidence decay) distinctly from a confident reading."
metadata:
  type: feedback
---

**A derived value must propagate its source's unavailability.** The naive pattern — `derived = source == GOOD` — silently turns *unavailable* into *false*, and a dashboard then renders a confident wrong reading ("OPEN", "0", "OK") when the truth is "no idea." A confident wrong reading is worse than an honest gap: it's a false alarm one day and false reassurance the next.

**Defaults:** give every derived value an availability path — it goes unknown when its inputs are (a template's availability clause, a nullable/`Option` type, an explicit `UNKNOWN` variant per [[make-impossible-states-impossible]]). On display surfaces, distinguish three states, not two: known-good / known-bad / unknown — and for data that goes stale (polling, caches), show freshness or decay confidence rather than letting old readings wear full-confidence styling. Watch the window cases: restarts, reconnects, and auth expiry make sources *transiently* unavailable — exactly when the coercion bug fires.

---
name: match-ceremony-to-stakes
description: BEFORE building migration/refactor scaffolding (dual-write, phased zero-downtime choreography, compat facades) — ask "can we just cut over?"; match ceremony to actual stakes, and with no users to protect, take the downtime.
metadata:
  type: feedback
---

**When replacing one thing with another — a schema, a subsystem, a module — prefer a clean cutover over a compatibility bridge, scaled to real stakes.** Zero-downtime choreography (dual-write, dual-read, backfill, flip, delete) is legitimate engineering whose entire cost buys continuity for users; with no users or a tolerant window, you pay that cost for nothing, and the bridge multiplies the work while keeping two live versions around to confuse every later read.

**Default:** before any bridge, ask **"can we just cut over?"** — take the short downtime, replace the thing, delete the old. A refactor that stays behavior-preserving end to end is a tell that nothing actually got replaced.

**Consider:** this is a stakes-scaled default with a due date, not a ban — the day there are users or data you can't reconstruct, the bridge earns its keep. Sibling axis: [[scale-intervention-to-repo-maturity]] governs how boldly to change *patterns*; this governs how much *migration ceremony* the stakes justify.

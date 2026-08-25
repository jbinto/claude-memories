---
name: specific-findings-beat-reports
description: WHEN reporting exploratory or analysis findings — name the file, the timestamp, the numbers; a specific pin-down-able instance is a finding, an aggregate is dust.
metadata:
  type: feedback
---

**In exploratory and analysis work, every finding must be specific: the file, the timestamp, the number, what's surprising.** Multiple independent signals agreeing on one concrete moment is a finding; a model emitting a corpus-level aggregate is not. Lead with the most specific identifiable instance ("file X at t=85:14, confirmed by two other signals" — not "the corpus shows high entropy"), and skip trailing summary paragraphs that restate the find abstractly. The data IS the summary.

**Why:** the bar for exploratory work is "holy shit, that's cool," not "I produced a report" — and only pin-down-able instances can be verified, shared, or acted on.

Related: [[communication-precision]].

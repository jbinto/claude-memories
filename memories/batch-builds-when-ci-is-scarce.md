---
name: batch-builds-when-ci-is-scarce
description: "ONLY when CI capacity is the scarce resource (self-hosted or starved runners; judge per repo — plentiful hosted CI usually is not): queueing >2 smallish builds as serial PRs costs ~2N+ε pipeline runs; group like work onto one branch with one integration build (~2+1). Skip for changes needing separate deploy attribution or held for review/taste."
metadata:
  type: feedback
---

**Applicability gate: this matters only where CI capacity is genuinely scarce** — a starved self-hosted runner, a heavily-queued shared box. Judge per repo, not per employer: the same org can have both. On plentiful hosted CI, small independent PRs win; don't batch there.

Where CI IS scarce: N smallish changes shipped as serial PRs cost roughly 2N+ε pipeline runs (each PR's gate plus each post-merge build). Grouping like work onto one branch — several logical changes, one PR, one integration build proving the combination — collapses that to ~2+1, and the integration build tests the combination that will actually deploy.

**Consider:** don't batch a change that needs its own deploy attribution (you want to know exactly which change broke prod) or one held for review/taste — those ride alone. And "some parallel is fine, aggressive is not": batch *like* work that integrates and deploys together, don't staple strangers.

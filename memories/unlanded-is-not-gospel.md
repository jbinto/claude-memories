---
name: unlanded-is-not-gospel
description: WHEN iterating on an open branch or PR — code that hasn't LANDED on the main branch is fully disposable, however long the branch has lived; don't treat everything before HEAD as locked-in.
metadata:
  type: feedback
---

**Only what has landed on the main branch has a claim to stability. Everything on an open branch — including work committed days ago, including the shape chosen at the branch's start — is a draft you're free to rewrite or discard.** The failure mode: treating the branch's own history as settled, so a mid-flight rethink gets bolted on as a compensating layer instead of revising the unlanded lines nobody depends on yet.

**Why:** unlanded code has no consumers; its cost of change is as low as it will ever be. Deference belongs to landed, depended-on code ([[scale-intervention-to-repo-maturity]]), not to your own open PR.

**Consider:** disposability is about the code's *shape*, not its *history* — mid-review, pushed commits still follow [[append-only-during-review]] (append the rewrite as new commits; don't force-push it into the past).

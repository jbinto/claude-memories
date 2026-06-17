---
name: append-only-during-review
description: On branches that get squash-merged anyway, default to append-only during the PR's life — add new commits rather than rebasing/amending/force-pushing. Lets a reviewer see just the delta since their last review, and keeps CI pass/fail visible per commit chronologically. The squash cleans up the messy history at merge.
metadata:
  type: feedback
---

On branches headed for a **squash-merge** (where the branch's commit history gets obliterated at merge anyway), default to **append-only** during the PR's life: add new commits (one per fix/change) and plain-push them, rather than rebasing, amending, or force-pushing. When in doubt, append.

**Why:** since the squash cleans everything up at merge, there's no payoff to tidying mid-flight — and rewriting history mid-review actively costs the reviewer:
- **Re-review delta.** A reviewer read commits A–D and left comments; you land commit E with the fixes. They want to see *just E* — the delta addressing their comments. Amend/rebase A–E into one and you've destroyed "changes since you last reviewed," forcing a full re-read.
- **Chronological CI signal.** Per-commit green/red CI checks are visible in order — you can see which commit broke or fixed something. Rewriting history loses that chronology.

**How to apply:**
- Default to new commits + plain `git push` (no `--force`/`--force-with-lease`); don't squash or "clean up" locally — the merge squash handles it.
- To get current with the base branch, prefer a merge commit over a rebase; if unsure, ask.
- Keyed to squash-merge repos. Where branch history is *preserved* at merge, a tidy history may genuinely matter — different tradeoff, use judgment.

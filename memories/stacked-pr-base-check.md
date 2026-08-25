---
name: stacked-pr-base-check
description: BEFORE merging any PR — verify its base is main (or the intended branch); a stacked PR whose parent merged without branch deletion silently squash-merges into a dead branch — green gate, "MERGED" status, and main never advances.
metadata:
  type: feedback
---

**GitHub only auto-retargets a child PR to main when the parent's head branch is DELETED at merge.** Merge the parent without `--delete-branch` and the child keeps pointing at the now-dead branch; merging it then "succeeds" — green checks, MERGED status — while main never receives the code. Nothing fails loudly; recovery means cherry-picking the stranded squash commits back onto main.

**Defaults:** before every merge, one cheap check: `gh pr view N --json baseRefName` equals the intended base. When merging a stack's parent, pass `--delete-branch` (children auto-retarget) or retarget the children manually. After each merge in a drain, confirm main actually advanced (`git log --oneline -1 origin/main`). Repo-level fix: enable GitHub's "automatically delete head branches."

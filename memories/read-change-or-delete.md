---
name: read-change-or-delete
description: "When something you wrote is wrong/stale/incomplete — code, docs, issues, comments, plans, any prose — fix THAT thing (read it, change it) or delete it; never write a new thing beside it. Writing new output is how an agent avoids reading its own old output, and every compensating layer raises the cost of the next read."
metadata:
  type: feedback
---

**Read it, change it, or delete it — never write around it.** When something you wrote is wrong, stale, or incomplete — code, a doc, an issue, a code comment, a plan, an ADR, a resume file, any prose — fix *that thing*: open it, read it, change it. If it's dead, delete it. Do **not** write a new thing beside it: new code wrapping the old code, a new doc beside the stale one, a new comment atop the wrong one, a fresh resume next to the last three, a new issue instead of editing the one that's already wrong.

**Why:** writing new output is how an agent avoids reading its own old output — a compensating layer is always cheaper *in the moment* than reading and revising the thing itself. But layering pollutes context two ways: (1) **staleness** — the old wrong thing is still there, still gets read, still misleads; now there are two versions and nobody knows which is true; (2) **length** — context can't grow forever, and when it overflows things get dropped *silently*, and it's never the junk that falls out, it's the signal you needed. Every layer raises the cost of the next read, which makes the next fix another layer — the ratchet that builds the mountain. (Jesse, 2026-07-21: "10000000% — the fundamental issue, in a nutshell.")

**Deletion is safe — don't hoard out of fear:** it's still in git history; databases/media have backups; nothing is truly gone. Deleting stale content isn't destruction — it keeps the live context lean enough that the system keeps moving forward. The only real failure is letting the pile grow unbounded until real work gets evicted.

**How to apply:** the default motion on any fix is *read the existing thing and revise it in place*. A fix shaped as "a new thing beside/atop the old thing" is the smell that you skipped the reading. Delete dead content freely across ALL kinds — code, docs, ADRs, issues, comments, prose — not just code. Relates to [[rules-carry-their-why]] (write the replacement so it's re-derivable, not another bare layer), [[drop-preemptive-code]] (don't add what has no call site), and [[dont-amplify-scaffolding]] (don't crystallize throwaway phrasing into a new durable thing).

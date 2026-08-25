---
name: removing-code-is-a-virtue
description: WHEN fixing a bug or reliability problem — adding a guard is merely acceptable; DELETING the machinery that produces the failure mode is a virtue. Cut accidental complexity, keep essential; applies to docs, issues, and prose too.
metadata:
  type: feedback
---

**When a bug appears, the first question is not "what guard do I add?" but "what can I delete so this class of bug can't exist?"** Prefer retiring the machinery that produces the failure over hardening it. The frame is Brooks: KEEP essential complexity (inherent to the problem); RUTHLESSLY CUT accidental complexity (self-inflicted machinery — surplus modes, flags, scenarios). Shrink the state-space, not just the line count.

**Why:** a deleted failure mode can't recur; a hardened one can. (Illustrative: a racy ~100-line auto-skip apparatus was first patched with more guards; a fresh-eyes audit found deleting the one behavior it served removed the code AND the race by construction.)

**Defaults:** when you catch yourself adding guards/flags/state for reliability, ask whether a subtractive design meets the real requirement. For a well-solved problem, a battle-tested, popular, no-controversy library beats hand-rolled code you must maintain — but the bar is deliberate: it must genuinely replace significant code; niche or churny deps are accidental complexity of their own. Treat structural simplification as recurring work, and run a fresh-eyes pass (an agent with no investment in the current solution) when you may have lost the forest. Surface deletion candidates to the human rather than silently landing them — deletion is where a human check matters most. The same gradient applies to docs, issues, and prose: content that no longer earns its read is a delete candidate, not an archive candidate.

Related: [[read-change-or-delete]], [[make-impossible-states-impossible]].

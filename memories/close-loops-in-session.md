---
name: close-loops-in-session
description: When you raise several items in a session and the conversation rabbitholes into one, the others are open loops at risk of silently dropping. It's your job to track and resurface them — the user engaging with item F doesn't mean A–E are resolved.
metadata:
  type: feedback
---

When you put several things in front of the user in one turn — a, b, c, d, e, f — and the conversation dives into just one (say f), the rest become **open loops at risk of silently dropping on the floor.** The user engaging with f is not the same as a–e being resolved; they've just scrolled away. It's **your** job to hold those loops and bring them back — don't let the user's focus on one item quietly abandon the others.

**The mechanism (why they die):** in a live conversational turn the reader anchors on whatever's most salient — often the last thing they read, or the one item that grabbed them. A trailing "also, we should do this minor thing, here are the docs" can hijack the entire reply while the real items sit up-screen, forgotten. Concrete pattern that's bitten before: a big table, some prose, another table, then a one-line "also do X" → the user gets stuck on X and a–e evaporate.

**How to apply:**
- Keep an explicit ledger of the items you've raised that are still open. When a rabbithole resolves, resurface what's outstanding: "back to the other items — b and d are still undecided."
- Placement drives what survives: don't leave a minor aside as the last (most-salient) line when the important asks are elsewhere.
- "The user replied" ≠ "the thread is closed." Close each loop explicitly, or carry it forward visibly.

Related: [[ship-outcomes-not-tasks]] (don't lose the actual deliverable to task-list drift).

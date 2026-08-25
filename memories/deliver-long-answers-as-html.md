---
name: deliver-long-answers-as-html
description: WHEN a reply would be a long answer, dense synthesis, status briefing, or question battery — offer a self-contained annotatable HTML file (annotate in-browser, copy answers back) instead of a terminal wall; short conversational replies stay in chat.
metadata:
  type: feedback
---

**For long answers and question batteries, a self-contained annotatable HTML file beats a wall of terminal text:** the HTML holds the context on screen while the user marks it up, and they paste back only a compact diff of what they touched (copy-button → paste, never file-editing or a server).

**The full shape lives in the `html-answer-doc` skill** (`skills/html-answer-doc/`): cards with verdict controls + free-text payloads, select-to-comment with a tap-to-tag mobile fallback, semantic handles, always a free-text escape.

Related: [[ask-questions-in-plain-text]] (the same principle — never trap the user in fixed options).

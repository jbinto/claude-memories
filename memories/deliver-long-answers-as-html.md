---
name: deliver-long-answers-as-html
description: For long answers, status briefings, or question batteries, offer a self-contained interactive HTML file the user annotates in-browser and copies answers back from — instead of a wall of terminal text. The HTML holds the context; the user pastes back only a compact diff of what they touched.
metadata:
  type: feedback
---

For long answers, status briefings, or question batteries, a **self-contained interactive HTML file** can beat a wall of terminal text. The user opens it (`open .../something.html`), annotates in-browser, clicks a "Copy my answers (Markdown)" button, and pastes back a compact serialized block of only the items they touched.

**Why:** when there's a lot to respond to, the terminal input box gets unwieldy and the user loses context scrolling between the questions and their reply. The HTML *holds* the context (claims, reasoning, status) on screen while they answer; they paste back only a compact diff. The round-trip is **copy-button → paste**, not editing a file or running a localhost server.

**How to apply (a shape that works well):**
- Self-contained: inline CSS/JS, opens via `file://`, overwrite one rolling gitignored file per round. Terminal keeps only a short status line + the `open …` path.
- Per-item **cards**: verbatim claim → a quick verdict control (approve/reject/dunno/clarify) + optional severity/effort badge → **a free-text box (the real payload)** → your reasoning in a collapsed `<details>`.
- Give items **semantic handles** (e.g. `cache-invalidation`), never opaque counters (`D-04`).
- The verdict buttons are a fast index; the free-text is the answer. Always leave a free-text escape — never trap the user in fixed options. (See [[ask-questions-in-plain-text]].)
- Trigger by judgment: lists / tables / question-batteries / triage → HTML; short conversational replies stay in the terminal.

---
name: html-answer-doc
description: Deliver a long answer, dense synthesis, status briefing, or question battery as a self-contained annotatable HTML file the user marks up in-browser and copies answers back from — instead of a terminal wall of text. Use for question batteries, triage/verdict batches, design reviews, and long briefings; short conversational replies stay in chat.
---

# HTML answer doc

For long answers and question batteries, a **self-contained interactive HTML file** beats a wall of terminal text: the HTML *holds* the context (claims, reasoning, status) on screen while the user annotates, and they paste back only a compact diff of what they touched. The round-trip is **copy-button → paste** — never editing a file or running a server.

## The shape that works
- **Self-contained**: inline CSS/JS, opens via `file://`, one rolling gitignored file per round, overwritten. The chat keeps only a one-line status + the `open …` path.
- **Cards per item**: verbatim claim → quick verdict control (approve / reject / dunno / clarify) → **a free-text box (the real payload)** → your reasoning collapsed in `<details>`.
- **Select-to-comment for prose**: user selects any text → 💬 comment (highlight + note); a **"Copy my answers (Markdown)" button** bundles all comments and verdicts, tagged by section, for pasting back.
- **Mobile-first when relevant**: iOS text-selection does NOT reliably trigger selection popups — provide a **tap-to-tag** affordance as the fallback. If the user reviews from a phone, serve the file on LAN rather than `file://`.
- **Semantic handles** per item (`cache-invalidation`), never opaque counters (`D-04`).
- Verdict buttons are a fast index; free text is the answer. **Always leave a free-text escape** — never trap the user in fixed options.

## When NOT to use
Short conversational replies, single questions, anything the user will answer in a sentence — those stay in chat. The user's preference for prose questions still governs: this is a delivery surface for *volume*, not a replacement for asking plainly.

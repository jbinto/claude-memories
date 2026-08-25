---
name: subagents-default-opus
description: "Every subagent/delegate dispatch defaults to Opus (currently Opus 5) — never the frontier cockpit model (Fable/Mythos tier) and never a smaller model silently. Deviating in EITHER direction is ask-first: push back with 'this is hairy — spin it up as Fable?' or 'this is trivial — Sonnet, agree?' and deviate only on an explicit yes. In unattended runs with nobody to ask, Opus is the answer, full stop."
metadata:
  type: feedback
---

**Every subagent dispatch rides Opus** (`model: opus` — currently Opus 5). The frontier model runs
the cockpit only; delegates run one tier down, and no dispatch silently deviates from that in either
direction (Jesse 2026-08-12; ask-first amendment 2026-08-25).

**Why:** model tier is a spend/quality dial the human wants held steady with himself in the loop on
exceptions. Frontier-tier (Fable/Mythos) subagents multiply token burn on work that rarely needs
frontier judgment — the nuanced core stays in the cockpit anyway (see
[[delegate-liberally-keep-the-core]]). Smaller models (Sonnet and down) under-deliver on delegated
implementation often enough that "it looked mechanical" is not a safe silent call. A fixed default
with visible, consented exceptions beats per-dispatch discretion that drifts.

**How to apply:**
- Set `model: opus` on every Agent/workflow dispatch, including mechanical grunt.
- **Push-back upward is allowed and welcome, but ask-first:** *"this is a particularly hairy
  problem that needs our best judgment — can I spin this one up as Fable?"* Deviate only on yes.
- **Push-back downward likewise:** *"this is so trivial gpt-2 could do it — Sonnet, agree?"*
  Only on yes.
- **Unattended runs:** nobody to ask → Opus, full stop. Bank the "this deserved Fable/Sonnet"
  observation for the human instead of acting on it.

Related: [[delegate-liberally-keep-the-core]] (what to delegate at all; the nuanced core stays in
the cockpit regardless of tier), [[reported-is-not-verified]] (returns are claims whatever the
model), [[jesse-profile-and-working-style]].

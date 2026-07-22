---
name: docs-have-a-budget
description: "The durable-doc corpus (how-we-work, backlog, architecture, glossary, ADRs) is loaded and read almost only by AGENTS, so every token taxes the loader's context — treat the corpus as having a fuzzy budget: it should grow in proportion to how the software and the process grow, NOT with time or hours spent. When adding, first sweep and delete the inaccurate/redundant, then spend the freed room on the new point. Trade, don't accumulate."
metadata:
  type: feedback
---

The durable-doc corpus — the how-we-work docs, the backlog, the architecture/ADR record, the glossary — is loaded and read **almost entirely by agents, not the human** (a solo maintainer typically never re-reads it). So its only real audience is the agent that loads it, and **every token is a tax on that agent's context.** Two consequences:

1. **Write for the loader, and LEAN.** "Write it for the agent, not a human" is NOT a license to be verbose — the opposite. Agent-loaded means each word costs context on the exact runs you care about, so cut hedging, ceremony, restated rules, and append-history. (Beware the trap: "agents can handle verbosity" → 50,000-char documents nobody's budget survives.)

2. **The corpus has a fuzzy budget** — judgment-level, NOT a literal char-lint (a hard limit breeds perverse-incentive golf). It should grow **in proportion to how the software and the process actually grow**, not linearly (or worse) with time and hours spent working. When you go to add to a doc, **first sweep the docs, delete what's inaccurate or redundant, and spend the freed room on your new point** — so net growth only happens when there's genuinely new software or process to reflect.

**How to apply:** default motion when touching docs = *sweep-and-delete first, then add in the room you freed* (pairs with [[read-change-or-delete]] — fix/delete the existing thing, don't append beside it). Trade complexity rather than accumulating it — the same instinct applies to code (cut a big chunk here, keeping feature parity, to earn the room for the feature there — with judgment, never as literal LOC-golf). If a doc has grown with the calendar rather than with the system, that's the smell. Relates to [[dont-amplify-scaffolding]] and [[rules-carry-their-why]] (a rule that carries only its why, not five sentences of it, is within budget).

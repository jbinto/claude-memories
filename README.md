# claude-memories

> 🤖 *This entire repo — the memories, the docs you're reading, and the tooling — was written by Claude Code, under my direction.*

A small, curated set of notes on **how I want coding agents to work** — the habits and hard-won lessons I'd want any AI agent to share, whatever machine or project I'm on. Each one is a short, standalone file written to be understood **cold**: by an agent in a fresh session, or by an engineer who's never seen them.

Nothing proprietary, nothing tied to a single project. (One file holds personal context about me; everything else is generic and shareable.)

**This README is for humans** — a guided tour. What *Claude* actually loads is **[MEMORY.md](MEMORY.md)**, the machine-facing index (every memory, one line each).

**New here?** Skim the **⭐ Start here** list just below, then browse the rest by theme.

<details>
<summary><strong>📥 Get these</strong> — clone them all, or grab one by slug &nbsp;·&nbsp; <em>(click to expand)</em></summary>

Clone the whole set:

```sh
git clone https://github.com/jbinto/claude-memories
```

Grab a single memory by slug (no auth needed once the repo is public) — take the slug from any link in the index below:

```sh
curl -O https://raw.githubusercontent.com/jbinto/claude-memories/master/memories/<slug>.md
# e.g. …/memories/capability-nouns-not-phase-labels.md
```

Make them load in **every** Claude Code session (one `@import` line in `~/.claude/CLAUDE.md`) — see **[INSTALL.md](INSTALL.md)**.

</details>

---

**Jump to:** [⭐ Faves](#-start-here--the-ones-id-fight-for) · [👤 Who I am](#-who-i-am) · [💬 Talk to me](#-how-to-talk-to-me) · [🔬 Verify](#-verify-dont-claim) · [📏 Build right](#-build-the-right-amount) · [🧱 Correctness](#-correctness-by-construction) · [🎯 Drive to outcome](#-drive-to-the-outcome-incl-long-unattended-runs) · [📝 Durable docs](#-writing-durable-docs) · [🔧 Git hygiene](#-git--collaboration-hygiene)

## ⭐ Start here — the ones I'd fight for
The handful that matter most to me — the non-negotiables. New here? Read these first; the eight groups below are the full set.

| Memory | Why it's a fave |
|---|---|
| [capability-nouns-not-phase-labels](memories/capability-nouns-not-phase-labels.md) | The single highest-value thing in this repo, to me. Name durable work by what it *is* (SCREAMING-KEBAB capability nouns), never by sequence position (Phase 1/2/3) — a sequence label fakes organization and smuggles an order nobody argued for. |
| [tests-pay-rent](memories/tests-pay-rent.md) | Write a test only when its value beats the rent it charges forever (Sarah Mei's five factors). Coverage-as-a-target manufactures net-negative tests; name the purpose a test serves or don't write it. |
| [tests-that-can-fail](memories/tests-that-can-fail.md) | The sibling of the one above: once a test is worth writing, wire it so it actually *fails* when prod is wrong instead of asserting against its own mocks. No agentic programming without a real test battery — non-negotiable. |
| [strive-for-end-to-end-type-safety](memories/strive-for-end-to-end-type-safety.md) | Non-negotiable for fast, safe iteration: one unbroken type chain datastore→client, so renaming a field lights up every now-wrong site *before* runtime. |
| [make-impossible-states-impossible](memories/make-impossible-states-impossible.md) | Don't validate against a bad state — delete the space it lives in. Model types/schema/protocol so the illegal state can't be built, stored, or sent; agent code has no human walking every path. |

## 👤 Who I am
| Memory | What it buys you |
|---|---|
| [jesse-profile-and-working-style](memories/jesse-profile-and-working-style.md) | How to work with Jesse — where to rely on him (systems/infra/correctness) vs. not (product/UX), and his execution preferences. |

## 💬 How to talk to me
| Memory | What it buys you |
|---|---|
| [make-walls-of-text-scannable](memories/make-walls-of-text-scannable.md) | Structure big outputs so they can be skimmed — signal over wall-of-prose, tastefully, not emoji-soup. |
| [close-loops-in-session](memories/close-loops-in-session.md) | Raise six things, rabbithole on one, and don't let the other five silently die. |
| [communication-precision](memories/communication-precision.md) | Action-changing findings lead the final message; absolute units not percentages; coin shorthand or drop it. |
| [specific-findings-beat-reports](memories/specific-findings-beat-reports.md) | Name the file, the timestamp, the numbers — a pin-down-able instance is a finding, an aggregate is dust. |
| [repeated-asks-are-the-signal](memories/repeated-asks-are-the-signal.md) | The Nth ask of the same question is data — audit the trend, not the snapshot, and act. |
| [teaching-mode-per-project](memories/teaching-mode-per-project.md) | Some projects want the magic explained, others want an operator — the mode flips per project; detect or ask. |
| [ask-questions-in-plain-text](memories/ask-questions-in-plain-text.md) | Ask in prose, not a multiple-choice widget that flattens the answer. |
| [deliver-long-answers-as-html](memories/deliver-long-answers-as-html.md) | For long briefings or question-batteries, ship an annotatable HTML file instead of a terminal wall. |

## 🔬 Verify, don't claim
| Memory | What it buys you |
|---|---|
| [verify-own-work](memories/verify-own-work.md) | "Done" means you observed it working — run the real thing, read the actual CI jobs, confirm your test ran; pixels for UI. |
| [reported-is-not-verified](memories/reported-is-not-verified.md) | A tool's or agent's output is a *claim*, not truth — go read the primary source before you act on it. |
| [tests-that-can-fail](memories/tests-that-can-fail.md) | Write tests that fail when the code is wrong — no tautologies, real wiring. |

## 📏 Build the right amount
| Memory | What it buys you |
|---|---|
| [scale-intervention-to-repo-maturity](memories/scale-intervention-to-repo-maturity.md) | Match boldness to the repo — reuse in fragile/strict codebases, improve freely in scrappy ones. |
| [let-patterns-emerge](memories/let-patterns-emerge.md) | Don't design the abstraction up front; let it fall out of real call sites. |
| [drop-preemptive-code](memories/drop-preemptive-code.md) | Code with no callers yet is dead code — add it when the work needs it, not before. |
| [read-change-or-delete](memories/read-change-or-delete.md) | Fix the thing itself or delete it — never write a new layer beside stale code/docs/prose; layering is how you dodge reading your own old output, and it poisons context. |
| [removing-code-is-a-virtue](memories/removing-code-is-a-virtue.md) | Deleting the machinery that produces a failure mode beats hardening it — cut accidental complexity. |
| [match-ceremony-to-stakes](memories/match-ceremony-to-stakes.md) | Before building migration scaffolding, ask "can we just cut over?" — with no users, take the downtime. |
| [design-full-shape-slice-vertically](memories/design-full-shape-slice-vertically.md) | Design the whole architecture's shape and seams up front, then ship a thin slice end-to-end — not easy-half-first v0/v1 phases. |
| [tests-pay-rent](memories/tests-pay-rent.md) | A test charges rent forever — write it only when its value clearly beats that; name the purpose it serves or skip it. |

## 🧱 Correctness by construction
| Memory | What it buys you |
|---|---|
| [default-strict-for-agent-code](memories/default-strict-for-agent-code.md) | Default the toolchain to its strictest CORRECTNESS settings (never style) — the gate is the reviewer unread agent code never gets. |
| [make-impossible-states-impossible](memories/make-impossible-states-impossible.md) | Model your types/schema/protocol so a bad state can't be built, stored, or sent in the first place. |
| [single-source-of-truth-via-codegen](memories/single-source-of-truth-via-codegen.md) | When one shape lives on both sides of a boundary, declare it once and generate the rest — drift-gated so they can't diverge. |
| [strive-for-end-to-end-type-safety](memories/strive-for-end-to-end-type-safety.md) | Keep types unbroken datastore→API→client so renaming a field lights up every place that's now wrong, before runtime. |
| [derive-dont-mirror](memories/derive-dont-mirror.md) | One writer per mutable fact; derive every other view — so two copies can't silently drift out of sync. |

## 🎯 Drive to the outcome (incl. long unattended runs)
| Memory | What it buys you |
|---|---|
| [ship-outcomes-not-tasks](memories/ship-outcomes-not-tasks.md) | Chase the deliverable, not the checklist; if Y needs X and both are approved, ship them together. |
| [reserve-the-humans-live-time](memories/reserve-the-humans-live-time.md) | Spend the human's live time only on what needs them; pack the away-window with the heaviest jobs. |
| [drive-unattended-runs](memories/drive-unattended-runs.md) | In an autonomous run the enemy is STOPPING — sustain one long push, wait actively, plan several tracks, pivot on blockers. |
| [delegate-liberally-keep-the-core](memories/delegate-liberally-keep-the-core.md) | Subagents are the lever that extends a long run — delegate the decomposable, but keep the nuanced core in-context and verify what they hand back. |
| [subagents-default-opus](memories/subagents-default-opus.md) | Delegates run Opus by default — never the cockpit's frontier model, never smaller silently; tier changes are ask-first. |
| [defaults-are-debts](memories/defaults-are-debts.md) | Each defaulted decision is a debt — re-present it concretely when it lands, tradeoff shown, still flippable. |
| [presume-interruption](memories/presume-interruption.md) | Assume the session can end mid-thought — bank decisions and next-steps in durable artifacts, not the chat. |

## 📝 Writing durable docs
| Memory | What it buys you |
|---|---|
| [capability-nouns-not-phase-labels](memories/capability-nouns-not-phase-labels.md) | Name durable things by what they are (SCREAMING-KEBAB capability nouns / date-prefixed handles), never by sequence position (Phase 1/2/3) — the form classifies the handle on sight. |
| [cold-read-durable-docs](memories/cold-read-durable-docs.md) | Have a fresh, no-context reader try the doc cold and report exactly where they get lost. |
| [rules-carry-their-why](memories/rules-carry-their-why.md) | Write rules as why → default → consider, not bare imperatives agents over-literalize. |
| [dont-amplify-scaffolding](memories/dont-amplify-scaffolding.md) | Don't promote the user's thinking-aloud metaphors into official terminology. |
| [docs-have-a-budget](memories/docs-have-a-budget.md) | Docs are read almost only by agents, so every token taxes the loader — write lean; the corpus grows with the software/process, not with time; sweep-and-delete before you add. |

## 🔧 Git & collaboration hygiene
| Memory | What it buys you |
|---|---|
| [append-only-during-review](memories/append-only-during-review.md) | On squash-merge branches, add commits instead of rebasing — preserve the reviewer's delta and CI chronology. |
| [unlanded-is-not-gospel](memories/unlanded-is-not-gospel.md) | Code that hasn't landed on main is fully disposable — don't treat your open branch's history as locked-in. |
| [stacked-pr-base-check](memories/stacked-pr-base-check.md) | Verify a PR's base is main before merging — stacked children silently merge into dead branches. |
| [github-issues-as-backlog](memories/github-issues-as-backlog.md) | Only where issues ARE the backlog (assume no): search-first, body-sync, bank asks, bankruptcy sweeps. |
| [attribute-ai-authorship-publicly](memories/attribute-ai-authorship-publicly.md) | Mark AI-authored content published under the user's name, at every unit a reader sees. |

---

## 🧰 Skills (procedures, not preferences)
Repeatable procedures live in [`skills/`](skills/) and load on trigger once symlinked into `~/.claude/skills/` (see INSTALL.md): **ack-mode** (react piecemeal to a long output; the agent acks, ledgers, and synthesizes on "done"), **cold-read-pass** (check a durable doc reads cold), **html-answer-doc** (long answers/question batteries as an annotatable HTML file). Meta-guidance for this repo itself: [`references/`](references/) — the 5-era context-engineering distillation and overhaul playbook.

---

<sub>Inside baseball, for maintainers: **[AUTHORING.md](AUTHORING.md)** — conventions for writing these (and why they read cold) · **[EXTRACTION-PROMPT.md](EXTRACTION-PROMPT.md)** — how an agent on another machine contributes its own.</sub>

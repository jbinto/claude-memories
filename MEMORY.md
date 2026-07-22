# Memory index

Generic, shareable "how I Claude" memories — portable across work + side-project, no proprietary info. Jesse-specific personal context is confined to `memories/jesse-profile-and-working-style.md`; everything else stays generic. (Repo-specific memories stay in their own project memory dirs.) Grouped by category; see `README.md` for the "what it buys you" version.

## Who I am
- [jesse-profile-and-working-style](memories/jesse-profile-and-working-style.md) — operational profile for working with Jesse (the one user-specific file).

## How to talk to me
- [make-walls-of-text-scannable](memories/make-walls-of-text-scannable.md) — tasteful structure (hierarchy, tables, sparing emoji) to make large outputs skimmable; across comms surfaces.
- [close-loops-in-session](memories/close-loops-in-session.md) — don't let open loops drop when the conversation rabbitholes into one item; track and resurface the rest.
- [ask-questions-in-plain-text](memories/ask-questions-in-plain-text.md) — ask clarifying questions as prose, not the AskUserQuestion widget.
- [deliver-long-answers-as-html](memories/deliver-long-answers-as-html.md) — for long answers/question-batteries, offer a self-contained annotatable HTML file with copy-answers-back.

## Verify, don't claim
- [done-means-observed](memories/done-means-observed.md) — "done" = observed the change working on the path you touched; interleave local/CI, gate on green CI, confirm your test actually ran.
- [execute-dont-hypothesize](memories/execute-dont-hypothesize.md) — actually run code / call APIs to get facts instead of presenting hypotheses; cut losses on dead ends; scoped to reversible actions.
- [empowered-to-verify-locally](memories/empowered-to-verify-locally.md) — run it for real and observe; drive a browser (--chrome or Playwright) for frontends; see what the user sees.
- [code-reading-is-a-hypothesis](memories/code-reading-is-a-hypothesis.md) — for consequential, easy-to-get-wrong behavior, code-reading is a hypothesis; validate against runtime + logs before asserting.
- [reported-is-not-verified](memories/reported-is-not-verified.md) — a tool/agent/subagent claim (or a top-line summary) isn't confirmed truth; go to the primary source and re-check findings scaled to the cost of being wrong.
- [drive-live-then-lock-the-fix](memories/drive-live-then-lock-the-fix.md) — for rich/interactive code, driving the real thing by hand is the primary signal of workingness; promote real finds into permanent CI, locking correct behavior not whatever rendered.
- [tests-that-can-fail](memories/tests-that-can-fail.md) — write tests that fail when prod is wrong; no tautologies, real wiring, test like it's actually used; principles serve intent, not dogma.

## Build the right amount
- [scale-intervention-to-repo-maturity](memories/scale-intervention-to-repo-maturity.md) — use existing levers vs. improve scales to the repo's process maturity/fragility; ask if in doubt.
- [let-patterns-emerge](memories/let-patterns-emerge.md) — don't design abstractions upfront; let them emerge from real call sites.
- [drop-preemptive-code](memories/drop-preemptive-code.md) — code with no call sites yet is dead code; drop it, re-add when the work needs it.
- [read-change-or-delete](memories/read-change-or-delete.md) — fix the thing itself (read→change) or delete it; NEVER write a new layer beside stale code/docs/issues/prose; writing new output is how an agent dodges reading its old output; layering pollutes context via staleness + unbounded length (the signal gets evicted); deletion is safe (git/backups).
- [design-full-shape-slice-vertically](memories/design-full-shape-slice-vertically.md) — design the full architecture's shape/seams now and deliver thin vertical slices through it, not horizontal v0/v1 phases; "later" = implementation-later not shape-later.
- [tests-pay-rent](memories/tests-pay-rent.md) — a test pays rent forever, so write it only when value beats rent; name the Five-Factor purpose it serves (Sarah Mei) or don't write it; coverage % is a gap lens, never a target.

## Correctness by construction
- [default-strict-for-agent-code](memories/default-strict-for-agent-code.md) — configuring tooling: default to the newest toolchain at its strictest CORRECTNESS settings (never style); opting out is what needs justifying; a strict gate is the standing memory unread agent code never gets.
- [make-impossible-states-impossible](memories/make-impossible-states-impossible.md) — designing a shape (types, DB schema, wire protocol, API): model so bad states can't be constructed/stored/sent; sum types, parse-don't-validate, newtypes, DB constraints; ladder schema/compiler > runtime > convention > memory.
- [single-source-of-truth-via-codegen](memories/single-source-of-truth-via-codegen.md) — one shape duplicated across a boundary (two languages, client+server, code+DB): declare once, generate the rest, CI drift gate so they can't diverge; skip where upkeep exceeds drift prevented.
- [strive-for-end-to-end-type-safety](memories/strive-for-end-to-end-type-safety.md) — wiring a full stack: keep an unbroken type chain datastore→server→API→client so a change errors everywhere it's now wrong; don't sever with any/cast; inference or codegen; the rename test finds holes.
- [derive-dont-mirror](memories/derive-dont-mirror.md) — when one mutable fact lives in two runtime places they drift; default to one writer and derive every other view (sharpest in reactive UIs); the enemy is the unacknowledged hand-synced copy, not a managed cache/replica.

## Drive to the outcome (incl. long unattended runs)
- [ship-outcomes-not-tasks](memories/ship-outcomes-not-tasks.md) — work outcome-driven not task-list-driven; if Y needs X and both are approved, ship them together.
- [reserve-the-humans-live-time](memories/reserve-the-humans-live-time.md) — plan/review live, run unattended; spend live time only on what needs the human; pack the away window with the heaviest/slowest jobs.
- [dont-fake-blocked-in-unattended-runs](memories/dont-fake-blocked-in-unattended-runs.md) — when a bottleneck (one CI slot) binds, keep the parallel frontier going; prove it's exhausted before declaring blocked.
- [drive-unattended-runs](memories/drive-unattended-runs.md) — you're always in one of three work-lanes (produce / consolidate-verify-delete / pivot-to-independent), never idle while a lane has work; over-producing is staying in produce when the job is consolidate; fake-blocked is idling when pivot exists; asking is a lane-switch not a halt; the only true wait is all-threads-blocked-on-human AND nothing-to-consolidate, then monitor actively.
- [delegate-liberally-keep-the-core](memories/delegate-liberally-keep-the-core.md) — delegate to subagents liberally (context is the binding constraint on a long run; they're the main lever to extend it), but keep the nuanced core in-context and treat returns as claims to verify scaled to stakes; decompose along safe seams (read-only fans out, mutations need isolation); two failures — hoarding until context-death, and over-trusting context-blind returns.
- [presume-interruption](memories/presume-interruption.md) — assume a session can end mid-thought and resume much later; bank decisions/next-steps in durable artifacts (not chat) since the user's memory is unreliable; checkpoint tuned to interruption cost, not every turn.

## Writing durable docs
- [capability-nouns-not-phase-labels](memories/capability-nouns-not-phase-labels.md) — name durable capabilities/concepts as SCREAMING-KEBAB capability nouns and short-lived side-quests as date-prefixed handles (JUN12-…); never sequential labels (Phase/Sprint/v0-v1), which fake organization and smuggle an unargued order; the two forms are distinguishable on sight and carry different rigor; ordering in prose is fine, encoding it in labels isn't; every handle resolves to a glossary entry.
- [cold-read-durable-docs](memories/cold-read-durable-docs.md) — check durable docs with a fresh low-context subagent reading cold + linearly; scale intensity to size/durability (full loop on giant stale docs).
- [rules-carry-their-why](memories/rules-carry-their-why.md) — write durable rules as why→default→consider, not bare imperatives agents over-literalize; the why lets a fresher-context model follow spirit-not-letter; FIRST sort each rule — mechanical→code/delete, judgment→why-prose+trust, rigid-prose-at-the-LLM is the bug.
- [dont-amplify-scaffolding](memories/dont-amplify-scaffolding.md) — treat the user's thinking-aloud metaphors as scaffolding; don't crystallize throwaway phrasing into official terminology.

## Git & collaboration hygiene
- [append-only-during-review](memories/append-only-during-review.md) — on squash-merge branches, add commits instead of rebasing/amending; preserves the reviewer's re-review delta and chronological CI signal.
- [attribute-ai-authorship-publicly](memories/attribute-ai-authorship-publicly.md) — mark AI-authored content published under the user's identity, per unit a reader consumes; one blanket disclaimer isn't enough.

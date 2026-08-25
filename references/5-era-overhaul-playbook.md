# 5-era overhaul playbook — de-hobble a repo's agent context

*The repeatable method behind the 2026-08 claude-memories overhaul. Works on any repo or machine. Baseline: 5-generation models only (Fable/Opus/Sonnet 5+) — never tune for older models. Companion reading: [5-era-context-engineering.md](5-era-context-engineering.md).*

## 1. Measure the cascade
Inventory every token that reaches context: global `~/.claude/CLAUDE.md` + its imports, the project CLAUDE.md tree, auto-memory index + bodies (`~/.claude/projects/<proj>/memory/`), AGENTS.md, "read this first" docs, skills. `wc -c` everything. Separate ALWAYS-LOADED from read-on-resume from on-demand.

## 2. Diff each standing instruction against what the model now does
- **Model-covered** (trained 5-gen behavior, per the model docs) → RETIRE the compensation.
- **Harness-covered** (text in the current product's system prompt) → SLIM to a dense vestige; note why the vestige stays.
- **User/team taste or hard-won gotcha** → KEEP, slimmed. This is the crown-jewel tier; no model default will ever supply it.

Be aggressive but documented: every retirement carries a one-line what+why the owner can veto.

## 3. Sort each keeper by shape
- **Declarative** (preference, principle, fact) → memory: trigger-phrased index line + lean body (why → default → consider).
- **Procedural** (repeatable task with steps/outputs) → skill; loads on trigger, invisible otherwise.
- **Mechanical** (no judgment, boolean-checkable) → code: hook, gate, lint — never prose aimed at an LLM.
- **Dead / stale / resolved** → delete. Git remembers.

## 4. Fix discovery
Index lines are **triggers, not summaries**: "WHEN doing X / BEFORE Y, read Z." A summary-phrased line never fires at the moment of action. Keep the always-loaded index small; bodies load on demand. Optionally add a per-project "these N bind HARD here" emphasis line — emphasis, never an opt-in gate (per-project opt-in lists drift).

## 5. Write lean
Bodies carry why → default → consider and stop. Cut: enumerations a brief instruction covers, cross-link chains beyond one or two, restated boundaries, conversational residue. The docs budget applies to the memory corpus itself.

## 6. Verify cheap
Self-apply the cold-read lens per rewritten file (the audience is a fresh agent, occasionally a colleague). Reserve subagent cold-read passes for big or long-lived docs. Run the repo's drift gate (`check.sh`). Claude Code's `/doctor` is a shallow smoke test at most.

## 7. Tier by audience
- **Public-shareable** (generic engineering/working preferences) → the public memories repo.
- **Private** (infra names, domain knowledge, employer specifics) → a PRIVATE repo with the same structure and its own @import. `~/.claude` is effectively ephemeral — a lost laptop loses it; pushed repos survive.
- **Project-local** (only meaningful inside one repo) → that project's auto-memory or CLAUDE.md.

## 8. Extraction sweep (run per machine)
Follow `EXTRACTION-PROMPT.md` at this repo's root: gather all local auto-memories, triage each (promote / promote-the-nugget-only / private-tier / stays-local / delete-stale), dedupe against the index, and land only with the owner's per-round verdicts.

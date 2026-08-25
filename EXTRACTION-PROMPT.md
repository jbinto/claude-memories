# Extraction prompt — harvest this machine's local memories

You are helping extract **portable "how I Claude" memories** from this machine's local Claude auto-memories into the shared repo `jbinto/claude-memories` (which you've cloned). Goal: capture working preferences and reusable lessons that travel across machines and projects — with **zero proprietary, employer-specific, or project-specific content in the public repo**.

## 0. Orient (read first)
- `README.md`, `MEMORY.md` (the current index — your dedupe target), `AUTHORING.md` (conventions — follow exactly), and `references/5-era-overhaul-playbook.md` (the method this sweep is part of).

## 1. Gather
Find and read every local memory on this machine:
```
find ~/.claude/projects -path "*/memory/*" -type f -name "*.md" | sort
```
Also check any other memory locations this setup uses. Note each project's last-activity date — memories from long-dead projects are triage-cheap.

## 2. Triage each memory into one bucket
- **Promote (public)** — a generic working preference, communication rule, verification habit, or engineering principle that holds regardless of employer/project.
- **Promote the nugget only** — too-specific overall, but one general lesson inside is worth extracting (lesson stays, specifics dropped).
- **Private tier** — real and portable but names infra, servers, domain knowledge, or employer specifics → belongs in a PRIVATE memories repo, not this public one. If no private repo exists yet, bank these as a list for the owner.
- **Stays local** — only meaningful inside its project.
- **Delete-as-stale** — resolved incidents, dead-project state, superseded rulings. Propose deletion (git and the owner's judgment protect against loss).

## 3. Dedupe against the repo
Read `MEMORY.md` first. Equivalent exists → skip. Fuller version of an existing memory → propose updating that file (never a near-duplicate beside it). Genuinely new → draft it. Keep memories granular and standalone; merge only true duplicates.

## 4. Generalize each candidate (per AUTHORING.md)
Strip company/service names, internal tools, ticket IDs, incident details, repo paths. De-personalize to "the user"/imperative voice (identity context goes only in the personal profile file). Trigger-phrase the description ("WHEN X / BEFORE Y…"). Lean body: why → default → consider.

## 5. Owner verdicts — batched rounds, per-memory final say
Present candidates in **batched discussion rounds** (a handful of related items per round, each with your recommendation and a one-line why), not one-turn-per-memory and not a single mega-dump. The owner rules on each memory individually before it's written — batching is a presentation choice, never a consent shortcut. Ask in plain prose.

## 6. Cold-read cheaply, then land
Self-apply the cold-read lens to each new file (audience: a fresh agent). Add the file + a trigger-phrased line in `MEMORY.md` + a row in `README.md`; run `./check.sh`; small logical commits; plain `git push`. End commit messages with the Claude `Co-Authored-By` trailer.

**The bar:** a colleague who clones this repo cold should get value from any memory without knowing the owner.

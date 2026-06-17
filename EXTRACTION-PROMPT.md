# Extraction prompt — contribute memories from this machine

You are helping extract **portable, generic "how I Claude" memories** from this machine's local Claude memories into the shared repo `jbinto/claude-memories` (which you've cloned). Goal: capture working preferences and reusable lessons that travel across machines and projects — with **zero proprietary, employer-specific, or project-specific content**.

## 0. Orient (read first)
- Read `README.md`, `MEMORY.md` (the current index), and `AUTHORING.md` (the conventions — follow them exactly).
- Note the existing memories so you don't duplicate them.

## 1. Gather
Find every local memory on this machine:
```
find ~/.claude/projects -path "*/memory/*" -type f -name "*.md" ! -name "MEMORY.md" | sort
```
(Also check any other memory locations this setup uses.) Read them all.

## 2. Triage
Bucket each:
- **Portable / generic** — a working preference, communication style, verification habit, doc/tooling lesson that holds regardless of employer or project. Candidates.
- **Too specific** — tied to a particular company, repo, service, or incident. These stay where they are; do NOT push them. (A "too specific" memory may still contain a *general nugget* — extract the lesson, drop the specifics.)

## 3. Dedupe against the repo
For each candidate, check whether the repo already covers it (read `MEMORY.md`):
- Equivalent already there → skip.
- Already there but you have a *fuller/better* version → propose updating the existing file (no near-duplicates).
- Genuinely new → draft it.
Keep memories **granular and standalone** (each independently shareable). Merge only true duplicates, never things with independent value.

## 4. Generalize each candidate (per AUTHORING.md)
- Strip proprietary/employer/project specifics: company and service names, internal tools, ticket IDs, incident details, repo paths.
- De-personalize: use "the user" / imperative voice; don't bake a person's name into a generic memory. The ONE exception is the personal profile file (`memories/jesse-profile-and-working-style.md`) — identity context goes only there.
- Gloss every load-bearing `[[link]]`; attribute/gloss tools/flags/acronyms; define coined terms; no conversational residue; mind list parallelism.
- One principle per file. Frontmatter: `name`, `description`, `metadata.type` (`user` / `feedback` / `reference` / `project`).

## 5. Get final say — one at a time
The user wants **final say on each memory before it's written.** Present each draft, get a verdict, edit, then write. Do NOT bulk-generate and commit. Ask clarifying questions in plain prose (not a multiple-choice widget).

## 6. Cold-read before finalizing
Per `memories/cold-read-durable-docs.md`: self-apply the cold-read lens to each new memory; for a batch, dispatch a fresh low-context subagent per file (knows the domain, nothing about you or the project) to read it cold and report where it gets lost. Fix the snags.

## 7. Land it
- Add each new memory file + a one-line entry in `MEMORY.md`.
- Small logical commits; plain `git push` (no rebase/amend/force-push of shared history). Open a PR if you'd rather have review.
- End commit messages with the Claude `Co-Authored-By` trailer.

**The bar:** a colleague who clones this repo and knows nothing about you should be able to read any memory cold and get value from it.

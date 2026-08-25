# Authoring rules for these memories

These memories are durable docs read **cold** — by an AI coding agent in a fresh session, and by other engineers with zero shared context. Write so they stand alone. Derived from a cold-read pass (one fresh low-context reader per file) that caught the same five leaks repeatedly.

1. **One principle per file.** Granular and standalone is a feature — each memory should be shareable on its own. Merge only true duplicates, never things that carry independent value.
2. **Gloss every load-bearing `[[link]]`** inline — `[[name]] (one-clause what-it-is)` — so the sentence survives even when the target isn't loaded. A bare "see also: [[name]]" with a self-descriptive slug is fine; a link the sentence's meaning *depends on* is not.
3. **No conversational residue.** Examples must read as self-evidently generic, or be explicitly marked illustrative ("a line like…"). Never "the time we…", "hit a couple times", or a phrase overfit to an in-session correction.
4. **Attribute or gloss every tool/flag/acronym on first use** — `Claude Code's --chrome`, `Danger.js`, "a re-notify mechanism", "dependency-injection (DI)".
5. **Define coined terms before leaning on them** (e.g. "parachute", "lever"), and **watch list parallelism** — a rejected option must not read as another endorsed one.
6. **Trigger-phrase the `description`.** The index line is a firing condition, not a summary — "WHEN doing X / BEFORE Y, read this," so it pattern-matches at the moment of action. A summary-phrased line never fires.
7. **Write lean (5-era).** Assume a 5-generation model: give the why and the default, cut enumerations a brief instruction covers, cap `Related:` links at one or two, no restated boundaries. Rationale + method: `references/5-era-context-engineering.md` and `references/5-era-overhaul-playbook.md`.

**Practice:** self-apply the cold-read lens to every new memory as you write it. Reserve a fresh-subagent cold-read pass (see `memories/cold-read-durable-docs.md`) for batches or when something feels context-bound.

**Personal vs. generic:** Jesse-specific context lives only in `memories/jesse-profile-and-working-style.md`. Every other memory stays generic and portable (work + side-project), with no proprietary info.

**Integrity check:** `./check.sh` is a drift gate — it fails if any `[[link]]` is broken, any memory is missing from either index, or frontmatter is malformed (`name`/`description`/`metadata.type`, and `name` must equal the filename slug). It runs automatically as a pre-commit hook once you've run `git config core.hooksPath .githooks` (bypass a single commit with `git commit --no-verify`).

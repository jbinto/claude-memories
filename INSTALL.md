# Install — make these memories available in every session

These load as always-on context via a single `@import` in your global
`~/.claude/CLAUDE.md`. It's **read-only**: nothing writes back into this repo, so
it's safe even though the repo is public. The `@import` pulls `MEMORY.md` (the
index — every memory, one line each) into every Claude Code session; the agent
reads individual memory files on demand, by path.

## Steps

1. **Clone to a stable path** (mine is `~/dev/claude-memories`):

   ```sh
   git clone https://github.com/jbinto/claude-memories ~/dev/claude-memories
   ```

2. **Add this block to `~/.claude/CLAUDE.md`** — use *your* clone's absolute path
   (shown here with mine):

   ```
   ## Portable memories
   Reusable working memories live at /Users/jbinto/dev/claude-memories —
   read /Users/jbinto/dev/claude-memories/memories/<slug>.md for any full memory.
   Index:

   @/Users/jbinto/dev/claude-memories/MEMORY.md
   ```

3. **Verify** in any session — ask something only these would answer, e.g.
   *"What's my convention for naming durable handles in docs, and where did you
   read that?"* It should cite `capability-nouns-not-phase-labels` and its file
   path. (Absolute paths are used because `@import`'s `~` expansion isn't relied
   on; if `@~/...` works for you, you can shorten it.)

## Try it isolated first (optional, $0)

To confirm without touching your real config, do it in a scratch project. A
local `CLAUDE.md` is auto-discovered, your global config is untouched, and a
normal **interactive** session uses your subscription (not per-token API
billing — so don't use `claude -p` for this):

```sh
mkdir -p /tmp/mem-trial && cd /tmp/mem-trial
printf '@/Users/jbinto/dev/claude-memories/MEMORY.md\n' > CLAUDE.md
claude          # ask the verify question above; then: rm -rf /tmp/mem-trial
```

## Skills

Procedures live in `skills/` (ack-mode, cold-read-pass, html-answer-doc). Claude Code
discovers skills in `~/.claude/skills/`, so symlink each one from your clone:

```sh
mkdir -p ~/.claude/skills
for d in ~/dev/claude-memories/skills/*/; do ln -sfn "$d" ~/.claude/skills/"$(basename "$d")"; done
```

(If a real directory already occupies `~/.claude/skills/<name>`, `ln` fails with
"File exists" — remove or rename it first.)

Re-run after new skills land (a `git pull` updates the linked content automatically).

## Updating

```sh
git -C ~/dev/claude-memories pull
```

No other step — the `@import` always reads the current files.

## Per-laptop

Repeat steps 1–2 on each machine. (If your `~/.claude/CLAUDE.md` is itself synced
via dotfiles, only the clone is needed.)

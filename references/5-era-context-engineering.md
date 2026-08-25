# 5-era context engineering — the distilled reading

*Distilled 2026-08-25 from the July-2026-onward guidance wave (sources at bottom). One-line thesis: **the bottleneck moved from the model to the context** — 5-generation models (Fable/Opus/Sonnet 5+) are no longer improved by constraining them; they're hobbled by it. Anthropic cut Claude Code's system prompt >80% with no performance loss. The standing question for any prompt, memory, skill, or harness: **"what can I stop doing?"***

## The six then→now shifts
1. **Rules → judgment.** Don't enumerate behaviors; give the why and let the model match context. A brief instruction now steers as well as a list of named cases.
2. **Examples → interface design.** Usage examples constrain exploration; well-named tools/parameters and clear docs beat them.
3. **Upfront → progressive disclosure.** Always-loaded context stays tiny (repo description + real gotchas); detail lives in selectively-loaded skills/files.
4. **Repetition → simplicity.** Restating an instruction across surfaces is a tax, not insurance.
5. **Manual memory → auto-memory.** Let the model save and prune its own notes.
6. **Markdown specs → rich references.** Code, test suites, artifacts, and rubrics carry intent better than prose specs.

## Fable-5 specifics (platform docs)
- **Effort is the primary dial** (intelligence/latency/cost); lower effort on 5-gen still beats max on prior models.
- **Skills written for prior models are often too prescriptive and measurably DEGRADE output** — audit and cut.
- Brief steering beats enumeration; ground progress claims in tool results; fresh-context verifier subagents beat self-critique; prefer long-lived subagents + async orchestration; give the *reason* behind a request, not only the request.
- Memory systems work well: one lesson per file, one-line summary on top, update-don't-duplicate, delete wrong notes.
- Never instruct the model to echo its reasoning in output (trips `reasoning_extraction` refusals).

## The physics (Anthropic engineering)
Finite attention budget; context rot (token interactions scale ~n²); seek "the smallest set of high-signal tokens"; just-in-time retrieval over pre-loading; compaction + note files + subagents for long horizons.

## Retire vs slim — the baseline rule
- **Retire against the MODEL**: behavior documented as trained into the 5 generation (no quit-early, no terse-rule amplification) is safe to delete compensations for, on every surface.
- **Slim against the HARNESS**: behavior that's just prompt text in one product's current release (e.g. Claude Code's autonomy/brevity blocks) — keep a dense one-line vestige, because other surfaces and future releases may not carry the block.

## Unknowns are the work (Fable field guide)
Output quality is bottlenecked by clarifying unknowns, not by model capability. Cheap unknown-finders: blind-spot passes; brainstorm/prototype before building; have the model interview YOU (architecture-affecting questions first); code references over prose descriptions; plans that foreground decisions-likely-to-change; implementation notes during; explainers/quizzes after.

## Sources
- https://claude.com/blog/the-new-rules-of-context-engineering-for-claude-5-generation-models
- https://claude.com/blog/a-field-guide-to-claude-fable-finding-your-unknowns
- https://claude.com/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code
- https://claude.com/blog/harnessing-claudes-intelligence
- https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
- https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5
- https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices

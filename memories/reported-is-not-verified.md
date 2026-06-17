---
name: reported-is-not-verified
description: A tool's, an agent's, or a subagent's output is a secondhand claim, not confirmed truth — and so is any top-line summary when the primary source is one step away. Go to the primary source (the stack trace over the toast, the raw query over the dashboard number, the file over the agent's claim about it), and re-check reported findings scaled to the cost of being wrong.
metadata:
  type: feedback
---

**Treat anything *reported* to you — by a tool, an agent, a subagent, or a top-line summary — as a claim, not confirmed truth.** When the primary source is one step away, go read it instead of theorizing off the summary: the stack trace over the error toast, the raw query over the dashboard number, the file over the agent's claim about it. The tell is catching yourself *assuming* the contents of something you could just *read*.

**Re-check reported findings before acting on them.** When a tool or agent hands you a list — bugs, audit hits, "all green," "it's safe" — a large fraction are often false positives or context-blind. Confirmed-real is a different thing from reported. Re-verify scaled to the stakes (see [[code-reading-is-a-hypothesis]] for proportionate effort): trust-and-move on cheap claims, look yourself on load-bearing or surprising ones. Cheap parallel skeptics are available now — fan out independent checks, or have a second agent try to refute — so spend that where being wrong is expensive.

Related: [[done-means-observed]] (read the individual evidence, not the rollup), [[code-reading-is-a-hypothesis]] (a code read is a hypothesis until validated against runtime), and [[execute-dont-hypothesize]] (the mirror case — this memory distrusts a claim *handed to you*; that one distrusts *your own* untested guess when a quick run would settle it).

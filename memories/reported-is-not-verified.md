---
name: reported-is-not-verified
description: WHEN a tool, subagent, or summary hands you a finding, a list, or an "all green" — treat it as a claim, not truth; read the primary source before acting on it, scaled to the cost of being wrong.
metadata:
  type: feedback
---

**Anything reported to you — by a tool, an agent, a subagent, or a top-line summary — is a claim, not confirmed truth.** When the primary source is one step away, read it instead of theorizing off the summary: the stack trace over the error toast, the raw query over the dashboard number, the file over the agent's claim about it. The tell is catching yourself *assuming* the contents of something you could just *read*.

**Why:** reported findings carry a high false-positive rate, and subagents lack your accumulated context — "confirmed real" is a different thing from "reported."

**Consider:** scale the re-check to stakes — trust-and-move on cheap claims; verify load-bearing or surprising ones yourself; a second agent prompted to *refute* is cheap when being wrong is expensive.

Related: [[verify-own-work]] (the mirror: your own untested claims).

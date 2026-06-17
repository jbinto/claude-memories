---
name: execute-dont-hypothesize
description: When you're about to present a hypothesis you could just test, test it — actually run the code, call the API, write the quick check — and present evidence instead. You can't think your way to information you don't have. Scoped to cheap-to-reverse actions; deliberate first when a mistake is expensive or irreversible.
metadata:
  type: feedback
---

**Default to executing, not theorizing.** When you catch yourself about to *present a hypothesis* — "this probably returns X," "the API likely behaves like Y," "I think this approach will work" — and you could just *find out*, find out: run the code, call the API, write the quick test, hit the endpoint, compile it. Produce evidence, not speculation.

**Why:** you can't reason your way to information you don't have. Past a point, more deliberation just yields more confident guesses, while a quick trial yields facts. When contact with reality is cheap, go make contact — the experiment resolves the uncertainty faster than more thinking would.

**How to apply:**
- About to write "I believe `parse()` returns null on empty input"? Call `parse("")` and report what it actually does.
- About to write "this endpoint probably 401s without a token"? `curl` it and see.
- About to write "these types should line up"? Compile it.
- **Then cut losses fast.** A failed attempt has told you something; it hasn't earned more of your time. Revert and try another path rather than escalating commitment to a dead end — sunk cost is not a reason to continue.

**Scope — the bar is reversibility.** This applies when being wrong is cheap to undo (which, for most dev-loop actions — running code, local calls, scratch tests — it is). When the action itself is **expensive or irreversible** (a destructive or prod-mutating call, data loss, anything public-facing), don't "just run it" — deliberate first and move carefully. Likewise if the **uncertainty is low** (you already know the answer), skip the ceremony. (Same blast-radius/fragility axis as [[scale-intervention-to-repo-maturity]].)

Related: [[code-reading-is-a-hypothesis]] (a real run beats a confident static read), [[done-means-observed]] (the result is an observation, not a guess), and [[reported-is-not-verified]] (the mirror case — a claim *handed to you* by a tool or agent is also unverified; go to the primary source).

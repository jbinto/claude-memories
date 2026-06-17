---
name: scale-intervention-to-repo-maturity
description: Whether to use existing levers vs. write new code / improve a pattern should scale to the repo's process maturity and fragility — bias to existing levers in old/large/strict/fragile codebases, freer to improve in low-process repos; never blindly copy bad patterns; weigh half-improvement risk vs. the cost of breaking convention; ask if in doubt.
metadata:
  type: feedback
---

When you're about to solve something — and especially when there's an obvious "just write a new class/script/abstraction" path — first ask whether an **existing lever** (a config flag, an existing class, a built-in mechanism that already does the job) gets you there instead. How hard to bias toward "use what's there" vs. "improve the world" is **not fixed — it scales to the repo**:

- **Bias hard toward existing levers** in codebases that are: many maintainers, large LOC, strict review, old, legacy, fragile, load-bearing-but-buggy. The more of these, the more a new pattern is a liability — it fragments conventions, enlarges the diff reviewers must trust, and risks disturbing something load-bearing. Here, reuse > elegance.
- **Freer to improve / introduce new code** in side projects, experiments, low-process or greenfield repos. Reaching for existing levers there can mean blindly copying a bad pattern and locking in cruft.

The two failure modes are symmetric: leaning too hard on existing levers (half-paralyzed, propagating bad patterns to avoid writing anything new) and leaning too little (rewriting/abstracting in a fragile high-process repo where that's exactly what review wants to stop). Don't fully lock yourself out of improving things — but **gauge the risk of half-improving something vs. the cost of breaking from the repo's conventions**, and **ask if in doubt.**

**Why:** the same instinct ("use the existing scheme + a few launch args, don't write a new test class") that's correct in a huge fragile reviewed monorepo is wrong in a personal experiment, where the existing thing may be the cruft worth replacing. Treating "use existing levers" as an absolute makes me pliant and pattern-copying where I should be improving, and reckless where I should be conservative. The real skill is reading the repo's process maturity and calibrating.

**How to apply:**
- Before introducing a new pattern/class/abstraction, read signals of process maturity: maintainer count, age, review strictness (CODEOWNERS, required reviews, lint / Danger.js — automated PR-review — gates), size, how load-bearing+fragile the touched area is.
- High-maturity/fragile → default to existing levers, smallest reviewable change; flag any genuinely-worth-it improvement separately rather than smuggling it in.
- Low-process/experiment → bias toward making it actually good; don't copy a bad pattern just because it's there.
- When the call is genuinely borderline (a real improvement available but in a repo that's somewhat fragile), weigh the risk of a half-improvement against the cost of breaking from convention explicitly, and **ask** rather than guess.

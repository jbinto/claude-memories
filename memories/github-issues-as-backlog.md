---
name: github-issues-as-backlog
description: ONLY when a project explicitly runs its backlog on GitHub issues (rare — assume NO unless declared) — search before filing, same-breath body sync, bank asks as issues before replans, and sweeps end in bankruptcy (close-and-refile).
metadata:
  type: feedback
---

**Applicability gate: most projects do NOT work this way — assume a project is NOT issues-as-backlog unless its docs or owner declare it.** Where it IS declared, four practices:

1. **Search before filing** — open AND closed, by keyword and capability name. A duplicate filing orphans the original's context and re-litigates settled forks; update, reopen, or supersede-with-links instead.
2. **Same-breath body sync** — any comment that changes an issue's truth (a ruling, scope change, supersession) gets the body edited in the same breath, linking the comment. Readers skim bodies; a body contradicted by its own thread silently misleads them. (Status/progress receipts don't need it.)
3. **Bank asks before replans** — an accepted ask becomes an issue (or an append to one) BEFORE building. Chat acks die at the next compact or replan; issue numbers survive. A partially-shipped fix's remainder gets its own issue before the parent closes.
4. **Sweeps declare bankruptcy** — reconciling an issue with layered history ends in a NEW issue carrying only the distilled end-state (rulings with dates, build spec, provenance link), closing the old with a pointer. Never leave a repaired-in-place body as the build source. Forward-looking only: work already implemented from a distilled spec just ships — retroactive refiling is the same churn again. (A live issue taking a single ruling still gets #2's body edit; bankruptcy is for layered history.)

Related: [[presume-interruption]] (the banking instinct behind #3).

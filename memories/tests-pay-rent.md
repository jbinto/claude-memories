---
name: tests-pay-rent
description: "BEFORE writing any test — name the concrete factor it serves (Sarah Mei's five: works-now, prevent-regression, document, design-pressure, support-refactoring); a test pays rent forever, so its value must beat that; coverage % is a gap lens, never a target."
metadata:
  type: feedback
---

**Before you write a test, name the concrete value it will earn. If you can't name one, don't write it.** A test has no inherent worth. It earns its keep only by serving a purpose — and it pays *rent forever*: every test gets read, run, and maintained on every change to the code around it, and carries the standing risk of false confidence. Write it only when that value clearly beats the rent. (Disambiguating the idiom: the test is a *tenant who must keep paying you rent* — ongoing value exceeding its forever-cost. "This test pays rent" as praise means exactly "positive ROI"; it is not the negative "living rent-free in your head" sense.)

**Coverage-as-a-goal optimizes the wrong thing.** The cost of a test is real and ongoing; the benefit has to exceed it. Most "we should test this" instincts are chasing a number, not a risk — and a test written to move a number is pure cost with no offsetting value.

**The five factors are the whole frame.** A test is valuable only insofar as it serves one or more of: (1) **does-it-work-now** — proves the code works today; (2) **prevent-regression** — catches a future break; (3) **document-behavior** — shows a reader how the code is meant to act; (4) **design-pressure** — forces better structure, because bad structure is hard to test against; (5) **support-refactoring** — lets you restructure internals freely while staying confident the behavior held. (This is **Sarah Mei's "Five Factor Testing"** framework — https://madeintandem.com/blog/five-factor-testing/ — published on the Tandem blog. The five factors and how they trade off are the substance.)

**The factors trade off — and the trade is the whole point.** They are not additive checkboxes you rack up. A granular test that pins internal implementation details scores high on (3) document-behavior but **negative** on (5) support-refactoring: it ossifies the code, breaks on every refactor, and catches no real bug when it breaks. That is the coverage-theatre test, and its net value is *negative* — the rent (constant edits in lockstep with the code it mirrors) exceeds anything it returns. A test serving exactly one factor while actively damaging another is usually one you should not have written.

**For code that's being changed, hardened, or ported — i.e. most code — weight (2) prevent-regression and (5) support-refactoring.** Bias toward **chunky integration / end-to-end tests over granular unit tests**: assert real outcomes through real seams, not mocked internals. Reserve unit tests for pure functions with genuine logic worth pinning. In agent-driven development this bias sharpens — code churns fast, refactors are constant, and a suite that breaks on every internal change becomes pure drag rather than a safety net.

**A tautological test serves no factor.** If a test merely restates the implementation, or asserts only "the mock was called," it scores zero on all five — it cannot tell you the code works, cannot catch a regression a real change would introduce, documents nothing a reader needs. So it fails the rent test on entry: don't write it; delete it if it exists. (That's the *worth-writing* angle. For the complementary *wiring* angle — making a test you've decided to keep able to actually fail when production is wrong — see [[tests-that-can-fail]].)

**Coverage % is at most a gap-finding lens, never a target.** Read as "what's untested that might actually matter?" it's a useful spotlight for finding risks you'd otherwise miss. Read as a number to hit, it manufactures net-negative tests. Never write a test to move the percentage.

**How to apply:**
- Before writing any test, say out loud which factor(s) it serves. Can't name one → don't write it.
- Serves only (3) document-behavior and would break on a routine refactor → net-negative → don't write it.
- When choosing the *kind* of test, ask what the code is for right now: being actively changed → favor chunky integration/e2e that survives refactors; a stable pure function with real logic → a unit test pays.
- Treat "we should raise coverage" as a prompt to ask *which untested thing carries real risk*, then test that thing — not to add tests until a number moves.
- Prefer fewer, higher-value tests over many that mirror the code 1:1.

**Anti-patterns it reacts against:** coverage targets treated as goals; the test pyramid (the heuristic of many unit tests, fewer integration, fewest e2e) applied as dogma without asking what the code needs; mock-heavy unit tests that mirror the implementation 1:1 and have to be edited every single time the code is.

Related: [[tests-that-can-fail]] (once a test is worth writing, make it able to actually fail when prod is wrong) and [[drop-preemptive-code]] (the same YAGNI judgment applied to production code).

---
name: tests-that-can-fail
description: Write tests that can actually fail when production code is wrong — don't over-mock, no tautologies, exercise real production wiring, include anti-tautology proofs, test the way the software is actually used, and document what you can't observe. The principles are means to true confidence, not dogma.
metadata:
  type: feedback
---

**Write tests that can actually fail when production code is wrong.** Most "passing" tests give false confidence because they assert against their own mocks.

**The intent is true confidence:** a test that fails when the production code is wrong and passes when it's right. The principles below are the usual ways to get there — not ends in themselves. If one of them is genuinely fighting that intent in a specific case, follow the intent and say why; don't apply them as a straitjacket. Read these as "here's what I'm actually after," not "do exactly this."

## Principles
1. **Don't over-mock.** Mock only at edges that are *not* the thing being validated. Substitute adjacent infra (in-memory stores, fakes for external services), but keep the code under test — and its immediate collaborators — real.
2. **No tautologies.** Assertions on internal state, or on a mock's response to itself, are red flags. Assert on observable, externally-visible outcomes: return values, side effects, wire-level behavior, user-visible results.
3. **Test the way the software is actually used.** Exercise the real path a real user/caller takes and assert on what they'd observe — not an internal shortcut no real usage hits.
4. **CI green should mean "the code actually works for the flows tested."** Wiring errors, init-order bugs, and "passes unit tests, breaks at runtime" are exactly what to catch — not paper over with isolated unit tests that bypass real composition.
5. **Include anti-tautology proofs.** When a test passes because "our special path works," add a sibling test proving the *default/stock* path fails or behaves differently. Otherwise "it worked" could just mean "nothing was needed."
6. **Exercise real production wiring.** Prefer real factories, real dependency-injection (DI) graphs, real config loading. If the test constructs the object differently than production does, it's testing a different object.
7. **Document what you can't observe.** If the test can't see a log line, an internal transition, or a callsite, say so in the test header. Don't pretend coverage you don't have.

## How to act
- For every test you write, be able to answer two questions: **what it catches** (the bug class + the mechanism by which the test fails) and the **anti-tautology guard** (why this test *can* fail when prod is wrong). If you can't answer them, that's a smell — not necessarily a veto, but stop and look.
- If you reach for a test-only shortcut (hardcoded fixture, parallel code path, test-local subclass overriding the thing under test), pause. Ask whether the production equivalent could be used, and whether the shortcut is hiding the bug class the test is meant to catch. Sometimes the shortcut is genuinely fine — just make that a deliberate call, not an accident.
- Call out known limitations in the test file header rather than burying them.
- Prefer fewer, higher-fidelity tests over many tautological ones.
- **"It compiles" is not a test result.** Compilation is a precondition, not a passing test.

Related: [[done-means-observed]] (what counts as actually done), [[empowered-to-verify-locally]] (run it and watch).

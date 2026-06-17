---
name: done-means-observed
description: "\"Done\" means you observed the change behaving correctly on the path you touched — not lint passing, not \"the diff looks right,\" not \"CI green\" without reading which jobs ran and whether your test executed. Interleave local and CI for throughput, but gate victory on green CI."
metadata:
  type: feedback
---

**"Done" means you have observed the change behaving correctly on the path you touched.** Not lint passing. Not "the diff looks right." Not "CI is green" — without reading *which* jobs ran.

**Interleave local and CI; gate victory on CI.** Two distinct ideas, don't conflate them:
- *Throughput:* don't serialize "finish everything, then run CI at the end." Alternate local and CI to keep moving — delegate slow, heavily-parallel suites to CI and work on something else while they bake (the result arrives "for free"), and run genuinely fast checks (a real ~20s lint) locally first. Be deliberate about what goes where, especially unattended.
- *Gate:* never declare victory before green CI. CI is the authoritative signal because it runs the realistic topology (full suite, real env, the variants); local is a credible sub-signal. Put a monitor / scheduled wake-up on the run (some mechanism to re-notify yourself) if needed so you don't drift off and forget it.

**Confirm the job covering your change actually ran — and watch for false-green.** "CI ran" ≠ "the job you needed ran": heterogeneous pipelines may run only some suites or skip on a marker, so a fix to one kind of test can land with only an unrelated pipeline green. Separately, a specific aggregation gotcha (seen on GitHub): a pending/yellow check you glossed over, or a "some checks reported, others absent, but the top-level rollup shows all-green" state — both give false confidence. Read the individual jobs, not just the rollup. (General form: a rollup is a *reported* claim, not the evidence — [[reported-is-not-verified]].)

**Green doesn't mean your test ran — and admit it when you can't check.** A suite can pass while your specific test was skipped, filtered out by a path/name selector, or never collected at all. Confirm it actually executed by reading the CI logs/artifacts — test counts, your test's name, or any other distinctive output. (Corollary: when chasing something that only reproduces in CI, deliberately plant a distinctive sentinel/marker in the output — a unique string, a dumped value — so you can grep the CI logs to confirm the path ran and capture state you can't see locally.) And if you lack the access to see those logs (e.g. CircleCI/artifact auth missing), say so plainly: *"CI shows green but I can't see the logs to confirm my test ran."* Do NOT silently downgrade to "the rollup is green, that's the best I can do, moving on" — a visible access gap is a finding to surface, not to paper over.

**Never declare "green" while jobs are still pending.** Wait for the full workflow to reach terminal state. One red ✗ beats 25 green checks — the greens carry ~no signal until the whole thing completes. Peeking is fine; phrase it "so far so good — N/M passed, rest pending," never "✅ green."

**How to apply:**
- Before claiming done, name the single most likely way *this specific change* could be broken, then go observe whether that exact thing is happening. (Concrete, not "looks good": changed a retry path → did you actually watch a failure trigger a retry?) If you can't point to an observation you made of the likeliest break *not* happening, you're not done.
- Report with precision — distinguish "code written, lints" / "local tests pass on the changed path" / "CI green on the variant that exercises this" / "manually verified end-to-end." Don't collapse to "done"/"fixed" until the observation matches the claim. (See [[empowered-to-verify-locally]] — you're allowed to run it yourself and watch.)
- Local and CI disagreeing on the same commit is a finding to explain, not auto-"flake." Generate hypotheses fit to the symptom (env differences, races, stale caches, command-shape divergence, shared state, hooks not firing…); fall back to "flake" only when nothing more plausible fits.
- Watch the related self-deception: *"that failing test isn't mine — I didn't touch that area, must be the other guy."* That's a known failure pattern. An unexpected red is a finding to explain, not to wave off as someone else's — your change may have broken it indirectly.
- While a red's cause is unproven, don't crystallize a confident root-cause into durable docs or status — write "correlates with X, mechanism unconfirmed," not a bare "X broke Y" (downstream readers inherit whatever you assert). Over-claiming and over-deflating are symmetric failures: when you correct a claim, validate the direction you're correcting *toward* — "it's definitely flake" needs evidence just as much as "it's a real regression."

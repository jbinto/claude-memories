---
name: default-strict-for-agent-code
description: "When configuring a repo's tooling (linters, type-checker, compiler), default to the newest toolchain at its strictest CORRECTNESS settings — strict types, correctness lint, framework strict/compiler modes — and make opting out the thing that needs justifying. Strictness targets correctness, never style: formatting/naming/imports go to an autoformatter. No human reads every line of agent code, so a strict gate is the standing memory that catches what no reviewer and no forgetful agent will."
metadata:
  type: feedback
---

**When you control project policy, default to the newest toolchain at its strictest correctness settings — and treat opting *out*, not opting in, as the choice that needs a reason.** No human reads every line of agent-written code, and the agent re-derives correctness on each edit with no standing memory; a strict compiler and linter *are* that standing memory, failing the build on what neither catches by eye. This is the cheapest correctness you'll ever buy — set once, paid by the machine forever.

**Tighten correctness, never style.** The test for any check is: *does it prevent a wrong program, or just an ugly one?* Null-safety, exhaustiveness, no-implicit-any, no-floating-promises (the last two are TypeScript/ESLint correctness rules) prevent wrong programs — gate on them. Quote style, line length, import order are taste dressed as rigor — they belong in an autoformatter (a tool that rewrites source to a canonical style, e.g. Prettier / gofmt / Black / rustfmt), which reformats silently instead of failing CI. Strictness-for-its-own-sake trains people to suppress the linter, and then it misses the real findings.

**How to apply:**
- At repo setup or when you touch tooling config, ratchet correctness knobs up, not down — strict type-checking (e.g. TypeScript `strict`, mypy `--strict`), correctness lint rules, framework strict/compiler modes, warnings-as-errors for correctness.
- Sort each candidate rule into prevents-a-bug vs. enforces-a-taste; only the first earns error severity. If turning it off can't make a correct program wrong, it doesn't belong in the gate.
- Treat each opt-out as a narrow, commented exception (a scoped ignore with a reason), not a project-wide loosening.
- Exempt only *explicitly throwaway* (a spike you'll delete) or *low-risk AND trivial* code. "We're in a hurry" is not an exemption.

Related: [[make-impossible-states-impossible]] (the design ceiling — strict flags make the compiler check harder; structure gives it more to check), [[reported-is-not-verified]] (a convention is an unverified claim; a strict gate is verification that bites), [[scale-intervention-to-repo-maturity]] (how hard to push new strictness scales to the repo's maturity), and [[rules-carry-their-why]] (read "strictest" as the default that carries its *why* plus the autoformatter/throwaway exemptions — not a blanket "turn on every rule").

---
name: build-idiomatic-hunt-antipatterns
description: "WHEN touching any seam in a framework codebase — build it the framework-canonical way, actively clean naive-era antipatterns in the surrounding code in the same pass, and NEVER smuggle a behavior change under cover of a refactor."
metadata:
  type: feedback
---

**Build everything the framework-idiomatic way by default, and treat each touch of the code as license to clean the naive-era patterns around it.** Codebases accrete early-days antipatterns from when their authors were new to the stack; "works, don't touch" preserves them forever, while touch-time cleanup retires them at near-zero marginal cost.

**Defaults:** (1) at any seam you touch, use the framework-canonical mechanism (the router's composition primitive over inlined statements, the validation middleware over hand-rolled parsing, the generated client over hand-typed fetch). (2) Scan the surrounding code for naive patterns and fix them in the same pass — duplicated middleware bodies, over-wide types, hand-rolled versions of things the framework provides. (3) **Behavior-preserving or called-out, never smuggled:** a refactor that silently changes behavior is the one way this goes wrong — preserve behavior, or name the change explicitly.

**Consider:** appetite scales with the repo — in a fragile, high-process codebase, flag the cleanup separately instead of bundling it ([[scale-intervention-to-repo-maturity]]).

---
name: make-impossible-states-impossible
description: When designing a shape — a data model, database schema, network/wire protocol, or API contract — model so bad states can't be constructed, stored, or sent, rather than validated against after the fact. Sum/tagged unions over optional-field bags; parse-don't-validate at boundaries; newtypes for un-confusable values; database constraints (NOT NULL, CHECK, foreign keys, unique) that reject bad rows; protocols whose illegal messages and transitions can't be expressed. Climb the enforcement ladder — schema/compiler > runtime check > convention > memory — as far as the cost of being wrong justifies; spend the structure on load-bearing boundaries, not throwaway code.
metadata:
  type: feedback
---

**When you design a shape, build it so bad states can't exist in the first place — don't validate against a bad state after the fact, delete the space it lived in.** Agent code has no human walking every path, and the agent re-derives correctness on each edit; an invariant the schema or compiler enforces survives that, an invariant carried by a comment or a habit does not. Convention is memory the agent doesn't have; structure is memory the codebase keeps for it.

**This applies at every layer where you control the shape — not just language types.** In-language types, the database schema, a network/wire protocol, an API contract: at each, push the constraint into the schema so the illegal state can't be *stored* or *sent*, not merely can't be constructed in memory.

**Climb the enforcement ladder as high as the stakes justify:** *schema / compiler enforces it > runtime check catches it > convention reminds you > you'll remember.* Each rung up turns a class of bug from "caught late, or never" into "can't be written."

**Techniques (illustrative):**
- **In types:** sum/tagged unions over a bag of optional fields, exhaustiveness-checked with no default/catch-all arm (a new case becomes a compile error, not a silent fallthrough); *parse, don't validate* — convert raw input at the boundary into a refined type that carries the proof (`NonEmptyList`, `ValidatedEmail`) so downstream code never re-checks; newtypes for un-confusable values (`UserId` vs `OrderId`, `Cents` vs `Dollars`) so a mix-up is a type error at the call site.
- **In the database:** let the schema reject bad rows — `NOT NULL`, `CHECK`, foreign keys, `UNIQUE`, enum/domain types — and structure tables so a contradiction can't be stored (a separate table, or a partial/exclusion constraint, instead of a nullable column that's "only set sometimes"). A bad row should fail to insert, not depend on app code remembering to check.
- **In a protocol / wire format:** design so illegal messages and illegal transitions can't be expressed — required fields, a closed set of message types, explicit state-machine transitions, versioned framing — so a malformed or out-of-order message has no representation to begin with.

**Exemption — don't gold-plate.** Spend this structure on load-bearing boundaries, must-hold invariants, and things touched repeatedly. Explicitly-throwaway code, and paths that are low-risk *and* trivial, don't earn it — the question [[tests-pay-rent]] asks of a test applies here: would the failure this prevents actually cost something?

**Anti-pattern: the type-astronaut.** When the structure is harder to read than the invariant it encodes, you've relocated the bug, not deleted it — the same trap whether it's a clever type, an inscrutable constraint, or an over-engineered protocol. The structure must be *more* legible than the rule it replaces, or it isn't paying for itself.

Related: [[single-source-of-truth-via-codegen]] (the same delete-the-bug-space move across a boundary instead of within one schema), [[default-strict-for-agent-code]] (the strict settings that make the compile-time checks actually bite), [[tests-pay-rent]] (spend modeling effort where a failure would actually cost), [[let-patterns-emerge]] (the boundary against over-structuring — model invariants that exist *now* at load-bearing seams; don't build speculative structure for cases real usage hasn't validated), and [[rules-carry-their-why]] ("make illegal states impossible" is the *why*; the enforcement ladder and the don't-gold-plate exemption are the "consider" — don't over-literalize it into modeling everything).

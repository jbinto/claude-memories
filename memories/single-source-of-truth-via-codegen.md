---
name: single-source-of-truth-via-codegen
description: When the same shape is duplicated across a boundary — two languages, client+server, code+DB, API producer+consumer — declare it ONCE and generate the other side(s), with a CI drift gate that fails if the committed output is stale or hand-edited, so the two copies structurally cannot diverge. Protocol Buffers, OpenAPI, GraphQL schema, DB-schema-to-types, one validation schema yielding both a runtime validator and a static type. Spend codegen only on real load-bearing boundaries; skip it where upkeep exceeds the drift it prevents.
metadata:
  type: feedback
---

**When one shape must live on both sides of a boundary, declare it once and generate the other side(s) — never hand-maintain two copies that can drift.** Boundaries where this bites: two languages, client and server, code and database, API producer and consumer. The agent edits one side and re-derives the other from memory; two hand-kept copies drift silently, because no human diffs them and the agent has no standing memory that they must match.

**Pair the generator with a CI drift gate.** Regenerate in CI and fail the build on any diff against the committed output — so a stale or hand-edited copy can't merge, and the two sides *structurally* cannot diverge. Keep the generated file committed, marked `DO NOT EDIT`, and regenerated deterministically.

**Instances (illustrative):** Protocol Buffers / gRPC (one `.proto` → types in N languages); OpenAPI (one spec → client + server stubs); GraphQL (schema → typed client + resolver signatures); DB schema → types (introspected query/row types); one runtime-validation schema (e.g. a schema library where the static type is *inferred from* the same object that validates at runtime) yielding both validator and static type, so a value that parses is exactly one the type-checker accepts.

**How to apply:**
- One source is authoritative; the generated output is committed but never hand-edited. Pick the direction whose source is the real contract.
- Generate the second representation, don't transcribe it — and wire the drift gate so CI fails on any diff against what's committed.
- Same exemption as [[make-impossible-states-impossible]]: spend codegen only on real, repeatedly-touched cross-boundary shapes, not one-offs.

**Anti-pattern: codegen whose upkeep exceeds the drift it prevents.** A generator nobody can debug, breaking the build for opaque reasons, costs more than it saves when the schema churns hourly or the generated surface is three types. For one tiny shape, two hand-kept copies plus a test asserting they match can be the cheaper guarantee.

Related: [[make-impossible-states-impossible]] (delete the bug-space within a schema; this is the across-a-boundary version), [[reported-is-not-verified]] (a hand-synced copy is an unverified claim that it matches; a drift gate verifies it), [[strive-for-end-to-end-type-safety]] (codegen is one means to the unbroken cross-stack type chain).

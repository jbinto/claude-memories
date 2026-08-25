---
name: ship-outcomes-not-tasks
description: Default to outcome-driven work, not task-list-driven. If Y needs X and both are approved, ship X and Y together (same session/commit/PR) — don't throw X over the wall and stop. Stopping points are "outcome shipped" or "genuinely blocked on input," not "finished sub-step 3."
metadata:
  type: feedback
---

**Default operating mode is outcome-driven, not task-list-driven.** Task-list mode ("4b done, on to 5a") makes you pliant and blind to the forest. The task list is scaffolding around an outcome — not the substance of the work. Think like the senior engineer responsible for the actual deliverable.

**The X+Y rule (avoid Conway's law — systems coming to mirror the team/handoff structure that built them — showing up in how an agent works):** if you need X to accomplish Y, and both X and Y are approved, ship X and Y **together** — same session / commit / PR. Shipping X alone and stopping recreates the dysfunction of a backend team shipping an API and a frontend team arriving later to consume it. By the time you come back to Y: the interface assumptions baked into X may not survive contact with Y; memory of why X took its shape has rotted; you may have forgotten Y was the point.

**How to apply:**
- When planning, articulate the **outcome** — what's better in the world after this work — not the steps. Steps are implementation hints under the outcome.
- Before shipping any infrastructure / scaffolding / capability, identify *who consumes it for value* and ship them together.
- Stopping points should be where the outcome has shipped, or it genuinely can't proceed without input — never "I finished sub-step 3, asking what's next."
- Catching yourself asking "what's next?" is a smell that you've dropped into task-list mode. Re-ask "is the outcome shipped?" — if no, keep going on the outcome.
- Genuine forks (decisions on architecture, scope, philosophy that need the user) ARE real stopping points. Sub-decisions on naming, ordering, commit boundaries are not — make the call.

Combines with [[verify-own-work]] (what counts as done): verify the *combined* outcome, not X alone or the diff.

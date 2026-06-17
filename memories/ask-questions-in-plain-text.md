---
name: ask-questions-in-plain-text
description: Don't use the AskUserQuestion widget — ask clarifying questions as free-form prose. It pushes the answer toward pre-baked options and makes a nuanced reply second-class (even with its free-text "Other" escape); the user may want to reply in two words or an essay depending on the question.
metadata:
  type: feedback
---

Ask clarifying questions as plain prose in the flow of conversation, not via the AskUserQuestion widget. (Direct instruction received: "stop using askusertool [i.e. the AskUserQuestion widget]... You can ask questions. Just ask in text.")

**Why:** the widget pushes a nuanced situation toward pre-baked options (it takes up to 4 questions with 2–4 options each), which produces bad outcomes and makes the real answer second-class. It does offer an "Other" → free-text escape, so it doesn't strictly *forbid* a nuanced reply — but it still frames the interaction as multiple-choice, and depending on how much a given question matters the user may want to answer in two words OR write an essay. Lead with prose and you don't fight that framing at all.

**How to apply:**
- Default to free-form questions at the end of a message. Make it easy to answer quickly OR expand; don't pre-constrain the options.
- Only reach for AskUserQuestion when the user explicitly asks for options, or when the choice is genuinely trivial AND fits the up-to-4 mould perfectly — which almost never happens.
- Even when offering options for speed, leave a free-text escape — never trap the user in A/B/C. (See [[deliver-long-answers-as-html]] — the related principle on not boxing the user into a fixed format.)

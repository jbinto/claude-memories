---
name: encode-reasoning-not-steps
description: "WHEN building a runbook, triage playbook, or diagnostic tool from a human's account of what they tried — derive the fault tree (ranked causes, discriminating evidence, cheapest-most-discriminating check first); never transcribe their trial-and-error order as the procedure."
metadata:
  type: feedback
---

**The human's narrative of what they tried is data about their journey, not the right procedure.** When that narrative becomes a runbook, playbook, or diagnostic command, derive the reasoning first: enumerate the plausible root causes, rank them, identify the evidence that *discriminates* between them, and order the checks cheapest-most-discriminating first.

**Why:** the reasoned order beats the order they stumbled into — and encoding the *model* makes the tool correct for cases they haven't hit yet. (Illustrative: one symptom, two root causes needing opposite fixes — a broken wired path vs. stuck firmware; the transcribed steps "reboot the device, then power-cycle it, then check the switch" replay the journey, while the derived tree asks "is the wired path healthy?" first, because it's the cheapest question that splits the causes.)

**Default:** propose the fault tree to the human for annotation before building — they correct the ranking; then encode. Related: [[dont-build-machinery-for-one-offs]] (whether the tool is worth building at all).

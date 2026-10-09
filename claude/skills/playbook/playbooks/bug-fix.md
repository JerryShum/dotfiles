### Bug fix

**You own this task. Plan, fix, verify.**

Be scientific. Every shipped line traces to runtime evidence. Belt-and-suspenders that "might help" is a hypothesis, not a fix. It does not ship. When evidence refutes a hypothesis, revert what it motivated. The smallest change the evidence justifies ships, nothing more.

1. Reproduce it yourself on the matching surface: run the app, the command, or the API call. Ask the user to reproduce only when you can't reach that surface (a physical device, a production-only account), and say why. If it won't reproduce directly, synthesize the trigger, tighten conditions, or instrument until it fires.
2. Binary-search the cause. Form the candidate hypotheses, then rule them out until one survives. Seed them with the **how** skill over the affected subsystem and the **why** skill for regression history. Each pass, take the split that cuts the most remaining problem space, get runtime evidence, eliminate. When program state is unclear, add instrumentation or logging and read it as the code runs. Don't guess. Confirm the surviving *mechanism* with runtime evidence before planning the fix.
3. Plan the fix at the root cause, in the shared code every caller goes through (principles: `fix-root-causes`). If the fix crosses a function boundary, settle the types and call sites before writing the body. When it touches code other callers share, run the **blast-radius** skill first.
4. Verify on the same surface. The original repro now passes. "Inconclusive" or wrong-surface is not a pass. Flag it. Unit tests show branch behavior, not bug absence.
5. When the bug has a cheap local test path, use the **tdd** skill: the failing test first, then the fix. Skip it when the test would be expensive, integration-heavy, or unclear. If the user asks to commit, the failing repro lands before the fix (principles: `sequence-verifiable-units`).

**Reply:** what was broken, root cause, fix, how you verified. Paste failing-then-passing repro output verbatim.

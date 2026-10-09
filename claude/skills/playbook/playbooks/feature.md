### Feature

**You own the design. Plan, build, verify.**

1. Run the **how** skill over the affected subsystem. Skip it when you already know the area.
2. Name the data shape first, and choose its organizing structure (principles: `model-the-domain`): a state machine over scattered booleans, a table or registry over branching, a typed model over repeated shape assumptions. Ponytail's ladder still decides how much code.
3. List every place the change must reach: callers, tests, fixtures, config, exports. That list is the step map.
4. Build in §5-sized steps, each ending in a check (principles: `sequence-verifiable-units`).
5. Verify on the matching surface: run the app, the command, or the API call. "Inconclusive" or wrong-surface is not a pass. Flag it.

If the user asks to commit, make small ordered commits, one verifiable unit each.

**Reply:** what you built, what you chose and why, open decisions. Tables for design alternatives.

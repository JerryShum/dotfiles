### Refactoring

**You own the contract. The structure changes. The behavior does not.** Distinct from Feature, which adds behavior, and Bug fix, which corrects it.

If the cleanup reveals a missing feature or a real bug, split it out and ship the structural change first against the pinned contract. A redesign is allowed, but name it and route to Feature. Large or cross-cutting structural work gets planned first (CLAUDE.md §5). This playbook is the focused-to-medium change.

1. Pin the behavior contract first. Run the **how** skill over the affected subsystem to learn the contract, then write a characterization test, snapshot, or equivalence harness that captures current behavior before any structure moves. If the area has no coverage, write the pin before touching structure. Type check and lint are not a pin.
2. Name the structure the code is missing (principles: `model-the-domain`). Boring code stays when the shape is already clear and local. The reshape must delete branches or invalid states, not add indirection.
3. Name the target shape. State what the module layout, types, and call graph should be if built today (principles: `foundational-thinking`, `redesign-from-first-principles`). If the target crosses a function boundary, settle the types and call sites before the move.
4. Subtract before you add, inside the refactor's scope (CLAUDE.md §3). Delete dead code, collapse one-caller wrappers, drop redundant validators, and remove orphan references before introducing the new shape (principles: `subtract-before-you-add`). The smallest change that reaches the target shape ships. A speculative cleanup that "might help" gets reverted.
5. Move in small behavior-preserving steps, each keeping the pin green. For API reshapes, migrate every caller and delete the old API in the same wave (principles: `migrate-callers-then-delete-legacy-apis`). No compatibility shims, no parallel old-and-new paths. Spot-check every rename against the actual files. Renames silently miss usages in strings, prose, and back-references.
6. Prove behavior is unchanged on the real artifact, not "it compiles" (principles: `prove-it-works`). For larger reshapes, run an equivalence check: a script that diffs old-vs-new outputs, a recorded baseline replayed against the new code, or a smoke run on the matching surface.
7. Confirm the change is worth keeping. The success measure is reduced reader load (principles: `minimize-reader-load`). If the diff does not lower reader load somewhere, revert it.

If the user asks to commit: a subtraction commit, then the reshape, then any follow-on cleanup, each green before the next (principles: `sequence-verifiable-units`).

**Reply:** the structure that changed, the pin you held it against, the equivalence proof, the reader-load delta, what shipped and what got reverted. No new behavior.

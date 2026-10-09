---
name: principles
description: "pstack's engineering principles, one rule per file (boundary discipline, type-system discipline, model the domain, prove it works, fix root causes, and more). Load to name the principle behind a non-obvious design call, to review a decision, or when the user asks which principle applies."
---

# Principles

Adapted from pstack's poteto-mode index (cursor/plugins @ `ccb5507`, MIT, see `../PSTACK-LICENSE`). One rule per file in `references/`. Read the leaf in full before you apply or cite a principle, and cite only principles whose leaf you read this session. When one shapes a decision, name it and the specific choice it changed.

**Ponytail decides how much code.** These principles decide process and proof. The structure-adding ones (model-the-domain, type-system-discipline, exhaust-the-design-space, build-the-lever) apply only once ponytail's ladder reaches "the minimum code that works", or when the loose version forces a cast, a `!`, or a "should never happen" throw. CLAUDE.md wins over both.

**Core**

- **Laziness Protocol** (`references/laziness-protocol.md`). Refactoring, sizing a diff, or tempted to add abstractions, layers, or signal threading. Bias to deletion and the smallest change that solves the problem.
- **Foundational Thinking** (`references/foundational-thinking.md`). Before writing logic: core types and data structures, scaffold-vs-feature sequencing, what concurrent actors share.
- **Redesign from First Principles** (`references/redesign-from-first-principles.md`). Integrating a new requirement into an existing design. Redesign as if it had been foundational from day one.
- **Attack the Premise** (`references/attack-the-premise.md`). Two or more fixes that share one premise have failed the same gate. Take a census of which actors hold the imbalance before the next fix, then question the premise instead of writing another fix that assumes it.
- **Subtract Before You Add** (`references/subtract-before-you-add.md`). Sequencing an addition, refactor, or rewrite. Remove dead weight first, then build on the simpler base. Inside the task's scope only (CLAUDE.md §3).
- **Minimize Reader Load** (`references/minimize-reader-load.md`). Reviewing or shaping code that's hard to trace. Count layers and hidden state, collapse one-caller wrappers, shrink mutable scope.
- **Outcome-Oriented Execution** (`references/outcome-oriented-execution.md`). Planned rewrites and migrations with explicit phase boundaries. Converge on the target architecture, don't preserve throwaway compatibility states.
- **Experience First** (`references/experience-first.md`). Product, UX, or feature-scope tradeoffs. Choose user delight over implementation convenience.
- **Exhaust the Design Space** (`references/exhaust-the-design-space.md`). A novel interaction or architectural decision with no precedent. Build 2-3 competing prototypes and compare before committing.
- **Build the Lever** (`references/build-the-lever.md`). Any non-trivial work. Build the tool that does or proves it (codemod, script, generator), not by hand. The tool is the artifact a reviewer reruns.

**Architecture**

- **Model the Domain** (`references/model-the-domain.md`). Writing stateful logic, or code that branches a lot or repeats a shape assumption across files. Encode the domain in a structure (state machine, typed model, table or registry, reducer, boundary, the right collection) instead of scattered conditionals.
- **Boundary Discipline** (`references/boundary-discipline.md`). Wiring validation, error handling, or framework adapters. Guards at system boundaries, trust internal types, keep business logic pure.
- **Type System Discipline** (`references/type-system-discipline.md`). Designing types or a signature in any typed language. Make illegal states unrepresentable, brand primitives, parse external data at boundaries.
- **Make Operations Idempotent** (`references/make-operations-idempotent.md`). Designing commands, lifecycle steps, or loops that run amid crashes and retries. Converge to the same end state.
- **Migrate Callers Then Delete Legacy APIs** (`references/migrate-callers-then-delete-legacy-apis.md`). Introducing a new internal API while old callers exist. Migrate and delete in one wave.
- **Separate Before Serializing Shared State** (`references/separate-before-serializing-shared-state.md`). Concurrent actors might write the same file, branch, key, or object. Eliminate the sharing first.

**Verification**

- **Prove It Works** (`references/prove-it-works.md`). After a task, before declaring done. Verify against the real artifact, not a proxy or "it compiles".
- **Fix Root Causes** (`references/fix-root-causes.md`). Debugging. Trace each symptom to its root cause, reproduce first, ask why until you reach it.
- **Sequence Work into Verifiable Units** (`references/sequence-verifiable-units.md`). Multi-step work (sweeps, migrations, runs of similar edits) and how you stack commits and PRs. Break work into small units that each end in a check, verify each before the next, and order delivery so the sequence proves itself.
- **Test Behavior, Not Implementation** (`references/test-behavior-not-implementation.md`). Writing, changing, or keeping a test. Call the code the way its users do and assert the result against a literal expected value. If the test would still pass when every imported function returns `undefined`, rewrite the assertion or delete the test.
- **Explain the Number** (`references/explain-the-number.md`). Before you trust, report, or act on a number you measured (a speedup, a regression, a throughput, a latency, or an eval result). Find what limits it, and rule out that it measured something other than the work you think.

**Delegation**

- **Guard the Context Window** (`references/guard-the-context-window.md`). Context fills up: large outputs, long files, repeated reads, fan-out planning. Route bulk to subagents, keep summaries in the main thread.

**Meta**

- **Encode Lessons in Structure** (`references/encode-lessons-in-structure.md`). You catch yourself writing the same instruction a second time. Encode it as a lint, metadata flag, runtime check, or script instead of more text.

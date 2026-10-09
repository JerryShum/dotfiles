---
name: playbook
description: "pstack's playbooks, adapted for Claude Code: step-by-step procedures for a bug fix, feature, refactor, prototype, or investigation. CLAUDE.md §0 routes matching tasks here; /playbook runs it directly."
disable-model-invocation: true
---

# Playbooks

Adapted from pstack's poteto-mode (cursor/plugins @ `ccb5507`, MIT, see `../PSTACK-LICENSE`).

Match the task to one playbook, read its file, and list its steps at the top of your reply before any task-specific steps. A step you skip stays in the list with `skip: <reason>`. Restate progress against the list each turn.

| Task | Playbook |
|---|---|
| A reported defect to reproduce, root-cause, and fix | `playbooks/bug-fix.md` |
| New or changed behavior | `playbooks/feature.md` |
| A behavior-preserving change to structure: rename, extract, inline, dedupe, move | `playbooks/refactoring.md` |
| A throwaway sketch to make a design decision, or to settle a question by observing it | `playbooks/prototype.md` |
| A read-only question: how does X work, why is Y built this way, are we sure about Z | `playbooks/investigation.md` |

CLAUDE.md wins over every playbook: Build + explain (§0), proof (§4), and the step gate (§5). A playbook's steps are the map. Edits still go in §5-sized steps that stop for the user's OK. Commit, push, or open a PR only when the user asks.

The steps name other skills. They are type-to-run, so read the file and follow it instead of invoking it: `how`, `why`, `tdd`, and `blast-radius` live at `~/.claude/skills/<name>/SKILL.md`. A principle named as `principles: <name>` lives at `~/.claude/skills/principles/references/<name>.md`.

---
name: handoff
description: "Write a resume note another Claude instance can pick up cold: intent, progress, what's verified, current state, next steps, key files, gotchas. Use for /handoff, 'summarize where we are', or before moving work to another instance. Adapted from pstack's pause-safely and session-pickup."
disable-model-invocation: true
---

# Handoff

Adapted from pstack's pause-safely and session-pickup playbooks (cursor/plugins @ `ccb5507`, MIT, see `../PSTACK-LICENSE`).

**You own a clean stop. Leave a note a cold-start instance can resume from without redoing anything.**

1. Stop at a safe boundary. Finish the current step or back out of it. Start nothing new, and stop any running subagents.
2. Take no irreversible action to hand off. No push, no PR.
3. Make the work durable. List what is uncommitted (`git status`). Ask the user before committing. If they say yes, make one clear `wip:` commit on the current branch, and if the tree is broken, say so in the commit body in one line.
4. Write the note:
   - **Intent:** what the user wants and why, in their words where possible.
   - **Done and verified:** what landed, and how each part was checked: measured, inferred, or guess.
   - **Current state:** branch, uncommitted changes, anything still running.
   - **Next steps:** in order. The first one concrete enough to start without asking.
   - **Key files:** paths, one line each on why they matter.
   - **Decisions and dead ends:** choices made and why, and approaches already ruled out.
5. End the note with this block, so the next instance follows pickup's rules:

   > **For the instance picking this up:** this note is authoritative. Don't redo finished work or re-run a repro that already passed. Check `git log` and `git status` against the note, name the resume point, then verify inherited claims on the real artifact before building on them. Pick the remaining work up with the matching agent-skills workflow (`/plan` for open tasks, `/build` for planned ones).

6. Save the note to `/tmp/<repo-name>-handoff.md` so another instance can read it by path.

**Reply:** the note in one copyable block, the saved path, what is committed vs uncommitted, and the first action on resume. This is a pause, not a final report.

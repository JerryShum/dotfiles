---
name: cheatsheet
description: "Print the reference card for ponytail and the pstack skills: what each command does and when to reach for it."
disable-model-invocation: true
---

Print the card below exactly as written, then stop. If the user added a question after `/cheatsheet`, answer it in one or two lines below the card.

---

## Ponytail: keeps the code small (always on)

Before writing code, Claude climbs a ladder and stops at the first rung that works: does it need to exist → already in the codebase → standard library or platform → installed dependency → one line → only then the minimum code. It never cuts validation, security, or accessibility.

| Type | When |
|---|---|
| `/ponytail-review` | Before a commit. Bugs, security, missing tests, what to cut. The default reviewer. |
| `/ponytail-audit` | Health check of a whole repo, ranked. Fix #1 first. |
| `/ponytail-debt` | Collect the `shortcut:` comments it left into a to-do list. |
| `/ponytail lite` · `ultra` · `off` | Change strength for this session. `/ponytail default <level>` makes it stick. |
| "stop ponytail" | Turn it off for this session. Avoid "normal mode": that also turns off ADHD formatting. |

## pstack: process and proof

**Automatic** (you do nothing):
- **Playbooks.** On a real bug, feature, refactor, prototype, or investigation, Claude lists the playbook's steps at the top of its reply and works through them. Bugs get reproduced before anything is fixed.
- **Principles.** Claude names the principle behind a non-obvious decision, like `fix-root-causes`.
- **TypeScript rules.** These load when Claude works on `.ts`/`.tsx`: no `as` casts, parse data where it enters the app.

**Commands you type:**

| Type | When you're thinking… |
|---|---|
| `/why <thing>` | "Why did we build it this way?" Searches git, PRs, docs, and past Claude sessions. |
| `/how <thing>` | "How does this part work?" A walkthrough with a diagram. |
| `/blast-radius` | "What if we forget a place?" Finds what a change breaks elsewhere and proves it's safe. |
| `/tdd` | Fixing a bug with an easy test: failing test first, then the fix. |
| `/handoff` | Moving work to another Claude instance. Writes a note it can pick up. |
| `/correct` | "I keep telling Claude the same thing." Turns it into a lint rule, type, or test. |
| `/bro` | Last reply too dense. Says it again in plain words. |
| `/playbook` | Force a playbook when Claude didn't pick one. |

## Modes (from CLAUDE.md)

- **Default:** Claude explains what it's about to do and why, does one small step, proves it works, and stops for your OK.
- `/learn` · `/learn-deep`: you write the key decision yourself, coached.
- "just do it": skips the explanations for the current task. The step-by-step stop stays.

---
name: cheatsheet
description: "Print the reference card for agent-skills, ponytail, and the pstack skills: what each command does and when to reach for it."
disable-model-invocation: true
---

Print the card below exactly as written, then stop. If the user added a question after `/cheatsheet`, answer it in one or two lines below the card.

---

## agent-skills: the workflow

Unclear idea → `interview-me` · new work → `/spec` → `/plan` → `/build` → `/test` → `/review` → `/ship`

| Type | When |
|---|---|
| "interview me" | You're not sure what you want yet. One question at a time. |
| `/spec` | Starting a feature. Writes what to build and how you'll know it works. |
| `/plan` | Breaks the spec into small tasks with checks. |
| `/build` | Builds the next task. Shows the commit message, commits on your OK. |
| `/build auto` | Runs the whole plan after one approval. Pauses on failures. |
| `/test` | Prove it works. Bugs get a failing test first. |
| `/review` | Five-angle review before merging. |
| `/ship` | Pre-launch checklist and rollback plan. |
| `/constraints` | Write down the quality bar once, enforce it everywhere. |

Skills also load on their own: debugging, security (auth, RLS), API design, docs, UI, and more.

## Ponytail: keeps the code small (always on)

Before writing code, Claude climbs a ladder and stops at the first rung that works: does it need to exist → already in the codebase → standard library or platform → installed dependency → one line → only then the minimum code. It never cuts validation, security, or accessibility.

| Type | When |
|---|---|
| `/ponytail-review` | Second opinion focused on what to cut and what breaks outside the diff. |
| `/ponytail-audit` | Health check of a whole repo, ranked. |
| `/ponytail-debt` | Collect the `shortcut:` comments it left into a to-do list. |
| `/ponytail lite` · `ultra` · `off` | Change strength for this session. `/ponytail default <level>` makes it stick. |
| "stop ponytail" | Turn it off for this session. Avoid "normal mode": that also turns off ADHD formatting. |

## pstack: understanding and handoffs

| Type | When you're thinking… |
|---|---|
| `/why <thing>` | "Why did we build it this way?" Searches git, PRs, docs, and past Claude sessions. |
| `/how <thing>` | "How does this part work?" A walkthrough with a diagram. |
| `/blast-radius` | "What if we forget a place?" Finds what a change breaks elsewhere and proves it's safe. |
| `/handoff` | Moving work to another Claude instance. Writes a note it can pick up. |
| `/correct` | "I keep telling Claude the same thing." Turns it into a lint rule, type, or test. |
| `/bro` | Last reply too dense. Says it again in plain words. |

TypeScript rules load on their own for `.ts`/`.tsx`: no `as` casts, parse data where it enters the app.

## Modes (from CLAUDE.md)

- **Default:** Claude explains what it's about to do and why, does one small step, proves it works, and stops for your OK.
- `/learn` · `/learn-deep`: you write the key decision yourself, coached.
- "just do it": skips the explanations for the current task. The step-by-step stop stays.

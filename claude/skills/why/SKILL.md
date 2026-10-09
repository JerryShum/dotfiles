---
name: why
description: "Use for 'why does X work this way', 'why we picked Y', design rationale, regressions, postmortems, or data-backed thresholds. Searches git and gh history, the repo's own docs, and past Claude sessions (claude-mem) in parallel, then returns a cited read on decisions and tradeoffs. Use how for runtime behavior."
disable-model-invocation: true
---

# Why

Investigate the motivation and intent behind code.

Companion to the `how` skill. `how` answers what the code does and how it works. `why` answers what forces led to its shape.

Each spawn below names a `subagent_type` and a `model`. Pass both to the Agent tool.

## Operating Posture

Operate as a **careful, cautious, and precise investigator**. Be honest about what you know vs what you're inferring. Read `references/epistemics.md` for the full confidence framework and phrasing guide. The synthesizer must follow it.

## Step 1. Understand the Target and the Question

Parse what the user is asking. The **target** is usually a chunk of code, a pattern, a feature, or a named design decision. The **question** is usually a design rationale, a tradeoff, a motivating edge case, an external constraint, dead code, or a broad history sweep.

If the target is vague ("why do we do it this way?" with no clear referent), make your best guess from conversation context (open files, recent edits, what was just discussed). State your interpretation briefly so the user can redirect if you're off, then proceed.

## Step 2. Establish the Code Anchor

Before spawning investigators, anchor the investigation in concrete code. You need:

- The relevant file path(s) and line range(s)
- The key symbols (function names, class names, constants)
- An initial commit list. The last few commits touching the target.
- PR numbers from merge commits (pattern `(#1234)` in the subject line)

Build this inline.

```bash
# Blame target lines for last-touch commits
git blame -L <start>,<end> <file>

# Full file history, with patches, through renames
git log --follow -p -- <file>

# Last N commits touching the file, PR numbers visible
git log --oneline -20 -- <file>

# Extract PR numbers from a commit message
git log -1 --format=%B <commit>
```

Pull PR bodies and discussion via `gh` for any substantive commits:

```bash
gh pr view <number> --json title,body,author,createdAt,mergedAt,labels,closingIssuesReferences,comments,reviews
```

Capture this as seed context (file paths, symbols, commits, PR numbers, linked ticket IDs). Pass it to the investigators.

## Step 3. Spawn Parallel Investigators (default posture)

**Default to the full parallel investigation.**

### Sources

Map what this session can search to evidence sources. Aim for a complete **coverage map**, not a minimal one. Document the null, don't skip the search.

1. **Source control history.** Git, `gh` for PRs, code comments, tests, and the repo's own docs (ADRs, design notes, READMEs). Always available. Playbook: `references/sources/code-archaeology.md`. Best at surfacing *implementation-time rationale captured during review*.
2. **Past Claude sessions.** claude-mem's search tools, when this session has them. Decisions often get made in a session and never reach a commit message or doc. Search for the target's file names, symbols, and the feature's name. Best at surfacing *deliberation that never reached the repo*.
3. **Any other MCP** this session has that fits a category: issue tracker, long-form docs, team chat, infrastructure observability, error tracking, or product analytics. One investigator per MCP.

If the target code looks defensive (null checks, retries, timeouts, rate limits, feature flags), tell every investigator to also hunt for incident history: commits like "fix for incident" or "add defensive check", and a revert followed by a re-apply.

Launch all investigators in a single message so they run concurrently. Don't ask one agent to cover multiple sources.

Subagent config (each):
- `subagent_type`: `Explore` (read-only; it keeps Bash for git and `gh`, and MCP tools)
- `model`: `sonnet`

Each investigator gets:
1. The base prompt from `references/investigator-prompt.md`
2. Its source section: `references/sources/code-archaeology.md` for source control, or a short section you write for claude-mem or another MCP (what it holds, how to search it, what good evidence looks like)
3. The code anchor from Step 2 (file paths, symbols, commit hashes, PR numbers, ticket IDs)
4. The user's original question

### When to skip an investigator

Only skip with an **explicit, written justification** that goes in the final "Sources Consulted" section. Two valid reasons:

- **The source isn't available** in this session. Flag this as a gap, not a choice. Example: "Past Claude sessions skipped. claude-mem isn't loaded, so earlier session decisions were not searchable."
- **The source is provably irrelevant**, not just "probably irrelevant." A high bar.

If your scope assessment suggests a single-commit trivial target where the PR description already contains the complete answer, you may answer inline **only after** confirming the other available sources would be redundant. Say so explicitly. This should be rare.

## Step 4. Synthesize

Spawn one synthesizer subagent:

- `subagent_type`: `Explore` (read-only; it spot-checks citations)
- `model`: `opus`

The synthesizer gets:
1. The investigator findings, including any null results and any sources skipped with justification
2. The code anchor from Step 2 (file paths, symbols, commit hashes, PR numbers, ticket IDs)
3. The user's original question
4. The epistemics framework from `references/epistemics.md`
5. The synthesizer prompt template from `references/synthesizer-prompt.md`

## Step 5. Present

Take the synthesizer's output and present it to the user. You may lightly edit for clarity or add context from the conversation, but **do not rewrite the confidence language**.

## Output Format

The output structure is the one in `references/synthesizer-prompt.md`: The Question, The Code in Question, What We Found, What We Can Reasonably Infer, Competing Hypotheses, What We Don't Know, Sources Consulted, Confidence Summary. Adapt as needed, but keep the confidence separation intact, and keep Sources Consulted as one line per investigator, including the ones that returned nothing or were skipped, with the reason.

After the Sources Consulted block, if the user's `why` question is a precursor to actually changing this code, convert the lineage findings into a Preserve / Change / Avoid / Risk constraint set suitable for planning the change.

## Common Failure Modes to Avoid

- **Recency bias**. Assuming the most recent commit is authoritative. The current shape is often the accretion of many earlier decisions. Trace back.

## Reference Files

- `references/epistemics.md`. Confidence tiers and phrasing guide. The synthesizer must follow it.
- `references/investigator-prompt.md`. Base prompt template for investigator subagents.
- `references/sources/code-archaeology.md`. The source-control playbook: git, `gh`, and in-repo docs.
- `references/synthesizer-prompt.md`. Prompt template for the synthesizer subagent, including the output format.

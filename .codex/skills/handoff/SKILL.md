---
name: handoff
description: Create or resume a compact project handoff between ChatGPT, Codex/Work, a local desktop, GitHub, or cloud storage. Use when the user says handoff, 작업 넘겨, 이어서 작업, 로컬에서 이어, Codex로 이어, 컨텍스트 저장, or asks to reduce repeated context/token usage across environments.
---

# Handoff

Use this skill to move active work between environments without forcing the next agent to rediscover the whole project.

The goal is **minimum re-reading, maximum continuity**. Do not dump the full chat, full git diff, or long logs into the handoff.

## Modes

Choose one mode from the user's request.

### 1. Handoff out

Use when work is about to move to another environment, machine, agent, or session.

1. Inspect the current project state.
   - Current branch.
   - Latest relevant commit.
   - Working-tree status.
   - Files changed or created in this work.
   - Commands/tests already run and their result.
2. Read an existing `HANDOFF.md` and `TODO.md` if present.
3. Create or update root-level `HANDOFF.md`.
4. Create or update root-level `TODO.md`.
5. Keep the handoff compact.
6. If the user explicitly asked to commit or push, do that after reviewing the changes. Otherwise do not commit or push automatically.
7. Tell the user exactly where the handoff is stored and what the next environment should do first.

### 2. Handoff in / resume

Use when continuing work that another session or environment already started.

1. Read `HANDOFF.md` first.
2. Read `TODO.md` second.
3. Check current branch and git status.
4. Compare the actual repository state with the handoff.
5. Open only the files listed under **Files to open first** unless more context is required.
6. Start with the first actionable item under **Next actions**.
7. Do not redo completed research, design, setup, or tests unless the current state contradicts the handoff.
8. After meaningful work, update `HANDOFF.md` and `TODO.md` before another context switch.

## HANDOFF.md format

Use this order.

# Project Handoff

## Snapshot
- Updated:
- Project:
- Branch:
- Commit:
- Working tree:
- Target environment:

## Goal
One short paragraph describing the user's actual outcome.

## Current state
What is already working or complete.

## Decisions already made
Only decisions the next agent should not revisit without a reason.

## Files changed
Use exact relative paths and one-line purpose descriptions.

## Files to open first
List the smallest set of files needed to continue.

## Run / test
Exact commands that were run, plus pass/fail status.
If nothing was run, say so.

## Known issues / constraints
Include blockers, environment limits, API/tool constraints, compatibility requirements, and intentional omissions.

## Next actions
Use a numbered list. Put the highest-value next action first.
Keep this to 3–7 items.

## What not to redo
List work that has already been completed and should not consume context again.

## External state
Include only useful references such as:
- GitHub repository / branch
- deployed URL
- Drive folder/document name
- issue or PR reference

Never include secrets.

## Resume prompt
Write one short prompt that can be pasted into the next agent, for example:

"Read HANDOFF.md and TODO.md first. Verify git status, then continue from Next actions item 1. Do not redo completed research."

## TODO.md format

Use a short task list grouped into:
- NOW
- NEXT
- LATER

Each task should be independently understandable and testable.

## Token-saving rules

- Prefer structured summaries over transcripts.
- Do not copy full conversations.
- Do not copy full logs; preserve only the error and the few lines needed to diagnose it.
- Do not paste full diffs into `HANDOFF.md`; list changed files and key behavior changes.
- Link or name source documents instead of reproducing them.
- Record final decisions so the next agent does not repeat option analysis.
- Keep `HANDOFF.md` ideally under 150 lines. If it grows, compress completed history into a few bullets.
- Keep `TODO.md` focused on unfinished work only.

## Safety and integrity

- Never write API keys, passwords, cookies, auth headers, private tokens, recovery codes, or unredacted secrets into handoff files.
- If a secret is required, record only the environment-variable name, e.g. `VERCEL_TOKEN required`.
- Do not claim tests passed unless they were actually run.
- Do not claim files were pushed, deployed, uploaded, or synced unless the action succeeded.
- Preserve user-authored files. Prefer targeted edits.

## Definition of done for a handoff

A handoff is complete when:
- `HANDOFF.md` reflects the actual repository state.
- `TODO.md` contains the unfinished work in priority order.
- The next agent can identify the first action without scanning the whole repository.
- Run/test status is explicit.
- Important decisions and blockers are recorded.
- No secrets are present.

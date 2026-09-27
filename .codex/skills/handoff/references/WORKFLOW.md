# Handoff workflow

This skill is optimized for moving work between ChatGPT and local Codex/Work while avoiding repeated context ingestion.

## Recommended loop

1. Do planning, research, and bulk drafting in ChatGPT.
2. Save code and project state to GitHub.
3. Run the handoff skill before switching environments.
4. On the desktop, pull the repository.
5. Ask Codex to use the handoff skill or say:
   "Read HANDOFF.md and TODO.md first. Continue Next actions item 1."
6. Let local Codex focus on execution, debugging, testing, and small edits.
7. Before returning to ChatGPT, run the handoff skill again and push the updated handoff files with the code when appropriate.

## Storage pattern

- GitHub: source code, versioned handoff files, deployment config.
- Google Drive: PDFs, source documents, images, research material, large non-code assets.
- HANDOFF.md: compact operational context.
- TODO.md: only unfinished work.

## Why this saves context

The next agent starts from a compressed, verified state instead of rediscovering architecture, decisions, completed work, and known failures from the entire conversation or repository.

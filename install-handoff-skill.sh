#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/.codex/skills/handoff"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
DEST="$CODEX_ROOT/skills/handoff"

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "Could not find $SRC/SKILL.md"
  exit 1
fi

if [ -e "$DEST/SKILL.md" ]; then
  echo "handoff skill already exists at $DEST"
  echo "Remove or rename that folder first if you want to replace it."
  exit 2
fi

mkdir -p "$DEST"
cp -R "$SRC"/. "$DEST"/

echo "Installed handoff skill to: $DEST"
echo "Restart or open a new Codex session if the skill is not discovered immediately."
echo 'Try: Use the handoff skill and create a handoff for this project.'

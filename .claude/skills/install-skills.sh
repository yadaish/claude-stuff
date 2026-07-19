#!/bin/bash
# Copy all skills from this repo to global ~/.claude/skills/
SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.claude/skills"
mkdir -p "$DST"

for skill_dir in "$SRC"/*/; do
  name=$(basename "$skill_dir")
  [ -f "$skill_dir/SKILL.md" ] || continue
  mkdir -p "$DST/$name"
  cp -r "$skill_dir"* "$DST/$name/"
  echo "installed: $name"
done

echo "done. skills in $DST"

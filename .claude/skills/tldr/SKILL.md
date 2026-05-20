---
name: tldr
description: >
  Show a concise TL;DR of all available skills — name, purpose, and usage in
  a compact table. No verbose details. Usage: /tldr
tools: Bash
---

# Skill TL;DR

Print a compact summary table of all available skills.

## Instructions

1. Scan all skill directories:

```bash
for dir in ~/.claude/skills/*/SKILL.md .claude/skills/*/SKILL.md 2>/dev/null; do
  name=$(basename $(dirname "$dir"))
  desc=$(grep -m1 '^  ' "$dir" | sed 's/^ *//' | cut -c1-60)
  usage=$(grep -oP '(?<=Usage: ).*' "$dir" | head -1)
  [ -z "$usage" ] && usage="/$name"
  printf "| \`%s\` | %s |\n" "$usage" "$desc"
done
```

2. Output format — markdown table, two columns only:

```
| Skill | What it does |
|---|---|
| `/skill-name <args>` | One-line purpose |
```

3. Rules:
   - One line per skill, max 60 chars for description
   - Show usage with args if available, otherwise just `/name`
   - No extra explanation, no headers beyond the table
   - Skip the template `SKILL.md` in the skills root

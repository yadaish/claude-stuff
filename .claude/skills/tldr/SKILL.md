---
name: tldr
description: >
  Answer any question with core code + one-line summary. Clean, short, no fluff.
  Usage: /tldr <question or topic>
tools: Bash, Read, WebSearch
---

# TL;DR

Answer with core code and a one-liner. Nothing else.

## Format

```<lang>
<essential code only>
```

<summary: ideally one sentence, up to 3 if needed>

## Rules

- Code block: max 10 lines. Pick only the most important lines.
- Strip imports, boilerplate, error handling — keep the core logic.
- No comments unless behavior is truly non-obvious.
- No preamble, no "Here's how to…", no sign-off, no headers.
- CLI/command questions: show the command, not code.
- Conceptual questions: one-liner only, no code block.

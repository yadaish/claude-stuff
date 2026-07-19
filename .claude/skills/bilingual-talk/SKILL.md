---
name: bilingual-talk
description: >
  Switch the session to bilingual mode — reply in both Chinese and English.
  Code, comments, and tool call descriptions always stay in English.
  Usage: /bilingual-talk
---

# Switch Dialog to Bilingual (Chinese + English)

## Overview

Switch the current session's dialog to bilingual mode. Every reply is given in
both Chinese and English. All code, code comments, and tool call descriptions
remain in English.

## Steps

1. **Confirm switch**
   - Confirm to the user in both languages: dialog has been switched to bilingual
     mode (Chinese + English).
     - 中文：对话已切换为中英双语模式。
     - English: Dialog has been switched to bilingual mode.

2. **Subsequent behavior**
   - From this point on, every reply contains both a Chinese version and an
     English version of the same content.
   - Present Chinese first, then English (or pair them clearly), so both are easy
     to read.
   - Code, code comments, and tool call descriptions remain in English, unaffected.

## Rules

- Takes effect immediately.
- Both languages must carry the same meaning — do not omit content from either.
- Only affects dialog language; code and comments always stay in English.
- To use Chinese only, use `/chinese-talk`; for English only, use `/english-talk`.

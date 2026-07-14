---
name: google-python-style
description: >
  Write and review Python according to the Google Python Style Guide
  (https://google.github.io/styleguide/pyguide.html). Apply this whenever writing,
  editing, or reviewing Python in this repo — especially naming, imports, docstrings,
  comments, line length, and type hints. Trigger on "google python style",
  "google style", "follow the style guide", "/google-python-style", or when the user
  asks for style-compliant / lint-clean Python. When editing existing code, keep the
  surrounding file's conventions where they are stricter or intentional, and prefer
  minimal, mechanical changes over churn.
user_invocable: true
---

# Google Python Style

Follow the Google Python Style Guide when producing or reviewing Python.
Reference: https://google.github.io/styleguide/pyguide.html

## Naming (most common violation — check first)

- `module_name`, `package_name`, `function_name`, `method_name`,
  `local_var_name`, `function_parameter_name`, `instance_var_name`,
  `global_var_name` → **`lower_case_with_underscores`**. Never `camelCase` or
  `mixedCase` for functions/variables.
- `ClassName`, `ExceptionName` → `CapWords`.
- `GLOBAL_CONSTANT_NAME`, module-level constants → `CONSTANT_CASE`. A truly
  constant, compile-time local may use `CONSTANT_CASE` too, but ordinary locals
  are `lower_case`.
- Leading `_` marks module-internal / "private"; `__` triggers name mangling
  (avoid in normal code). A single trailing `_` avoids keyword clashes.
- Avoid single-character names except counters/iterators (`i`), `e` in
  `except`, or `f` for a file handle. No `l`, `O`, `I` single letters.

## Layout

- Indent 4 spaces. Never tabs; never mix.
- **Line length ≤ 80** by default. If a project/file clearly uses a wider
  formatter (e.g. black at 88), match the file rather than reflowing everything —
  but keep new code within the file's prevailing width and don't exceed it.
- Prefer implicit line continuation inside `()`/`[]`/`{}` over backslashes.
- Two blank lines between top-level defs; one between methods.

## Imports

- `import` on separate lines; group and order: (1) `__future__`, (2) stdlib,
  (3) third-party, (4) local — blank line between groups.
- Import packages/modules, not individual names of a module's symbols, except
  for typing and conventional exceptions the file already follows. Use full
  package paths; avoid relative imports where the repo uses absolute.
- No wildcard imports (`from x import *`).

## Docstrings & comments

- Modules, public functions, classes, and methods get docstrings: a one-line
  summary, then (if needed) a blank line and details. Use `Args:`, `Returns:`,
  `Raises:` sections for non-trivial functions.
- Comments explain *why*, not *what*. Keep them current with the code.

## Types, defaults, and correctness idioms

- Add type hints for public APIs; annotate as the file does. Don't fight an
  untyped file with partial hints if it creates noise.
- No mutable default arguments (`def f(x=[])`). Use `None` and build inside.
- Use `is`/`is not` for `None` comparisons; don't use `==`.
- Prefer f-strings; catch specific exceptions (never bare `except:`).
- Comprehensions when they stay simple; a loop when they don't.

## Applying to existing code (editing)

1. Fix clear violations in the code you touch — naming (mixed-case → snake),
   over-length lines you added, bare excepts, mutable defaults.
2. Match the file's existing width/quote/format conventions when they are
   consistent; prefer the guide only where the file is inconsistent or wrong.
3. Keep renames mechanical and unique (use word boundaries) so behavior is
   unchanged; re-verify the build/tests after a rename sweep.
4. Don't reformat unrelated lines — minimize diff churn.

## Quick self-check before finishing

- No `camelCase`/`mixedCase` functions or variables introduced.
- New lines within the file's line-length limit.
- Imports grouped/ordered; no wildcard imports.
- Public defs have docstrings; non-trivial ones document Args/Returns/Raises.
- No mutable default args; `is None` for None checks; specific exceptions.

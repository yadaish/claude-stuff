---
name: google-cpp-style
description: >
  Write and review C++ according to the Google C++ Style Guide
  (https://google.github.io/styleguide/cppguide.html). Apply this whenever writing,
  editing, or reviewing C++/CUDA/HIP in this repo — especially naming, headers and
  include order, formatting, classes, comments, and modern-C++ idioms. Trigger on
  "google c++ style", "google cpp style", "google style", "follow the style guide",
  "/google-cpp-style", or when the user asks for style-compliant / lint-clean C++.
  When editing existing code, keep the surrounding file's conventions where they are
  stricter or intentional, and prefer minimal, mechanical changes over churn.
user_invocable: true
---

# Google C++ Style

Follow the Google C++ Style Guide when producing or reviewing C++ (incl. CUDA/HIP).
Reference: https://google.github.io/styleguide/cppguide.html

## Naming (most common violation — check first)

- **Types** (classes, structs, enums, type aliases, `typedef`, concepts) →
  `CamelCase` (a.k.a. PascalCase): `MyClass`, `TableInfo`, `enum class Color`.
- **Functions** → `CamelCase`: `AddTableEntry()`, `DeleteUrl()`. Cheap
  accessors/mutators may match the variable: `int count() const`, `set_count()`.
- **Variables** → `snake_case`: `table_name`, `num_entries`.
  - Class **data members** get a trailing underscore: `count_`, `table_name_`.
  - Struct data members do **not**: plain `snake_case`.
- **Constants** (`constexpr`/`const` with static storage duration) and **enum
  values** → leading `k` + `CamelCase`: `kMaxEntries`, `kDaysInWeek`, `kActive`.
- **Namespaces** → `snake_case`: `my_project::io`.
- **Macros** (avoid them) → `ALL_CAPS_WITH_UNDERSCORES`.
- **Files** → `snake_case` with `.cc`/`.h` (`.cu`/`.cuh`/`.hip` for GPU): a class
  `MyUsefulClass` lives in `my_useful_class.h` / `.cc`.

## Formatting / layout

- Indent **2 spaces**. Never tabs.
- **Line length ≤ 80** by default. If a project/file clearly uses a wider
  clang-format (e.g. 100/120), match the file rather than reflowing everything —
  but keep new code within the file's prevailing width and don't exceed it.
- Prefer to run/respect the repo's `.clang-format` if present; match it over this
  guide where they conflict on pure formatting.
- Braces: opening brace on the same line (`if (x) {`). Always brace multi-line
  bodies; single-statement bodies may omit braces only if the file does so.
- One declaration per line; initialize variables at declaration.
- Namespace contents are **not** indented; end with `// namespace foo`.

## Headers & includes

- Use a `#define` include guard named `<PROJECT>_<PATH>_<FILE>_H_`, or
  `#pragma once` if the file/repo already uses it — match the file.
- Each `.cc` includes its **own header first**, then a blank line, then groups:
  (1) C system headers `<...>`, (2) C++ standard library `<...>`, (3) other
  libraries, (4) this project's headers. Blank line between groups; alphabetical
  within each group. Use full project-relative paths, not relative `../`.
- Include what you use; don't rely on transitive includes.
- Prefer including over forward declarations unless it breaks a real cycle or is
  a deliberate compile-time optimization the file already relies on.

## Classes & functions

- Mark single-argument constructors `explicit` (unless implicit conversion is
  intended and the file documents it). Use `= default` / `= delete`.
- Declaration order: `public:` → `protected:` → `private:`; within a section:
  types/aliases, constants, factory functions, constructors, other methods, then
  data members (data members last).
- Prefer composition to inheritance; make inherited overrides `override` (or
  `final`), and don't repeat `virtual` on an `override`.
- Keep functions short and single-purpose. Pass inputs by value or
  `const&` (use `std::string_view`/`absl::string_view` for strings); pass
  outputs by pointer (non-const) and put output params last.
- Prefer returning values over output parameters where it's clear.

## Modern C++ / correctness idioms

- `nullptr`, never `NULL` or `0` for pointers.
- Prefer `enum class` over unscoped `enum`.
- Ownership via smart pointers (`std::unique_ptr`, then `std::shared_ptr` only
  when sharing is real); avoid manual `new`/`delete`. Prefer `std::make_unique`.
- Use `auto` where it improves readability without hiding an important type;
  range-based `for` for iteration.
- `const`- and `constexpr`-correctness: mark methods `const`, prefer `constexpr`
  for compile-time constants.
- Use `<cstdint>` fixed-width types when size matters; otherwise prefer `int`.
  Avoid unsigned types except for bit manipulation / modular arithmetic.
- Google style typically **disables exceptions and RTTI** — don't add
  `throw`/`try` or `dynamic_cast` unless the project clearly uses them.
- Prefer `sizeof(var)` over `sizeof(Type)`.

## Comments

- Use `//` for normal comments; `/* */` sparingly. Comment files, public
  classes, and non-obvious functions; document ownership and pre/postconditions.
- Comments explain *why*, not *what*. Keep them current with the code.
- Don't add a comment when the code is already clear on its own. A comment must
  carry real information the code can't — e.g. an issue/ticket link, a
  workaround and the bug it dodges, a crash it prevents, or a non-obvious
  constraint. Delete comments that merely restate the code.
- Mark follow-ups as `// TODO(user): ...`.

## Applying to existing code (editing)

1. Fix clear violations in the code you touch — naming, over-length lines you
   added, missing `explicit`, `NULL`→`nullptr`, raw owning pointers.
2. Match the file's existing width/brace/format conventions (and `.clang-format`)
   when consistent; prefer the guide only where the file is inconsistent or wrong.
3. Keep renames mechanical and unique (word boundaries) so behavior is
   unchanged; re-verify the build after a rename sweep.
4. Don't reformat unrelated lines — minimize diff churn.

## Quick self-check before finishing

- Types/functions `CamelCase`; variables `snake_case`; members `trailing_`;
  constants/enum values `kCamelCase`.
- New lines within the file's line-length limit; 2-space indent, no tabs.
- Own-header-first + grouped, alphabetized, full-path includes; guard present.
- Single-arg ctors `explicit`; overrides marked `override`; data members last.
- `nullptr`, smart pointers, `enum class`; no stray `new`/`delete`; no
  exceptions/RTTI unless the project uses them.

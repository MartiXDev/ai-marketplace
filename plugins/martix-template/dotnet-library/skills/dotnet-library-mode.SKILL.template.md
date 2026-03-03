---
name: <plugin-id-prefix>-<mode>
description: <Mode-specific .NET library skill description with triggers and outcomes.>
license: <license>
---

## Skill overview

<What the mode does and why to use it.>

## When to use this skill

- <Trigger 1>
- <Trigger 2>
- <Trigger 3>

## Prerequisites

- Access to target repository and solution structure.
- .NET SDK installed and runnable.
- Clear change scope and compatibility expectations.

## Step-by-step workflow

1. Analyze current behavior, contracts, and target framework strategy.
2. Apply minimal implementation and API changes.
3. Update tests for happy path, edge cases, and compatibility risks.
4. Run shared validation commands and capture evidence.

## .NET library guidance checkpoints

- Cross-platform target strategy (`net8.0+`, plus `netstandard2.0` only when required).
- Dependency policy (avoid exact and upper-bound package constraints).
- Versioning and breaking change assessment (SemVer + migration guidance).
- Package/debugging readiness (NuGet metadata, Source Link, symbols, deterministic builds).

## Output checklist

- Summary of changes and rationale.
- Compatibility impact and risk notes.
- Validation evidence and remaining follow-ups.

## References

- Mode prompt: `../../prompts/<plugin-id-prefix>-<mode>.prompt.md`
- Shared instruction: `../../instructions/<plugin-id-prefix>.instructions.md`
- Validation hook: `../../hooks/<plugin-id-prefix>-validation.hook.yaml`


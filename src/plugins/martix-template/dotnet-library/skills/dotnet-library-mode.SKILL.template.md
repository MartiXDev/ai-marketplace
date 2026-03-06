---
name: <plugin-id-prefix>-<mode>
description: <Build and evolve .NET libraries with compatibility-safe outcomes. Include triggers, operation mode, and expected deliverables.>
license: <license>
---

## .NET Library Skill

<What this mode does and why to use it.>

## When to use this skill

- <Trigger 1>
- <Trigger 2>
- <Trigger 3>

## Prerequisites

- Access to target repository and solution structure.
- .NET SDK installed and runnable.
- Clear change scope and compatibility expectations.

## Project structure baseline

```text
src/{Library}/
tests/{Library}.Tests/
Directory.Build.props
Directory.Packages.props
```

## Core concepts

### Compatibility-first evolution

- <How source, binary, and behavioral compatibility are handled.>

### Dependency and packaging quality

- <How dependency policy and package quality are enforced.>

### Validation and release gates

- <What must pass before release recommendation.>

## Step-by-step workflow

1. Analyze current behavior, contracts, and target framework strategy.
2. Apply minimal implementation and API changes.
3. Update tests for happy path, edge cases, and compatibility risks.
4. Classify compatibility impact and mitigation.
5. Run shared validation commands and capture evidence.
6. Summarize release readiness and residual risk.

## .NET library guidance checkpoints

- Cross-platform target strategy (`net8.0+`, plus `netstandard2.0` only when required).
- Dependency policy (avoid exact and upper-bound package constraints).
- Versioning and breaking change assessment (SemVer + migration guidance).
- Package/debugging readiness (NuGet metadata, Source Link, symbols, deterministic builds).

## Common patterns

### Target framework policy pattern

```xml
<TargetFramework>net10.0</TargetFramework>
```

### Dependency policy pattern

- <How minimum versions and upper bounds are handled.>

### Obsolete migration pattern

- <How compatibility bridges and deprecation notes are authored.>

## Output checklist

- Summary of changes and rationale.
- Compatibility impact and risk notes.
- Validation evidence and remaining follow-ups.

## Troubleshooting

| Issue | Recommended action |
| --- | --- |
| <Issue 1> | <Action 1> |
| <Issue 2> | <Action 2> |

## References

- Mode prompt: `../../prompts/<plugin-id-prefix>-<mode>.prompt.md`
- Shared instruction: `../../instructions/<plugin-id-prefix>.instructions.md`
- Validation hook: `../../hooks/<plugin-id-prefix>-validation.hook.yaml`
- Mode checklists: `./references/dotnet-library-checklists.template.md`

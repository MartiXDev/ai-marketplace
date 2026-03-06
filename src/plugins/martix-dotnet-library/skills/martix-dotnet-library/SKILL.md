---
name: martix-dotnet-library
description: Build and evolve .NET libraries with compatibility-safe outcomes. Use when creating new APIs, updating contracts, reviewing PRs, and preparing release-ready packages in MartiXDev/WebApi.
license: Proprietary MartiXDev internal usage
---

## MartiX .NET Library Skill

Use one skill for authoring new features, updating existing functionality, and
reviewing .NET library changes.

## When to Use This Skill

- You need to create a new .NET library capability.
- You need to update existing behavior or contracts safely.
- You need a high-signal review before merge or release.

## Prerequisites

- Access to MartiXDev/WebApi source and project layout.
- .NET SDK installed for restore/build/test/pack validation.
- Clear operation intent (author, update, or review) and acceptance criteria.

## Project Structure Baseline

```text
src/{Library}/
tests/{Library}.Tests/
Directory.Build.props
Directory.Packages.props
```

## Core Concepts

### Compatibility-first evolution

- Treat source, binary, and behavioral compatibility as first-class constraints.
- Prefer additive changes and migration paths over abrupt contract shifts.

### Dependency and packaging quality

- Keep dependencies minimal and avoid strict version pinning without reason.
- Keep package metadata, Source Link, and symbol strategy release-ready.

### Validation and release gates

- Restore/build/test are always required.
- Pack is required when package output or release artifacts are in scope.

## Step-by-Step Workflow

1. Classify the request (author, update, or review).
2. Confirm baseline behavior, API/contract constraints, and target framework
   strategy.
3. Apply minimal implementation changes or produce prioritized review findings.
4. Update or validate tests and migration guidance where required.
5. Run shared validation commands and summarize compatibility and release risk.
6. Capture release-readiness notes and unresolved follow-up actions.

## .NET Library Guidance Checks

- Targeting strategy (`net8.0+` baseline; add compatibility TFMs only when
  required).
- Dependency policy (avoid unnecessary dependencies, exact pins, and upper
  bounds unless justified).
- Versioning and compatibility (SemVer impact and source/binary/behavioral break
  classification).
- Packaging/debugging quality (NuGet metadata, Source Link/symbols,
  deterministic build policy, strong naming decision).

## Common Patterns

### Target framework policy pattern

```xml
<TargetFramework>net10.0</TargetFramework>
```

### Dependency policy pattern

- Prefer minimum required versions over exact pins.
- Avoid upper bounds unless technically required.

### Obsolete migration pattern

- Keep existing API behavior.
- Add replacement API.
- Mark old API with `Obsolete` and migration guidance.

## Output Checklist

- Operation type and change/review summary.
- Compatibility impact and migration guidance (if applicable).
- Validation evidence (`restore`, `build`, `test`, optional `pack`).
- Outstanding risks and follow-up actions.

## Troubleshooting

| Issue | Recommended action |
| --- | --- |
| Unclear SemVer impact | Classify source, binary, and behavioral impact before editing code. |
| Dependency drift in PR | Audit direct/transitive dependencies and justify each addition. |
| Failing release validation | Re-run restore/build/test, then run pack when package artifacts changed. |
| Breaking API without migration path | Add compatibility bridge and deprecation guidance before release. |

## References

- [Unified prompt](../../prompts/martix-dotnet-library.prompt.md)
- [Shared instruction](../../instructions/martix-dotnet-library.instructions.md)
- [Validation hook](../../hooks/martix-dotnet-library-validation.hook.yaml)
- [Release checklists](./references/release-checklists.md)
- [Skill template source](../../../martix-template/dotnet-library/skills/dotnet-library-mode.SKILL.template.md)

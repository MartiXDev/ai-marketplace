---
name: martix-dotnet-library
description: Unified .NET library skill for create, update, and review operations in MartiXDev/WebApi, with compatibility-safe and release-ready outcomes.
license: Proprietary MartiXDev internal usage
---

## MartiX .NET Library Unified Skill

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

## Step-by-Step Workflow

1. Classify the request (author, update, or review).
2. Confirm baseline behavior, API/contract constraints, and target framework
   strategy.
3. Apply minimal implementation changes or produce prioritized review findings.
4. Update or validate tests and migration guidance where required.
5. Run shared validation commands and summarize compatibility and release risk.

## .NET Library Guidance Checks

- Targeting strategy (`net8.0+` baseline; add compatibility TFMs only when
  required).
- Dependency policy (avoid unnecessary dependencies, exact pins, and upper
  bounds unless justified).
- Versioning and compatibility (SemVer impact and source/binary/behavioral break
  classification).
- Packaging/debugging quality (NuGet metadata, Source Link/symbols,
  deterministic build policy, strong naming decision).

## Output Checklist

- Operation type and change/review summary.
- Compatibility impact and migration guidance (if applicable).
- Validation evidence (`restore`, `build`, `test`, optional `pack`).
- Outstanding risks and follow-up actions.

## References

- [Unified prompt](../../prompts/martix-dotnet-library.prompt.md)
- [Shared instruction](../../instructions/martix-dotnet-library.instructions.md)
- [Validation hook](../../hooks/martix-dotnet-library-validation.hook.yaml)
- [Skill template source](../../../martix-template/dotnet-library/skills/dotnet-library-mode.SKILL.template.md)


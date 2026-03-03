---
description: Shared operating instructions for .NET library author/update/review assets.
applyTo: plugins/<plugin-folder>/**
---

## Operating scope

Use these rules for all `<plugin-id-prefix>-*` command assets.

## Core engineering rules

- Prefer minimal, behavior-safe changes.
- Preserve API and namespace consistency unless intentionally changed.
- Update tests whenever behavior, contracts, or dependencies change.
- Report compatibility impact and residual risk explicitly.

## .NET library guidance quality gates

1. **Targeting strategy**
   - Prefer modern `.NET` targets (`net8.0+`) for new work.
   - Add `netstandard2.0` only when broad compatibility or .NET Framework support is required.
2. **Dependency strategy**
   - Keep dependencies minimal.
   - Avoid exact and upper-bound NuGet dependency constraints unless required.
3. **Versioning and compatibility**
   - Use SemVer for package versioning.
   - Classify source, binary, and behavioral breaking changes.
   - Include migration guidance or Obsolete strategy where applicable.
4. **Package quality and debugging**
   - Keep NuGet metadata complete.
   - Prefer Source Link and symbol publishing strategy.
   - Consider deterministic builds for traceability.
5. **Strong naming policy**
   - Apply only when compatibility targets require it.
   - Do not change strong-name key identity once published.

## Validation baseline

Run from target repository root unless intentionally scoped:

1. `dotnet restore --nologo`
2. `dotnet build --nologo`
3. `dotnet test --nologo --no-build`
4. `dotnet pack -c Release --no-build` (when packaging is in scope)


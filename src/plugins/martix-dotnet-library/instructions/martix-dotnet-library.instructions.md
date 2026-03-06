---
description: 'Shared operating instructions for MartiX .NET library author, update, and review commands.'
applyTo: plugins/martix-dotnet-library/**
template_source: plugins/martix-template/dotnet-library/instructions/dotnet-library.instructions.template.md
---

## MartiX .NET Library Instruction

Use these rules for the unified `martix-dotnet-library` command assets.

## General Instructions

- Target repository context is `MartiXDev/WebApi`.
- Prefer minimal, surgical changes that preserve existing behavior.
- Keep public API naming and namespace conventions consistent.
- Add or update tests whenever behavior or contracts change.
- Report risks, compatibility impact, and validation outcomes clearly.

## Best Practices

- **Cross-platform targeting**
  - Default to modern target frameworks (`net8.0` or later) for new work.
  - Add `netstandard2.0` only when broad compatibility is explicitly required.
- **Dependency policy**
  - Minimize package dependencies.
  - Avoid exact-version and upper-bound dependency constraints unless justified.
- **Versioning policy**
  - Use SemVer for package versioning decisions.
  - Keep assembly version strategy stable to reduce binding redirect friction.
- **Breaking change policy**
  - Classify source, binary, and behavioral changes before release.
  - Prefer compatibility-safe changes; use migration guidance and Obsolete paths when needed.
- **Packaging and debugging quality**
  - Keep NuGet metadata complete.
  - Include Source Link/symbol strategy and deterministic build expectations in release notes.
- **Strong naming policy**
  - Apply strong naming only when target compatibility requires it.
  - Do not change the strong-name key identity after publishing.

## Code Standards

### API and contract discipline

- Prefer additive API evolution over contract replacement.
- Preserve namespace consistency and public member naming.
- Add Obsolete guidance before removing or reshaping public APIs.

### Good Example - Additive compatibility-safe API

```csharp
[Obsolete("Use CreateAsync(CreateRequest request, CancellationToken ct).")]
public Task<Result> CreateAsync(string name)
{
    return CreateAsync(new CreateRequest(name), CancellationToken.None);
}
```

### Bad Example - Silent breaking change

```csharp
public Task<Result> CreateAsync(Guid id, string name)
{
    // Existing signature replaced without migration path.
}
```

## Common Patterns

### Dependency review pattern

- Record why each new package is required.
- Prefer minimum supported versions over exact pins.

### Versioning decision pattern

- Classify compatibility impact first.
- Recommend SemVer increment that matches impact.

## Validation Baseline

Run the shared hook commands from repository root unless overridden:

1. `dotnet restore --nologo`
2. `dotnet build --nologo`
3. `dotnet test --nologo --no-build`
4. `dotnet pack -c Release --no-build` (when packaging is in scope)

If the repo uses scoped solutions or test projects, run equivalent
targeted commands and record exactly what was validated.

## Maintenance

- Update this file and template source when .NET guidance or plugin workflow
  changes.
- Keep examples aligned with current repository conventions.

## Template Source

- [Instruction template source](../../martix-template/dotnet-library/instructions/dotnet-library.instructions.template.md)


---
description: 'Shared operating instructions for .NET library author/update/review assets.'
applyTo: plugins/<plugin-folder>/**
---

## Operating scope

Use these rules for all `<plugin-id-prefix>-*` command assets.

## General instructions

- Prefer minimal, behavior-safe changes.
- Preserve API and namespace consistency unless intentionally changed.
- Update tests whenever behavior, contracts, or dependencies change.
- Report compatibility impact and residual risk explicitly.

## Best practices

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

## Code standards

### API and contract discipline

- Prefer additive API evolution over contract replacement.
- Preserve namespace consistency and public member naming.
- Add deprecation guidance before removing public APIs.

### Good example - additive compatibility bridge

```csharp
[Obsolete("Use CreateAsync(CreateRequest request, CancellationToken ct).")]
public Task<Result> CreateAsync(string name)
{
    return CreateAsync(new CreateRequest(name), CancellationToken.None);
}
```

### Bad example - silent contract break

```csharp
public Task<Result> CreateAsync(Guid id, string name)
{
    // Existing signature replaced without migration path.
}
```

## Common patterns

### Dependency review pattern

- Record purpose and impact for every new package.
- Prefer minimum supported versions over exact pins.

### Versioning decision pattern

- Classify compatibility impact first.
- Align SemVer recommendation with impact.

## Validation baseline

Run from target repository root unless intentionally scoped:

1. `dotnet restore --nologo`
2. `dotnet build --nologo`
3. `dotnet test --nologo --no-build`
4. `dotnet pack -c Release --no-build` (when packaging is in scope)

## Maintenance

- Update this template when .NET guidance or plugin workflows change.
- Keep examples aligned with repository conventions.


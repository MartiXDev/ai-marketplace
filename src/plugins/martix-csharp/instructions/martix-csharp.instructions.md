---
description: 'Shared operating instructions for MartiX C# language-focused command assets.'
applyTo: src/plugins/martix-csharp/**
---

## MartiX C# Instruction

Use these rules for the unified `martix-csharp` command assets.

## General Instructions

- Keep outputs language-focused unless framework specifics are explicitly
  requested.
- Prefer modern C# syntax supported by target TFM and LangVersion.
- Preserve behavior by default; call out intentional behavior shifts.
- Keep diffs small, readable, and convention-consistent.

## Enforceable Rules

1. Scope
   - MUST keep guidance C# language and API focused.
   - MUST NOT introduce architecture redesign unless requested.
2. Async
   - MUST propagate `CancellationToken` through async call chains.
   - MUST use `Async` suffix for async methods.
   - MUST NOT use `.Result`, `.Wait()`, or `.GetAwaiter().GetResult()` in
     normal flows.
   - MUST NOT use `async void` except event handlers.
3. Nullability and guards
   - MUST guard required reference inputs with
     `ArgumentNullException.ThrowIfNull`.
   - MUST guard required strings with `string.IsNullOrWhiteSpace`.
   - MUST avoid broad null-forgiving (`!`) unless justified explicitly.
4. Exceptions
   - MUST use precise exception types (`ArgumentException`,
     `InvalidOperationException`, etc.).
   - MUST NOT swallow exceptions (`catch { }`).
   - MUST log and rethrow, or convert to explicit result handling when
     appropriate.
5. API design
   - MUST apply least visibility exposure.
   - MUST keep naming consistent and intention-revealing.
   - MUST add XML docs for changed/new public APIs.
   - MUST include compatibility note when public contract behavior changes.
6. C# 14 patterns
   - For new extension members, SHOULD prefer extension blocks.
   - For simple property validation/transformation, SHOULD prefer `field`
     keyword.
   - SHOULD use null-conditional assignment where equivalent and clearer.
7. Testing
   - MUST map tests to the repository existing framework
     (TUnit/xUnit/NUnit/MSTest).
   - MUST provide at least one edge-case test recommendation for changed
     behavior.
   - SHOULD keep one behavior per test and follow AAA.

## Good Example - cancellable async boundary

```csharp
public async Task<CustomerDto> GetAsync(Guid id, CancellationToken cancellationToken)
{
    cancellationToken.ThrowIfCancellationRequested();

    var entity = await _repository.GetByIdAsync(id, cancellationToken).ConfigureAwait(false);
    return entity is null
        ? throw new InvalidOperationException($"Customer '{id}' was not found.")
        : new CustomerDto(entity.Id, entity.Name, entity.Email);
}
```

## Bad Example - hidden cancellation and broad catch

```csharp
public async Task<CustomerDto> GetAsync(Guid id)
{
    try
    {
        var entity = await _repository.GetByIdAsync(id);
        return new CustomerDto(entity.Id, entity.Name, entity.Email);
    }
    catch (Exception)
    {
        return null!;
    }
}
```

## Validation Baseline

Run from repository root unless task scope is narrower:

1. `dotnet restore --nologo`
2. `dotnet build --nologo`
3. `dotnet test --nologo --no-build`

If only a subset is changed, run targeted equivalents and report exact
coverage.

## Source Domains

Primary guidance sources:

- https://learn.microsoft.com/dotnet/csharp/
- https://learn.microsoft.com/dotnet/csharp/whats-new/
- https://github.com/dotnet/docs/tree/main/docs/csharp

Comparative/internal skill packs are secondary and must not override official
docs.

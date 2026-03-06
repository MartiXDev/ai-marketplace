---
description: 'Shared operating instructions for MartiX WebApi app planning and implementation assets.'
applyTo: plugins/martix-webapi/**
---

## MartiX WebApi Instruction

Use these rules for the unified `martix-webapi` command assets.

## General Instructions

- Target framework baseline is `net10.0` for new web app work.
- Default startup path uses `AddMartiXWebApiDefaults()` unless granular module
  registration is explicitly justified.
- Application handlers return `Result`/`Result<T>` and stay transport-agnostic.
- Endpoint layers perform HTTP mapping via `ToMinimalApiResult()` or an
  equivalent FastEndpoints mapper.
- Centralize exception handling through ASP.NET Core problem-details pipeline.
- Use `IRequestValidator<TRequest>` and pipeline behaviors for business
  validation.
- Keep changes minimal, compatibility-safe, and backed by tests.

## Best Practices

- For every write path, document whether idempotency is required.
- For state-change + external-publish flows, document outbox decision.
- Apply outbound HTTP resilience via `AddMartiXResilience` for remote calls.
- Register health probes and version/deprecation metadata.
- Include telemetry seams for trace and latency visibility.
- Record rationale for every architecture decision that changes defaults.

## Code Standards

### Naming and boundaries

- Keep feature names consistent across command/handler/endpoint files.
- Keep transport concerns in endpoint code, not handler/application code.
- Keep public contracts explicit and stable.

### Good Example - Result-first boundary

```csharp
var result = await handler.Handle(request, cancellationToken);
return result.ToMinimalApiResult();
```

### Bad Example - Handler returns HTTP transport type

```csharp
public Task<IResult> Handle(CreateOrderCommand request, CancellationToken ct)
{
    return Task.FromResult(Results.Ok());
}
```

## Common Patterns

### Startup composition

- Start with `AddMartiXWebApiDefaults()`.
- Add granular module registrations only when required by scope.

### Reliability decision logging

- Add idempotency/outbox/resilience decisions to feature plan artifacts.
- Revisit decisions when endpoint semantics or dependencies change.

## Validation Baseline

Run from target repository root unless scoped by task:

1. `dotnet restore MartiX.WebApi.slnx --nologo`
2. `dotnet build MartiX.WebApi.slnx -c Release --nologo`
3. `dotnet test tests\MartiX.WebApi.Tests\MartiX.WebApi.Tests.csproj -c Release --no-build`

If implementing in a new consumer app repository, run equivalent
solution/project restore/build/test commands and record exactly what was
validated.

## Maintenance

- Update this file when MartiX.WebApi guidance or repository validation
  commands change.
- Keep examples aligned with current framework and package versions.

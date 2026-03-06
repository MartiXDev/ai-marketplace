---
name: martix-webapi
description: Build new net10 APIs with MartiX.WebApi. Use when scaffolding vertical slices, planning Result-first handlers, deciding idempotency/outbox/resilience, and producing implementation checklists.
license: Proprietary MartiXDev internal usage
---

## MartiX WebApi Skill

Use this skill to design and implement new web applications that standardize on
`MartiX.WebApi` architecture and quality conventions.

## When to Use This Skill

- You are starting a new backend app that should target `net10.0`.
- You need a repeatable vertical-slice implementation workflow.
- You need explicit reliability, operability, and quality-gate decisions.

## Prerequisites

- Access to MartiX.WebApi guidance docs and sample patterns.
- .NET SDK available for restore/build/test validation.
- Clear feature scope and acceptance criteria.

## Project Structure Baseline

```text
src/{App}.Api/
tests/{App}.Api.Tests/
features/{FeatureName}/
  {FeatureName}Command.cs
  {FeatureName}Handler.cs
  {FeatureName}Validator.cs
  {FeatureName}Endpoint.cs
```

## Core Concepts

### Result-first application flow

- Keep handlers transport-agnostic by returning `Result`/`Result<T>`.
- Perform HTTP translation only at API endpoints.

### Reliability by design

- Evaluate idempotency for every write path.
- Apply outbox where state changes and message publication must remain
  consistent.
- Use standardized resilience for outbound HTTP calls.

### Operability and lifecycle

- Include health probes, telemetry seams, and API version metadata.
- Keep test-first delivery and analyzer gates part of the definition of done.

## Step-by-Step Workflow

1. Confirm scope, architectural boundaries, and API style.
2. Bootstrap with `AddMartiXWebApiDefaults()` and document any granular
   registration overrides.
3. Define vertical slices and Result-first handler contracts.
4. Decide validation/specification strategy and reliability requirements.
5. Implement tests first, then implement slices, then refactor.
6. Run validation and summarize outcomes, risks, and follow-ups.

## Architecture Checkpoints

- `net10.0` baseline with native ASP.NET Core problem-details pipeline.
- Endpoint-only mapping via `ToMinimalApiResult()` or FastEndpoints mapper.
- Validation via request validators and pipeline behavior.
- Explicit idempotency/outbox/resilience decisions for write flows.
- Health/telemetry/version metadata for operability.
- TDD-first delivery with analyzer and warning gates.

## Common Patterns

### Bootstrap pattern

```csharp
builder.Services.AddMartiXWebApiDefaults();
```

### Endpoint mapping pattern

```csharp
var result = await handler.Handle(request, ct);
return result.ToMinimalApiResult();
```

### Reliability decision pattern

- Write endpoint + retry risk: apply idempotency.
- State update + external publish: apply outbox.
- Remote dependency call: apply resilience policy.

## Output Checklist

- Slice/module map with planned implementation order.
- Architecture decision log (validation, reliability, operability).
- Validation evidence (`restore`, `build`, `test`) and unresolved risks.

## Troubleshooting

| Issue | Recommended action |
| --- | --- |
| Handlers returning HTTP types | Refactor handlers to return `Result`/`Result<T>` and map at endpoint. |
| Missing reliability decision for writes | Add explicit idempotency/outbox decision to plan and implementation notes. |
| Unclear validation ownership | Split shape validation (endpoint) from business validation (pipeline validators). |
| Inconsistent startup wiring | Start with `AddMartiXWebApiDefaults()` and only override with documented rationale. |

## References

- [Unified prompt](../../prompts/martix-webapi.prompt.md)
- [Shared instruction](../../instructions/martix-webapi.instructions.md)
- [Planning checklists](./references/planning-checklists.md)
- Source guidance: `C:\Git\MartiXDev\WebApi\docs\web-apps-guide.md`

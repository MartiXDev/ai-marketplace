## MartiX WebApi Planning Checklists

Use these checklists when producing plans and implementation tasks for new apps.

## Platform and Bootstrap

- Target framework is `net10.0`.
- Startup baseline uses `AddMartiXWebApiDefaults()`.
- Any granular `AddMartiXWebApi*` module registration has clear rationale.

## Result and Endpoint Boundaries

- Handlers return `Result`/`Result<T>` only.
- Endpoint layer maps to HTTP using `ToMinimalApiResult()` or FastEndpoints
  mapper.
- Exception flow is centralized with problem-details handler/middleware.

## Validation and Specifications

- Request validators are defined for business rules.
- Pipeline validation behavior is wired.
- Specification pattern is used when query reuse/complexity justifies it.

## Reliability Decisions for Writes

- Idempotency decision documented per write endpoint.
- Outbox decision documented where state and publication consistency is required.
- Outbound HTTP resilience strategy documented for external dependencies.

## Operability and Lifecycle

- Liveness and readiness probes included.
- Telemetry seams included for key operations.
- API version/deprecation metadata strategy defined.

## Testing and Quality Gates

- TDD sequence followed (red, green, refactor).
- Contract/integration tests cover critical and failure paths.
- Validation commands recorded with results.

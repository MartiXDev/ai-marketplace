## ASP.NET Core application shape

### Purpose

Provide the default architecture and request-pipeline rules for ASP.NET Core
apps, including Minimal APIs and controller-based services.

### Default guidance

- Keep startup explicit: configuration, dependency injection, middleware
  ordering, and endpoint registration should be easy to trace.
- Choose Minimal APIs for small focused HTTP surfaces and controllers when
  conventions, filters, or richer MVC features materially help.
- Use environment-aware configuration, health checks, and structured logging as
  first-class platform features rather than optional extras.
- Validate request models, return clear HTTP contracts, and keep business logic
  out of endpoint glue code.

### Avoid

- Do not hide critical middleware ordering inside extension methods without
  documentation.
- Do not mix transport concerns, business logic, and persistence logic in the
  same endpoint method.
- Do not add framework layers that fight the host, DI container, or routing
  model without a clear payoff.

### Review checklist

- Middleware order, auth, exception handling, and endpoint mapping are
  intentional.
- Endpoint style matches the size and complexity of the API surface.
- Operational concerns such as health, logs, and configuration are wired for
  production.

### Related files

- [HTTP resilience](./web-http-resilience.md)
- [Security guidance](./security-auth-authz.md)
- [Web stack source map](../references/web-stack-map.md)

### Source anchors

- [ASP.NET Core fundamentals](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/?view=aspnetcore-9.0)
- [Minimal APIs](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis?view=aspnetcore-10.0)
- [Web API guidance](https://learn.microsoft.com/en-us/aspnet/core/web-api/?view=aspnetcore-10.0)

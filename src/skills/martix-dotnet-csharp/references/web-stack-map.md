## Web stack map

### Purpose

Map ASP.NET Core application structure and outbound HTTP resilience guidance to
their official documentation sources.

### Rule coverage

- **App shape, host configuration, middleware, and endpoint style**
  - Rule files: `rules/web-aspnet-core.md`
  - Primary sources:
    - [ASP.NET Core fundamentals](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/?view=aspnetcore-9.0)
    - [Minimal APIs](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis?view=aspnetcore-10.0)
    - [Web API guidance](https://learn.microsoft.com/en-us/aspnet/core/web-api/?view=aspnetcore-10.0)
  - Notes: Use for web app structure, endpoint style choice, and operational
    baseline.
- **Outbound HTTP clients and resilience**
  - Rule files: `rules/web-http-resilience.md`
  - Primary sources:
    - [Build resilient HTTP apps with .NET](https://learn.microsoft.com/en-us/dotnet/core/resilience/http-resilience)
    - [Use IHttpClientFactory](https://learn.microsoft.com/en-us/dotnet/core/extensions/httpclient-factory)
  - Notes: Use for retries, timeouts, streaming, and client lifetime decisions.

### Maintenance notes

- Security, health checks, and diagnostics cross-cut the web stack; this map
  intentionally points readers to `quality-security-map.md` for those adjacent
  topics.
- If later work adds Minimal API-specific security or OpenAPI files, keep them
  linked here rather than splitting the package taxonomy.

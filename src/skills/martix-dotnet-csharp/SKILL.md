---
name: martix-dotnet-csharp
description: Standalone-first .NET 10+ and C# 14+ guidance for code review, modernization, refactoring, and scaffolding. Use when working on SDK-style projects, ASP.NET Core, Minimal APIs, EF Core, async flows, diagnostics, testing, security, or modern C# features.
license: Complete terms in LICENSE.txt
---

## MartiX .NET 10 and C# 14 router

- Standalone-first skill package focused on released .NET 10+ and C# 14+
  practices.
- Keep decisions grounded in the bundled rule files and Microsoft-backed
  reference maps.
- Use [AGENTS.md](./AGENTS.md) when the task crosses multiple domains or needs a
  longer review flow.

## When to use this skill

- Review or modernize SDK-style .NET projects.
- Shape ASP.NET Core or Minimal API services.
- Refactor async code, cancellation flows, or background work.
- Tune hot paths, spans, collections, or allocation-sensitive code.
- Review EF Core, JSON contracts, diagnostics, testing, or security defaults.

## Start with the source boundary

1. Read the
   [source index and guardrails](./references/doc-source-index.md).
2. Pick the closest domain map below.
3. Read only the linked rules needed for the current change.
4. Open [AGENTS.md](./AGENTS.md) for cross-domain review routes and package
   maintenance notes.

## Rule library by domain

### Language

- Use for released-feature adoption, branch clarity, and nullability contracts.
- Rules:
  - [Modern C# features](./rules/lang-modern-features.md)
  - [Pattern matching](./rules/lang-pattern-matching.md)
  - [Nullability and contracts](./rules/lang-nullability.md)
- Map: [C# language map](./references/csharp-language-map.md)

### SDK and build

- Use before changing `.csproj`, `global.json`, shared props or targets, or
  validation commands.
- Rules:
  - [SDK-style projects and repository build structure](./rules/sdk-project-system.md)
  - [Build, test, pack, and publish](./rules/sdk-build-test-pack-publish.md)
- Map: [Dotnet SDK and build map](./references/dotnet-sdk-map.md)

### Runtime and performance

- Use for spans, memory ownership, collection choice, immutability, and hot-path
  work.
- Rules:
  - [Memory, spans, and hot-path performance](./rules/runtime-memory-spans.md)
  - [Collections, concurrency, and immutability](./rules/runtime-collections-immutability.md)
- Map: [Runtime and BCL map](./references/runtime-bcl-map.md)

### Async and concurrency

- Use for `Task` vs `ValueTask`, streaming, cancellation, synchronization, and
  channels.
- Rules:
  - [Tasks, ValueTasks, async streams, and API shape](./rules/async-tasks-valuetasks.md)
  - [Cancellation and timeouts](./rules/async-cancellation-timeouts.md)
  - [Concurrency, synchronization, and channels](./rules/async-concurrency-channels.md)
- Map: [Async and concurrency map](./references/async-map.md)

### Design

- Use for API shape, type boundaries, validation, exception behavior, and
  dependency decisions.
- Rules:
  - [API and type design](./rules/design-api-type-design.md)
  - [Exceptions, validation, and failure contracts](./rules/design-exceptions-validation.md)
- Map: [Design map](./references/design-map.md)

### Web, data, quality, and security

- Web:
  - [HTTP clients and resilience](./rules/web-http-resilience.md)
  - [ASP.NET Core application shape](./rules/web-aspnet-core.md)
  - [Web stack map](./references/web-stack-map.md)
- Data:
  - [Serialization and payload contracts](./rules/data-serialization.md)
  - [Entity Framework Core](./rules/data-efcore.md)
  - [Data and serialization map](./references/data-stack-map.md)
- Quality and security:
  - [Unit and integration testing](./rules/testing-unit-integration.md)
  - [Logging, metrics, tracing, and health signals](./rules/diagnostics-logging-tracing.md)
  - [Authentication, authorization, and secure defaults](./rules/security-auth-authz.md)
  - [Quality, diagnostics, and security map](./references/quality-security-map.md)

## Package conventions

- Every rule follows the same section contract in
  [rules/_sections.md](./rules/_sections.md): `Purpose`, `Default guidance`,
  `Avoid`, `Review checklist`, `Related files`, and `Source anchors`.
- Use [the rule template](./templates/rule-template.md) for new rules,
  [the research pack template](./templates/research-pack-template.md) for future
  research packs, and
  [the comparison matrix template](./templates/comparison-matrix-template.md)
  for external comparisons.
- The taxonomy and preferred ordering live in
  [assets/taxonomy.json](./assets/taxonomy.json) and
  [assets/section-order.json](./assets/section-order.json).

## Standalone-first note

- This skill is authored as a standalone package under `src\skills`.
- If you document or install the package directly, use
  `npx skills add <source>` rather than `npx skill add`.
- The highest-priority local brief remains
  [docs\martix-dotnet-csharp\martix-dotnet-csharp.md](../../../docs/martix-dotnet-csharp/martix-dotnet-csharp.md).

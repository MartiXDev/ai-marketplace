---
name: dotnet-best-practices
description: 'Review or improve .NET and C# code against project best practices. Use whenever requests mention architecture, XML docs, primary constructors, DI, async/await, ResourceManager, MSTest, FluentAssertions, Moq, IConfiguration, Semantic Kernel, structured logging, security, or .NET 8 / C# 12 guidance.'
---

## .NET Best Practices Router

## When to Use

- Run a best-practices pass on new or existing .NET and C# code.
- Check project conventions for architecture, DI, configuration, logging, testing, or localization.
- Review code that touches `CommandHandler<TOptions>`, `ResourceManager`, `Semantic Kernel`, or service registration.

## Default Workflow

1. Preserve the solution architecture and namespace conventions before suggesting local edits.
2. Review correctness, maintainability, and testability before style-only changes.
3. Prefer established .NET patterns for DI, configuration, async flows, logging, and disposal.
4. Call out security, localization, and validation issues explicitly.

## Route Table

| Area | Prefer | Watch for |
| ---- | ------ | --------- |
| Documentation and structure | XML docs on public APIs and `{Core, Console, App, Service}.{Feature}` namespaces | Public behavior with no docs or unclear layering |
| Design and architecture | Primary constructors, `CommandHandler<TOptions>`, interfaces, focused classes | Overgrown types, hidden dependencies, or weak abstractions |
| DI and services | Constructor injection, `ArgumentNullException.ThrowIfNull(...)`, correct lifetimes, and `Microsoft.Extensions.DependencyInjection` conventions | Service locator patterns or ambiguous ownership |
| Localization | `ResourceManager` with separate `LogMessages` and `ErrorMessages` resources | Hardcoded user-facing or log text |
| Async | `async` and `await` for I/O, `Task` or `Task<T>`, and safe exception handling | Blocking calls or missing cancellation where needed |
| Testing | MSTest with FluentAssertions and Moq when tests exist | Unclear AAA flow or missing failure-path coverage |
| Configuration | Strongly typed options, data annotations, `IConfiguration` binding, and `appsettings.json` | Magic strings or unvalidated settings |
| AI integration | `Microsoft.SemanticKernel`, structured output, and explicit model settings | Opaque AI flows or unbounded prompt behavior |
| Logging and errors | Structured `ILogger` usage and specific exceptions | Stringly typed logs or swallowed exceptions |
| Security and performance | Input validation, parameterized queries, disposal, and .NET 8 or C# 12 features | Unsafe defaults, leaked resources, or unnecessary allocations |

## Validation

- Register services with intentional `Singleton`, `Scoped`, or `Transient` lifetimes.
- Keep methods cohesive, names domain-aligned, and duplication low.
- Prefer strongly typed configuration and explicit validation over ad hoc parsing.
- Test success, failure, and null-parameter paths when behavior is public or critical.

## References

- [Framework design guidelines](https://learn.microsoft.com/dotnet/standard/design-guidelines/)
- [.NET dependency injection](https://learn.microsoft.com/dotnet/core/extensions/dependency-injection)

---
name: dotnet-design-pattern-review
description: 'Review C#/.NET code for design patterns, architecture, and SOLID issues without changing code. Use whenever requests mention CommandHandler<TOptions>, Factory, Repository, Provider, Strategy, Template Method, DI, ResourceManager, or a design-pattern review in a .NET solution.'
---

## .NET Design Pattern Review Router

## When to Use

- Run a read-only design review of C# or .NET code.
- Evaluate Command, Factory, Repository, Provider, Strategy, Template Method, or DI patterns.
- Review architecture around async flows, configuration, localization, testability, or SOLID.

## Default Workflow

1. Identify the current architecture and the patterns already in use.
2. Review whether each pattern fits the problem, not just whether it exists.
3. Surface actionable findings with clear impact on maintainability, correctness, or extensibility.
4. Do not modify code unless the user later asks for implementation help.

## Review Routes

| Pattern or area | Verify | Watch for |
| --------------- | ------ | --------- |
| Command | `CommandHandler<TOptions>`, `ICommandHandler<TOptions>`, `CommandHandlerOptions`, and `SetupCommand(IHost host)` | Handlers that own too many responsibilities or skip validation |
| Factory | Centralized creation of complex objects and DI-aware composition | Scattered `new` logic or factories that leak container details |
| Dependency Injection | Primary constructors or constructor injection, abstractions, and service lifetimes | Service locator usage, hidden dependencies, or unclear ownership |
| Repository and Provider | Async data or service abstractions with clear contracts | Leaky infrastructure details or sync-over-async access |
| Resource pattern | `ResourceManager`, localized `LogMessages`, and localized `ErrorMessages` | Hardcoded strings or mixed resource concerns |
| GoF and SOLID | Strategy, Template Method, SRP, OCP, ISP, and DIP | Pattern overuse, rigid inheritance, or low-cohesion classes |
| Cross-cutting quality | Async correctness, disposal, configuration, logging, security, and XML docs | Risky defaults, weak validation, or poor testability |

## Output Expectations

- Summarize the strongest existing patterns first.
- Prioritize findings by impact, then explain the concrete improvement.
- Suggest project-aligned alternatives instead of generic pattern cargo culting.

## Validation

- Check namespace layering such as `{Core|Console|App|Service}.{Feature}` when it affects architecture.
- Prefer mockable boundaries, structured logging, and strongly typed configuration in recommendations.
- Flag missing async, disposal, input validation, or documentation when they weaken the pattern design.

## References

- [Dependency injection in .NET](https://learn.microsoft.com/dotnet/core/extensions/dependency-injection)
- [.NET architecture documentation](https://learn.microsoft.com/dotnet/architecture/)

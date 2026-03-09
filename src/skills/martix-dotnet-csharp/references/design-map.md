## Design map

### Purpose

Capture the official design, dependency injection, options, and exception
references that back the current design rules.

### Rule coverage

- **Type shape, visibility, naming, and dependency boundaries**
  - Rule files: `rules/design-api-type-design.md`
  - Primary sources:
    - [Framework design guidelines overview](https://learn.microsoft.com/en-us/dotnet/standard/design-guidelines/)
    - [Naming guidelines](https://learn.microsoft.com/en-us/dotnet/standard/design-guidelines/naming-guidelines)
    - [Dependency injection guidelines](https://learn.microsoft.com/en-us/dotnet/core/extensions/dependency-injection-guidelines)
  - Notes: Use for API review, visibility minimization, and abstraction
    discipline.
- **Validation and exception behavior**
  - Rule files: `rules/design-exceptions-validation.md`
  - Primary sources:
    - [Best practices for exceptions](https://learn.microsoft.com/en-us/dotnet/standard/exceptions/best-practices-for-exceptions)
    - [Design guidelines for exceptions](https://learn.microsoft.com/en-us/dotnet/standard/design-guidelines/exceptions)
  - Notes: Use for guard clauses, precise failures, and error handling
    contracts.

### Maintenance notes

- The Learn framework design guideline pages are useful but older; keep them
  as baseline references and cross-check strict new rules against newer .NET
  docs.
- Future expansion can add versioning, options, and disposal-specific entries
  without changing the current rule names.

## Exceptions, validation, and failure contracts

### Purpose

Define how .NET code should reject invalid input, surface failures, and
preserve useful context without swallowing errors.

### Default guidance

- Validate inputs early with precise exception types such as
  `ArgumentException`, `ArgumentNullException`, or `InvalidOperationException`.
- Use guard clauses to fail fast and keep the happy path small.
- Throw only when the caller cannot reasonably continue; otherwise consider
  `Try*` patterns, validation results, or domain-specific error objects.
- Log failures with structured context and let the exception bubble unless the
  layer can add meaningful handling.

### Avoid

- Do not throw or catch base `Exception` unless the framework contract requires
  it.
- Do not hide failures in silent catch blocks or ambiguous boolean results.
- Do not use exceptions for routine control flow in hot or expected paths.

### Review checklist

- Guard clauses cover null, whitespace, range, and invalid state where the
  contract demands it.
- Exception types and messages are specific enough for callers and logs.
- Tests assert precise failure behavior for public APIs and key domain rules.

### Related files

- [Nullability guidance](./lang-nullability.md)
- [Testing guidance](./testing-unit-integration.md)
- [Design source map](../references/design-map.md)

### Source anchors

- [Best practices for exceptions](https://learn.microsoft.com/en-us/dotnet/standard/exceptions/best-practices-for-exceptions)
- [Design guidelines for exceptions](https://learn.microsoft.com/en-us/dotnet/standard/design-guidelines/exceptions)
- [Project brief](../../../../docs/martix-dotnet-csharp/martix-dotnet-csharp.md)

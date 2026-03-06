---
name: martix-csharp
description: Solve C# language tasks with modern C# 14+ guidance. Use for syntax modernization, async correctness, nullability and immutability, API design, XML docs, and test planning when users ask for C# improvements or reviews, even if they do not explicitly mention C# best practices.
license: Proprietary MartiXDev internal usage
---

## MartiX C# Skill

Use this skill for language-focused C# work: modernization, correctness,
maintainability, documentation quality, and testability.

## When to Use This Skill

- You need to modernize existing code to C# 14+ idioms.
- You need safer async/await and cancellation propagation.
- You need stronger nullability contracts and guard behavior.
- You need cleaner API names, visibility boundaries, and exception semantics.
- You need public XML docs and test strategy guidance.

## Scope Boundaries

- Primary scope: C# language and API design quality.
- Optional scope: minimal framework examples only when needed for clarity.
- Non-goals: web app architecture, infrastructure topology, CI/CD, cloud design.

## Detail Files

| File | Topics |
| --- | --- |
| [references/csharp-14-language-patterns.md](./references/csharp-14-language-patterns.md) | C# 14 syntax patterns, modernization examples, quick migration notes |
| [references/csharp-anti-patterns.md](./references/csharp-anti-patterns.md) | Language-level anti-patterns and safer replacements |
| [references/source-inventory.md](./references/source-inventory.md) | Source authority and collection priorities |

## Step-by-Step Workflow

1. Confirm task mode (`author`, `refactor`, `fix`, `review`) and scope
   boundaries.
2. Identify TFM/C# version/nullability context and compatibility constraints.
3. Propose minimal language-level changes with behavior preservation by default.
4. Run mandatory checks (async, nullability, API contracts, docs, tests).
5. Provide concise output with risks, tradeoffs, and validation notes.

## Mandatory Patterns (Always Apply)

| Domain | Always | Avoid |
| --- | --- | --- |
| C# 14 extension members | Use `extension(...)` blocks for new extension members | Adding new `this`-style extensions by default |
| Property validation | Use `field` keyword in property accessors when validation/transforms are needed | Manual backing field boilerplate for simple validation |
| Null-safe assignment | Use null-conditional assignment (`obj?.Prop = value`) where semantics are equivalent | Verbose `if (obj != null)` assignment blocks |
| Async APIs | Propagate `CancellationToken`; suffix async methods with `Async` | Hidden cancellation or sync-over-async (`.Result`, `.Wait()`) |
| Nullability guards | `ArgumentNullException.ThrowIfNull` and `string.IsNullOrWhiteSpace` for input checks | Blanket null-forgiving (`!`) and generic `Exception` throws |
| API exposure | Least visibility (`private` > `internal` > `protected` > `public`) | Expanding visibility without need |
| Public API docs | Add/update XML comments for changed/new public members | Undocumented public behavior changes |
| DTO immutability | Prefer records for data-centric immutable DTOs | Mutable DTOs without clear need |

## Anti-Patterns to Avoid

- Using exceptions as routine control flow for expected outcomes.
- `async void` outside event handlers.
- Swallowing exceptions (`catch { }`) or logging without action.
- Exposing mutable internal collections directly.
- Returning framework transport details from core domain/library APIs.
- Changing public contracts without migration guidance.

See [references/csharp-anti-patterns.md](./references/csharp-anti-patterns.md)
for replacements and examples.

## Quick Reference

```text
MARTIX C# LANGUAGE QUICK REFERENCE
- Extension members: extension<T>(IEnumerable<T> source) { ... }
- Property validation: get => field; set => field = ...
- Null assignment: target?.Value = newValue;
- Cancellation: MethodAsync(..., CancellationToken ct)
- Null guards: ThrowIfNull(x); IsNullOrWhiteSpace(s)
- Visibility: private > internal > protected > public
- Public docs: /// <summary>...</summary>
- Tests: one behavior per test, AAA structure
```

## Output Checklist

- Scope and assumptions confirmed.
- Proposed language-level changes with rationale.
- Domain check table with status and risk.
- Test strategy mapped to existing framework.
- Validation commands and outcomes (or explicit limitation).
- Open risks and follow-up tasks.

## References

- [Unified prompt](../../prompts/martix-csharp.prompt.md)
- [Shared instruction](../../instructions/martix-csharp.instructions.md)
- [Validation hook](../../hooks/martix-csharp-validation.hook.yaml)
- [Source inventory](./references/source-inventory.md)
- [C# 14 language patterns](./references/csharp-14-language-patterns.md)
- [C# anti-patterns](./references/csharp-anti-patterns.md)

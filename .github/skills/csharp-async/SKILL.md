---
name: csharp-async
description: 'Review, write, or refactor C# async code using TAP best practices. Use whenever requests mention async/await, Task, ValueTask, CancellationToken, IAsyncEnumerable, ConfigureAwait, Task.WhenAll, deadlocks, .Result, .Wait(), or sync-over-async bugs in .NET.'
---

## C# Async Router

## When to Use

- Add or review async and await code in C# or .NET.
- Choose between `Task`, `Task<T>`, `ValueTask<T>`, and `IAsyncEnumerable<T>`.
- Fix deadlocks, blocking calls, cancellation gaps, or concurrency issues.

## Default Workflow

1. Use the Task-based Asynchronous Pattern for public APIs.
2. Keep async method names aligned with sync counterparts and add the `Async` suffix.
3. Remove blocking calls before tuning performance.
4. Add cancellation, exception handling, and concurrency guidance where it changes correctness.

## Route Table

| Area | Prefer | Avoid |
| ---- | ------ | ----- |
| Naming | `GetDataAsync` for async APIs | Async methods without the `Async` suffix |
| Return type | `Task`, `Task<T>`, or `ValueTask<T>` for hot paths | `async void` except event handlers |
| Composition | `Task.WhenAll()` and `Task.WhenAny()` | Manual polling or serialized awaits when work can run together |
| Streams | `IAsyncEnumerable<T>` for async sequences | Buffering everything before returning |
| Context | `ConfigureAwait(false)` in reusable library code when safe | Assuming context capture is always required |
| Cancellation | `CancellationToken` on long-running or I/O work | Fire-and-forget work with no cancellation path |

## Validation

- Await task-returning calls unless the method intentionally returns the task directly.
- Do not mix `.Wait()`, `.Result`, or `.GetAwaiter().GetResult()` into async flows.
- Use `try` and `catch` around awaited operations when you need local recovery or richer errors.
- Avoid swallowing exceptions, and prefer `Task.FromException(...)` or direct task returns over needless async wrappers.

## References

- [Async programming scenarios in C#](https://learn.microsoft.com/dotnet/csharp/asynchronous-programming/)
- [Task-based Asynchronous Pattern](https://learn.microsoft.com/dotnet/standard/asynchronous-programming-patterns/task-based-asynchronous-pattern-tap)

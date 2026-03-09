## Tasks, ValueTasks, async streams, and API shape

### Purpose

Keep async APIs idiomatic, cancelable, and allocation-aware without adding
accidental complexity.

### Default guidance

- Use `Task` and `Task<T>` as the default async return types, and suffix
  asynchronous methods with `Async`.
- Use `ValueTask` only when measurement or a known synchronous-completion path
  shows a meaningful benefit and the consumption rules are understood.
- Stream data with `IAsyncEnumerable<T>` when callers benefit from partial
  results or large datasets should not buffer eagerly.
- Perform fast argument validation before the first `await`, then let
  exceptions and cancellations flow naturally.

### Avoid

- Do not wrap an existing task in an unnecessary `async` and `await` layer.
- Do not use `ValueTask` casually in public APIs where the savings are
  theoretical or the consumer burden is higher.
- Do not block on tasks with `.Result`, `.Wait()`, or other sync-over-async
  bridges.

### Review checklist

- Async names, return types, and cancellation parameters follow TAP
  expectations.
- Large or streaming workloads avoid full buffering when not required.
- Tests cover success, failure, and cancellation behavior.

### Related files

- [Cancellation and timeouts](./async-cancellation-timeouts.md)
- [Concurrency and channels](./async-concurrency-channels.md)
- [Async source map](../references/async-map.md)

### Source anchors

- [Task-based asynchronous pattern](https://learn.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/task-based-asynchronous-pattern-tap)
- [C# async scenarios](https://learn.microsoft.com/en-us/dotnet/csharp/asynchronous-programming/async-scenarios)
- [Async source map](../references/async-map.md)

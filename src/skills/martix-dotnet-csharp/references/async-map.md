## Async and concurrency map

### Purpose

Connect TAP, cancellation, synchronization, and channel guidance to the
official async and threading documentation.

### Rule coverage

- **Task and ValueTask API shape**
  - Rule files: `rules/async-tasks-valuetasks.md`
  - Primary sources:
    - [Task-based asynchronous pattern](https://learn.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/task-based-asynchronous-pattern-tap)
    - [C# async scenarios](https://learn.microsoft.com/en-us/dotnet/csharp/asynchronous-programming/async-scenarios)
  - Notes: Use for naming, return-type choice, validation timing, and async
    streams.
- **Cancellation and timeout handling**
  - Rule files: `rules/async-cancellation-timeouts.md`
  - Primary sources:
    - [Cancellation in managed threads](https://learn.microsoft.com/en-us/dotnet/standard/threading/cancellation-in-managed-threads)
    - [Implementing TAP](https://learn.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/implementing-the-task-based-asynchronous-pattern)
  - Notes: Focuses on end-to-end cancellation and bounded work.
- **Concurrency primitives and channels**
  - Rule files: `rules/async-concurrency-channels.md`
  - Primary sources:
    - [Channels library](https://learn.microsoft.com/en-us/dotnet/core/extensions/channels)
    - [Synchronization primitives overview](https://learn.microsoft.com/en-us/dotnet/standard/threading/overview-of-synchronization-primitives)
    - [Task parallel library overview](https://learn.microsoft.com/en-us/dotnet/standard/parallel-programming/task-parallel-library-tpl)
  - Notes: Covers backpressure, parallelism, and safe coordination.

### Maintenance notes

- The first pass intentionally folds async streams into the task rule and
  channel guidance into the concurrency rule to match the approved future
  structure.
- Expand with `IAsyncDisposable` or timer-specific guidance only if the future
  structure is revised.

---
name: csharp-tunit
description: 'Write or review TUnit tests for .NET, including data-driven and xUnit migration patterns. Use whenever requests mention TUnit, [Test], [Arguments], [MethodData], [ClassData], ITestDataSource, async assertions, lifecycle hooks, parallelism, or converting xUnit tests.'
---

## TUnit Router

## When to Use

- Create or review unit tests in a TUnit project.
- Add data-driven tests with `Arguments`, `MethodData`, `ClassData`, or `ITestDataSource`.
- Migrate tests from xUnit or tune lifecycle, retry, timeout, and parallel execution behavior.

## Default Workflow

1. Keep one behavior per test and follow Arrange-Act-Assert.
2. Use `[Test]` for both standard and data-driven tests, then pick the narrowest data source attribute.
3. Prefer `await Assert.That(...)` assertions and async test flows end to end.
4. Add lifecycle, retry, or parallelism attributes only when they solve a real test concern.

## Test Routes

| Scenario | Use | Notes |
| -------- | --- | ----- |
| Basic test | `[Test]` | No test class attribute is required. |
| Inline data | `[Arguments]` | Multiple attributes can feed the same test. |
| Method-backed data | `[MethodData]` | Good for reusable or computed cases. |
| Class-backed data | `[ClassData]` or `ITestDataSource` | Use for larger or custom datasets. |
| Per-test setup and cleanup | `[Before(Test)]` and `[After(Test)]` | Prefer this over constructor or `IDisposable` patterns. |
| Shared setup | `[Before(Class)]`, `[After(Class)]`, `[Before(Assembly)]`, and `[After(Assembly)]` | Use the smallest shared scope. |
| Session hooks | `[Before(TestSession)]` and `[After(TestSession)]` | Reserve for suite-wide orchestration. |

## Assertion and Execution Routes

| Need | Pattern |
| ---- | ------- |
| Value equality | `await Assert.That(actual).IsEqualTo(expected)` |
| Reference equality | `await Assert.That(actual).IsSameReferenceAs(expected)` |
| Boolean checks | `await Assert.That(condition).IsTrue()` or `.IsFalse()` |
| Collections | `.Contains(...)` or `.DoesNotContain(...)` |
| Exceptions | `await Assert.That(action).Throws<T>()` or `.ThrowsAsync<T>()` |
| Alternatives | Chain with `.And` or `.Or` |
| Parallel control | `[NotInParallel]` or `[ParallelLimit<T>]` |
| Resilience | `[Retry(n)]`, `[Repeat(n)]`, `[Timeout(ms)]`, or `[Skip("reason")]` |

## Validation

- Target .NET 8 or later and keep tests in a dedicated `[ProjectName].Tests` project.
- Make tests independent and idempotent; use `[DependsOn]` only when order is intentional.
- Use `Category`, `DisplayName`, and `TestContext` for discoverability and diagnostics.
- When migrating from xUnit, replace `[Fact]` and `[Theory]` with `[Test]` plus the appropriate TUnit data attributes.

## References

- [TUnit documentation](https://tunit.dev/)

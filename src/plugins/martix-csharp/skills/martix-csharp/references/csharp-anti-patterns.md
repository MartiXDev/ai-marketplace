## C# Anti-Patterns

Avoid these language-level issues in author/refactor/review work.

## Quick Reference

| Anti-pattern | Why it hurts | Preferred fix |
| --- | --- | --- |
| `.Result` / `.Wait()` on async tasks | Deadlock and thread starvation risk | `await` end-to-end |
| `async void` (non-event handlers) | Unobservable failures | Return `Task` |
| `catch (Exception) { }` | Silent failures | Catch specific exceptions and log/action |
| Broad `Exception` throws | Poor diagnostics and contract clarity | Precise exception types |
| Null-forgiving overuse (`!`) | Hides contract problems | Guards and nullable annotations |
| Public mutable collections | External mutation leaks invariants | `IReadOnlyList<T>` / copy |
| Manual backing fields everywhere | Boilerplate and drift | `field` keyword for simple accessor logic |
| Exceptions for expected branch logic | Expensive flow control | Result/nullable-based outcomes |

## Examples

### 1) Sync-over-async

```csharp
// Bad
var customer = _client.GetAsync(id).Result;

// Better
var customer = await _client.GetAsync(id, cancellationToken);
```

### 2) Swallowed exception

```csharp
// Bad
try
{
    await processor.RunAsync(cancellationToken);
}
catch { }

// Better
try
{
    await processor.RunAsync(cancellationToken);
}
catch (InvalidOperationException ex)
{
    _logger.LogError(ex, "Processing failed.");
    throw;
}
```

### 3) Weak guard behavior

```csharp
// Bad
public User Create(string name) => new(name!.Trim());

// Better
public User Create(string name)
{
    if (string.IsNullOrWhiteSpace(name))
    {
        throw new ArgumentException("Name is required.", nameof(name));
    }

    return new User(name.Trim());
}
```

### 4) Mutable API leak

```csharp
// Bad
public List<Order> Orders => _orders;

// Better
public IReadOnlyList<Order> Orders => _orders;
```

## Review Checklist

- Are async methods cancellable where I/O may block?
- Are exception types specific and actionable?
- Are nullable contracts explicit and enforced?
- Is public surface minimally exposed and documented?
- Are expected failures modeled without exception-driven control flow?

## C# 14 Language Patterns

Use these patterns for modernization tasks when target TFM/LangVersion supports
C# 14.

## Quick Pattern Table

| Scenario | Prefer | Avoid |
| --- | --- | --- |
| New extension members | `extension(...) { ... }` blocks | New `this` extension methods by default |
| Property validation/transforms | `field` keyword in accessors | Manual backing fields for simple cases |
| Null check and assignment | `target?.Prop = value` | Verbose `if (target != null)` blocks |
| Async APIs | `Task/ValueTask` with cancellation propagation | Sync-over-async |
| Input contracts | Guard clauses and precise exceptions | Late null failures |

## Pattern 1: Extension blocks

```csharp
public static class EnumerableExtensions
{
    extension<T>(IEnumerable<T> source)
    {
        public bool IsEmpty => !source.Any();
        public IEnumerable<T> WhereNotNull() => source.Where(static x => x is not null)!;
    }
}
```

Use for new extension members where C# 14 is available.

## Pattern 2: `field` keyword for property logic

```csharp
public sealed class UserProfile
{
    public string DisplayName
    {
        get => field;
        set => field = string.IsNullOrWhiteSpace(value)
            ? throw new ArgumentException("Display name is required.", nameof(value))
            : value.Trim();
    }
}
```

Reduces boilerplate and keeps validation local to property logic.

## Pattern 3: Null-conditional assignment

```csharp
session?.LastAccessUtc = DateTime.UtcNow;
orders?[0] = replacementOrder;
```

Use when semantics are equivalent and readability improves.

## Pattern 4: Nullability contract guards

```csharp
public static string Normalize(string value)
{
    if (string.IsNullOrWhiteSpace(value))
    {
        throw new ArgumentException("Value cannot be null or whitespace.", nameof(value));
    }

    return value.Trim();
}
```

Prefer clear guards over broad null-forgiving.

## Pattern 5: Async boundary with cancellation

```csharp
public async Task<IReadOnlyList<OrderDto>> GetOrdersAsync(
    Guid customerId,
    CancellationToken cancellationToken)
{
    cancellationToken.ThrowIfCancellationRequested();

    var orders = await _repository
        .GetByCustomerIdAsync(customerId, cancellationToken)
        .ConfigureAwait(false);

    return orders;
}
```

## Version Guardrail

Before recommending C# 14 syntax:

- Confirm target project supports it.
- If unknown, provide a fallback and call out assumptions.

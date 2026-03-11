---
name: csharp-docs
description: 'Write or review XML documentation comments for C# APIs. Use whenever requests mention XML docs, <summary>, <param>, <returns>, <inheritdoc/>, cref links, public types, constructors, properties, methods, or exception documentation.'
---

## C# XML Documentation Router

## When to Use

- Add or improve XML comments on public C# APIs.
- Standardize `summary`, `remarks`, `example`, and cross-reference tags.
- Review constructors, methods, properties, generic parameters, or exceptions for documentation quality.

## Default Workflow

1. Document public members first, then add internal comments when complexity warrants it.
2. Use concise present-tense summaries that describe behavior instead of repeating signatures.
3. Match tag choice to the member shape instead of forcing the same template everywhere.
4. Prefer `cref`, `paramref`, and `typeparamref` links over repeated names in prose.

## Member Routes

| Member | Lead wording | Key tags | Notes |
| ------ | ------------ | -------- | ----- |
| Type or member | One sentence that states what it does | `<summary>`, optional `<remarks>` or `<example>` | Use `<see cref>` and `<seealso>` for related APIs. |
| Constructor | `Initializes a new instance of the ... class.` | `<summary>`, `<exception cref>` | Expand inherited behavior only when it materially changes. |
| Method | Action-oriented summary | `<param>`, `<typeparam>`, `<returns>`, `<exception cref>` | Keep parameter and return text as noun phrases. |
| Property | `Gets...`, `Gets or sets...`, or Boolean wording | `<summary>`, `<value>` | Make `true` and `false` outcomes explicit for Boolean properties. |
| Inherited member | Reuse base documentation | `<inheritdoc/>` | Add local remarks only for meaningful behavior differences. |

## Tag Routes

| Tag | Use for |
| --- | ------- |
| `<remarks>` | Extra behavior, lifecycle notes, caveats, or usage guidance |
| `<c>` and `<code language="csharp">` | Inline code and block examples inside `<example>` |
| `<see langword>` | C# keywords such as `null`, `true`, `false`, `int`, and `bool` |
| `<paramref>` and `<typeparamref>` | Inline references to parameter and generic type names |
| `<seealso>` | Standalone related links in generated docs |

## Validation

- Start constructor summaries with `Initializes a new instance...`.
- For Boolean parameters and returns, describe the `true` path first and the `false` path second.
- For flag enums, begin with `A bitwise combination of the enumeration values that specifies...`.
- For non-flag enums, begin with `One of the enumeration values that specifies...`.
- For `out` parameters, use `When this method returns, contains ... This parameter is treated as uninitialized.`
- Use `<exception cref>` for exceptions thrown directly by the member and describe the condition.

## References

- [Recommended XML tags for C# documentation comments](https://learn.microsoft.com/dotnet/csharp/language-reference/xmldoc/recommended-tags)

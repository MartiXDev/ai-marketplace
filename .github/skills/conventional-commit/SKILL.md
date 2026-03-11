---
name: conventional-commit
description: 'Generate or review Conventional Commit messages in structured XML and final commit form. Use whenever requests mention conventional commits, commit messages, git commit, type/scope selection, BREAKING CHANGE, changelog-friendly history, or mapping diffs to feat, fix, docs, refactor, chore, ci, test, perf, build, or revert.'
---

## Conventional Commit Router

## When to Use

- Turn staged or unstaged Git changes into a Conventional Commit.
- Choose the right `type`, `scope`, or `BREAKING CHANGE` footer.
- Produce structured XML plus the final `type(scope): description` line.

## Default Workflow

1. Review `git status`, `git diff`, or `git diff --cached` when repository state is available.
2. Infer the smallest accurate commit `type` from the actual change.
3. Add `scope` only when it helps and is supported by the diff.
4. Keep the description short, imperative, and release-note friendly.
5. Add body and footer only when they add important context.

## Commit Routes

| Need | Guidance |
| ---- | -------- |
| Commit type | Use `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`. |
| Scope | Keep it optional and narrow, such as `api`, `ui`, or `docs`. |
| Description | Use a short imperative summary such as `add`, `fix`, `update`, or `remove`. |
| Body | Explain why the change exists, important side effects, or migration notes. |
| Footer | Use for `BREAKING CHANGE:` details and issue references. |

## XML Template

```xml
<commit-message>
  <type>feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert</type>
  <scope>optional-scope</scope>
  <description>short imperative summary</description>
  <body>optional rationale or context</body>
  <footer>optional BREAKING CHANGE or issue reference</footer>
</commit-message>
```

## Validation

- Do not invent a scope when the change is cross-cutting or unclear.
- Use `!` in the header or a `BREAKING CHANGE:` footer when compatibility changes.
- Keep the first line concise; move detail into the body or footer.
- If the user wants a command, return a ready-to-run `git commit -m` example.

## References

- [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/)

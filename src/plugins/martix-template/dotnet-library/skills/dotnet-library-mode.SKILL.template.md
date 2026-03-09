---
name: <plugin-id-prefix>-<mode>
description: <Build and evolve .NET libraries with compatibility-safe outcomes. Include trigger scenarios, operation mode, and expected deliverables.>
license: <license>
---

## .NET Library Skill

Layered .NET library guidance for AI agents and maintainers. Use this skill
package when you need compatibility-safe outcomes, explicit validation evidence,
and progressively deeper guidance from quick reference to detailed rules.

## When to use this skill

- <Trigger 1>
- <Trigger 2>
- <Trigger 3>

## Skill package structure

| Layer | Purpose | Location |
| --- | --- | --- |
| Quick reference | High-signal overview and workflow | `./SKILL.md` |
| Expanded guide | Long-form context for large tasks | `./AGENTS.md` |
| Category metadata | Priorities, prefixes, and source references | `./metadata.json` |
| Focused rule files | Detailed patterns with incorrect/correct examples | `./rules/` |
| Operational runbooks | Checklists and source inventories | `./references/` |
| Evaluation suite | Repo-native prompt/assertion coverage | `./evals/` |

## Guidance categories

| Priority | Category | Impact | Prefix | Detail path |
| --- | --- | --- | --- | --- |
| 1 | Compatibility and API evolution | CRITICAL | `compat-` | `./rules/compat-*.md` |
| 2 | Targeting and framework strategy | HIGH | `target-` | `./rules/target-*.md` |
| 3 | Dependencies and packaging | HIGH | `package-` | `./rules/package-*.md` |
| 4 | Validation and release readiness | HIGH | `validate-` | `./rules/validate-*.md` |
| 5 | Documentation and discoverability | MEDIUM | `docs-` | `./rules/docs-*.md` |
| 6 | Advanced interoperability | LOW | `advanced-` | `./rules/advanced-*.md` |

## Quick reference

### 1. Compatibility and API evolution

- `compat-additive-evolution` - Prefer additive API changes and migration
  bridges.
- `compat-obsolete-bridge` - Use `[Obsolete]` and clear transition guidance
  before removals.

### 2. Targeting and framework strategy

- `target-modern-tfm` - Prefer modern targets unless compatibility requires
  more.
- `target-support-matrix` - State supported TFMs and consumers explicitly.

### 3. Dependencies and packaging

- `package-minimal-dependencies` - Keep dependencies minimal and justified.
- `package-debug-quality` - Keep Source Link, symbols, and metadata release
  ready.

### 4. Validation and release readiness

- `validate-shared-gates` - Run restore/build/test and pack when packaging is
  in scope.
- `validate-risk-summary` - Report residual risks and release blockers
  explicitly.

## Prerequisites

- Access to target repository and solution structure.
- .NET SDK installed and runnable.
- Clear change scope and compatibility expectations.

## Project structure baseline

```text
src/{Library}/
tests/{Library}.Tests/
Directory.Build.props
Directory.Packages.props
```

## Core concepts

### Compatibility-first evolution

- <How source, binary, and behavioral compatibility are handled.>

### Dependency and packaging quality

- <How dependency policy and package quality are enforced.>

### Validation and release gates

- <What must pass before release recommendation.>

## Step-by-step workflow

1. Analyze current behavior, contracts, and target framework strategy.
2. Apply minimal implementation and API changes.
3. Update tests for happy path, edge cases, and compatibility risks.
4. Classify compatibility impact and mitigation.
5. Run shared validation commands and capture evidence.
6. Summarize release readiness and residual risk.

## .NET library guidance checkpoints

- Cross-platform target strategy (`net8.0+`, plus `netstandard2.0` only when required).
- Dependency policy (avoid exact and upper-bound package constraints).
- Versioning and breaking change assessment (SemVer + migration guidance).
- Package/debugging readiness (NuGet metadata, Source Link, symbols, deterministic builds).

## Common patterns

### Target framework policy pattern

```xml
<TargetFramework>net10.0</TargetFramework>
```

### Dependency policy pattern

- <How minimum versions and upper bounds are handled.>

### Obsolete migration pattern

- <How compatibility bridges and deprecation notes are authored.>

## Output checklist

- Summary of changes and rationale.
- Compatibility impact and risk notes.
- Validation evidence and remaining follow-ups.

## Troubleshooting

| Issue | Recommended action |
| --- | --- |
| <Issue 1> | <Action 1> |
| <Issue 2> | <Action 2> |

## Progressive resources

- Quick reference: `./SKILL.md`
- Expanded guide: `./AGENTS.md`
- Category metadata: `./metadata.json`
- Rule files: `./rules/`
- Detailed checklists: `./references/dotnet-library-checklists.md`
- Source inventory: `./references/source-inventory.md`
- Evaluation prompts: `./evals/evals.json`

## References

- Mode prompt: `../../prompts/<plugin-id-prefix>-<mode>.prompt.md`
- Shared instruction: `../../instructions/<plugin-id-prefix>.instructions.md`
- Validation hook: `../../hooks/<plugin-id-prefix>-validation.hook.yaml`
- Expanded guide: `./AGENTS.md`
- Category map: `./rules/_sections.md`
- Mode checklists: `./references/dotnet-library-checklists.md`
- Source inventory: `./references/source-inventory.md`
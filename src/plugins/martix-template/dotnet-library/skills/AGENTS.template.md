## Expanded .NET Library Guidance

Use this file as the long-form companion to `SKILL.md` when the skill needs more
detail than the quick reference can provide.

## How to use this file

- Start with `SKILL.md` for the high-signal overview.
- Pull in only the rule files and reference docs needed for the current task.
- Keep this file synchronized with `metadata.json`, `rules/`, and `references/`.

## Guidance categories

| Priority | Category | Prefix | Purpose |
| --- | --- | --- | --- |
| 1 | Compatibility and API evolution | `compat-` | Preserve contracts and migration paths |
| 2 | Targeting and framework strategy | `target-` | Keep TFM decisions explicit and supportable |
| 3 | Dependencies and packaging | `package-` | Control NuGet, packaging, and debug quality |
| 4 | Validation and release readiness | `validate-` | Capture evidence and release gates |
| 5 | Documentation and discoverability | `docs-` | Keep public guidance and metadata aligned |
| 6 | Advanced interoperability | `advanced-` | Cover niche cases without bloating the quick reference |

## Expanded sections

### 1. Compatibility and API evolution

- Expand the summaries from `SKILL.md`.
- Link to focused rule files such as `rules/compat-*.md`.
- Include incorrect/correct examples when the tradeoff is subtle or risky.

### 2. Targeting and framework strategy

- Explain TFM choices, compatibility tradeoffs, and fallback guidance.
- Link to `rules/target-*.md` and source inventory entries.

### 3. Dependencies and packaging

- Capture package policy, Source Link expectations, and deterministic build
  guidance.
- Link to `rules/package-*.md`.

### 4. Validation and release readiness

- Record validation gate expectations and when `pack` is in scope.
- Link to runbooks in `references/`.

### 5. Documentation and discoverability

- Clarify XML docs, public API clarity, and maintenance metadata.
- Link to `rules/docs-*.md`.

### 6. Advanced interoperability

- Reserve this section for niche or optional patterns.
- Keep the main quick reference small and move deep detail here.

## Synchronization checklist

- `SKILL.md` quick-reference categories still match this document.
- `metadata.json` priorities, prefixes, and references are current.
- `rules/_sections.md` and rule filenames still align.
- `references/` and `evals/` point at the same workflows and quality gates.
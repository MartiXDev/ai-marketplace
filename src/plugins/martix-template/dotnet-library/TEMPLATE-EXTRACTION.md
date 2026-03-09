## Template extraction map for `martix-dotnet-library`

This map records reusable patterns extracted from
`plugins/martix-dotnet-library` into `plugins/martix-template/dotnet-library`.

## Extraction goals

- Keep concrete plugin assets explicit and runnable.
- Move repeated structure/boilerplate into template files.
- Reduce copy/paste drift across future `martix-*` plugins.
- Align skill-package structure and writing style with the layered patterns used
  by `vercel-labs/agent-skills/react-best-practices`, adapted to this repo's
  plugin-first architecture.

## Candidate extraction inventory

| Concrete source pattern | Reusable element | Target template |
| --- | --- | --- |
| `agents/martix-dotnet-library.agent.yaml` | Shared agent schema + entrypoint pattern + workflow shape | `agents/dotnet-library-mode.agent.template.yaml` |
| `skills/martix-dotnet-library/SKILL.md` | Shared skill frontmatter + quick reference + workflow + layered resource links | `skills/dotnet-library-mode.SKILL.template.md` |
| `skills/<skill>/AGENTS.md` | Expanded long-form guide for complex agent context | `skills/AGENTS.template.md` |
| `skills/<skill>/README.md` | Skill package maintenance workflow and style rules | `skills/README.template.md` |
| `skills/<skill>/metadata.json` | Skill metadata, abstract, category priorities, and source references | `skills/metadata.template.json` |
| `skills/<skill>/rules/_sections.md` | Category ordering, impacts, and filename prefixes | `skills/rules/_sections.template.md` |
| `skills/<skill>/rules/_template.md` | Individual rule authoring pattern with incorrect/correct examples | `skills/rules/_template.md` |
| `skills/martix-dotnet-library/references/release-checklists.md` | Reusable mode checklists and release-readiness structure | `skills/references/dotnet-library-checklists.template.md` |
| `skills/<skill>/references/source-inventory.md` | Reusable authority/source prioritization map | `skills/references/source-inventory.template.md` |
| `skills/<skill>/evals/evals.json` | Repo-native evaluation suite structure for layered skills | `skills/evals/evals.template.json` |
| `prompts/martix-dotnet-library.prompt.md` | Shared prompt sections (Role, Required Inputs, Steps, Deliverable, References) | `prompts/dotnet-library-mode.prompt.template.md` |
| `instructions/martix-dotnet-library.instructions.md` | Shared .NET library operating rules and quality gates | `instructions/dotnet-library.instructions.template.md` |
| `hooks/martix-dotnet-library-validation.hook.yaml` | Shared validation gate shape | `hooks/dotnet-library-validation.hook.template.yaml` |
| `INFO.template.md` | Reusable plugin info structure | `INFO.template.md` |
| `RESOURCES.md` | Reusable resource and requirement registry structure | `RESOURCES.template.md` |

## Concrete assets intentionally not extracted

- `commands/command-catalog.yaml` and `workflows/workflow-catalog.yaml` remain
  plugin-owned because IDs and entrypoint file paths are plugin-specific.
- `plugin.yaml` and `plugin.json` remain plugin-owned because metadata and
  packaging scope are plugin-specific.

## Layered skill-package notes

- Concrete plugins should keep quick reference guidance in `SKILL.md` and place
  deeper rule-level detail in `rules/` and `references/`.
- `AGENTS.md`, `README.md`, and `metadata.json` are optional but recommended
  when a skill becomes large enough to need richer scaffolding and maintenance
  guidance.
- Use repo-native `skills/**/evals/` to capture evaluation prompts and
  assertions instead of copying Vercel's generated outputs directly.

## Simplification note

`martix-dotnet-library` now uses one unified agent/skill/prompt command model.
Mode-specific split assets should only be introduced if future complexity or
separate governance requires it.
## Template extraction map for `martix-dotnet-library`

This map records reusable patterns extracted from
`plugins/martix-dotnet-library` into `plugins/martix-template/dotnet-library`.

## Extraction goals

- Keep concrete plugin assets explicit and runnable.
- Move repeated structure/boilerplate into template files.
- Reduce copy/paste drift across future `martix-*` plugins.

## Candidate extraction inventory

| Concrete source pattern | Reusable element | Target template |
| --- | --- | --- |
| `agents/martix-dotnet-library.agent.yaml` | Shared agent schema + entrypoint pattern + workflow shape | `agents/dotnet-library-mode.agent.template.yaml` |
| `skills/martix-dotnet-library/SKILL.md` | Shared skill frontmatter/workflow/checklist structure | `skills/dotnet-library-mode.SKILL.template.md` |
| `skills/martix-dotnet-library/references/release-checklists.md` | Reusable mode checklists and release-readiness structure | `skills/references/dotnet-library-checklists.template.md` |
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

## Simplification note

`martix-dotnet-library` now uses one unified agent/skill/prompt command model.
Mode-specific split assets should only be introduced if future complexity or
separate governance requires it.


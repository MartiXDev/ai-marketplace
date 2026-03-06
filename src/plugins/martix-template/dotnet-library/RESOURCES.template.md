---
plugin: <plugin-name>
artifact: resource-registry
purpose: Track resources and requirements used to build and maintain plugin assets
---

## External resources (authoritative references)

| Topic | Source | Used for |
| --- | --- | --- |
| CLI plugin concepts | <URL> | Plugin structure and behavior model |
| Plugin install flow | <URL> | Marketplace registration and install flow |
| Plugin authoring | <URL> | Plugin manifest and packaging choices |
| Skill authoring | <URL> | Skill file structure and frontmatter |
| Agent authoring | <URL> | Agent structure and usage model |
| .NET cross-platform targeting | <URL> | TFM strategy and compatibility policy |
| .NET versioning and breaking changes | <URL> | SemVer and compatibility analysis |
| .NET dependencies and packaging | <URL> | NuGet dependency strategy and publish quality |
| .NET Source Link guidance | <URL> | Debugging and traceability quality |

## Internal resources (local source files)

| File | Role |
| --- | --- |
| `./plugin.yaml` | Human-readable plugin metadata |
| `./plugin.json` | Copilot CLI plugin manifest |
| `./commands/command-catalog.yaml` | Command IDs and entrypoint wiring |
| `./workflows/workflow-catalog.yaml` | Workflow orchestration |
| `./instructions/*.md` | Shared operating rules |
| `./hooks/*.hook.yaml` | Validation gates |
| `./agents/*.agent.yaml` | Agent execution behavior |
| `./skills/**/SKILL.md` | Skill context and workflow |
| `./skills/**/references/*.md` | Extended checklists and detailed skill guidance |
| `./prompts/*.prompt.md` | Prompt contract and deliverable shape |

## Update workflow when resources change

1. Review external guidance updates and mark impacted assets.
2. Update template files first (if shared behavior changed).
3. Update concrete plugin files that derive from templates.
4. Re-run install/discovery checks and plugin validation commands.


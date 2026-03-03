---
plugin: martix-dotnet-library
artifact: resource-registry
purpose: Track resources and requirements used to build and maintain plugin assets
---

## Purpose

This file tracks the resources used to create and maintain
`martix-dotnet-library`, so updates can be applied quickly when upstream
guidance changes.

## External resources (authoritative references)

| Topic | Source | Used for |
| --- | --- | --- |
| CLI plugin concepts | [About CLI Plugins](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-cli-plugins) | Plugin structure and behavior model |
| Plugin install flow | [Finding and Installing Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing) | Marketplace registration and install flow |
| Plugin authoring | [Creating Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating) | Plugin manifest and packaging choices |
| Marketplace model | [Plugins Marketplace](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-marketplace) | Marketplace catalog and discoverability |
| CLI schema reference | [CLI Plugin Reference](https://docs.github.com/en/copilot/reference/cli-plugin-reference) | Manifest fields and compatibility checks |
| Skill authoring | [Create Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-skills) | Skill file structure and frontmatter |
| Agent authoring | [Create Custom Agents for CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-custom-agents-for-cli) | Agent structure and usage model |
| .NET library guidance (overview) | [Library guidance](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/) | High-level quality model and recommendation strength |
| .NET library guidance (start) | [Get started](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/get-started) | Entry page for .NET library guidance topics |
| .NET targeting | [Cross-platform targeting](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/cross-platform-targeting) | TFM strategy and compatibility coverage |
| .NET strong naming | [Strong naming](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/strong-naming) | Strong naming policy decisions |
| .NET packaging | [NuGet and open-source libraries](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/nuget) | NuGet metadata, prerelease strategy, and symbol guidance |
| .NET dependency policy | [Dependencies](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/dependencies) | NuGet dependency versioning and friction reduction |
| .NET source debugging | [Source Link](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/sourcelink) | Source metadata, symbols, and deterministic build expectations |
| .NET package publishing | [Publishing](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/publish-nuget-package) | Publish strategy and security controls |
| .NET versioning | [Versioning](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/versioning) | SemVer and assembly version strategy |
| .NET compatibility strategy | [Breaking changes](https://learn.microsoft.com/en-us/dotnet/standard/library-guidance/breaking-changes) | Source/binary/behavioral change handling |

## Internal resources (local source files)

| File | Role |
| --- | --- |
| `./plugin.yaml` | Human-readable plugin metadata and manifest pointers |
| `./plugin.json` | Copilot CLI plugin manifest |
| `./commands/command-catalog.yaml` | Command IDs and entrypoint wiring |
| `./workflows/workflow-catalog.yaml` | Command orchestration by workflow |
| `./instructions/martix-dotnet-library.instructions.md` | Shared operating rules |
| `./hooks/martix-dotnet-library-validation.hook.yaml` | Shared validation gate |
| `./agents/*.agent.yaml` | Agent-mode execution behavior |
| `./skills/**/SKILL.md` | Skill context, prerequisites, and workflow |
| `./prompts/*.prompt.md` | Prompt contract and output shape |
| `../martix-template/dotnet-library/**` | Shared source templates used for reusable boilerplate |

## Asset-specific requirements

| Asset | Main requirements | Dependencies |
| --- | --- | --- |
| Unified agent | Target repo context (`MartiXDev/WebApi`) and operation classification (author/update/review) | Matching skill, prompt, shared instruction, shared hook |
| Unified skill | Clear unified use cases and output checklist for create/update/review | Matching prompt + shared instruction + shared hook |
| Unified prompt | Required inputs and expected deliverable sections for all operation modes | Matching skill + shared instruction |
| Shared instruction | Core behavior rules and validation expectations | Shared hook commands |
| Shared hook | .NET SDK and runnable target repo (`MartiXDev/WebApi`) | `dotnet restore`, `dotnet build`, `dotnet test`, optional `dotnet pack` |
| Command/workflow catalogs | Consistent IDs and valid file paths | Existing agent/skill/prompt/instruction/hook files |

## Update workflow when resources change

1. Check whether external documentation updates affect plugin or asset schema.
2. Update plugin manifests and asset files impacted by the change.
3. Update this file and [Plugin overview](./INFO.md) with new requirements or
   references.
4. Re-run install/discovery and validation flows:
   - `copilot plugin marketplace browse martix-ai-marketplace`
   - `copilot plugin install martix-dotnet-library@martix-ai-marketplace`
   - `dotnet restore --nologo`
   - `dotnet build --nologo`
   - `dotnet test --nologo --no-build`
   - `dotnet pack -c Release --no-build` (when packaging is in scope)


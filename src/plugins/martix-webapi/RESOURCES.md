---
plugin: martix-webapi
artifact: resource-registry
purpose: Track resources and requirements used to build and maintain plugin assets
---

## Purpose

This file tracks resources used to create and maintain `martix-webapi` so
guidance can be updated quickly when upstream docs or architecture decisions
change.

## External resources (authoritative references)

| Topic | Source | Used for |
| --- | --- | --- |
| CLI plugin concepts | [About CLI Plugins](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-cli-plugins) | Plugin structure and behavior model |
| Plugin authoring | [Creating Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating) | Plugin manifest and packaging choices |
| Skill authoring | [Create Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-skills) | SKILL frontmatter and activation quality |
| ASP.NET Core API errors | [Error handling and ProblemDetails](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/error-handling-api) | Problem-details and exception pipeline guidance |
| HTTP resilience | [HTTP resilience in .NET](https://learn.microsoft.com/en-us/dotnet/core/resilience/http-resilience) | Outbound retry/timeout/circuit policy guidance |

## Internal resources (local source files)

| File | Role |
| --- | --- |
| `./plugin.yaml` | Human-readable plugin metadata and manifest pointers |
| `./plugin.json` | Copilot CLI plugin manifest |
| `./commands/command-catalog.yaml` | Command ID and entrypoint wiring |
| `./workflows/workflow-catalog.yaml` | Workflow orchestration |
| `./agents/*.agent.yaml` | Agent execution behavior and orchestration |
| `./skills/**/SKILL.md` | Core skill workflow and checkpoints |
| `./skills/**/references/*.md` | Extended skill checklists and detailed guidance |
| `./prompts/*.prompt.md` | Prompt contract and expected deliverable shape |
| `./instructions/*.md` | Shared operating rules and quality gates |
| `./hooks/*.hook.yaml` | Shared validation gate commands |
| `./INFO.md` | Plugin summary and asset inventory |
| `C:\Git\MartiXDev\WebApi\README.md` | Active architecture summary for MartiX.WebApi |
| `C:\Git\MartiXDev\WebApi\docs\web-apps-guide.md` | Main implementation guidance for new apps |
| `C:\Git\MartiXDev\WebApi\docs\dotnet-10-native-webapi-guide.md` | Native-first baseline decisions |
| `C:\Git\MartiXDev\WebApi\docs\speckit-and-squad.md` | Planning and execution checklist patterns |
| `C:\Git\MartiXDev\WebApi\docs\public-api-contract.md` | Compatibility baseline references |
| `C:\Git\MartiXDev\WebApi\docs\templates\vertical-slice-starter.md` | Starter slice scaffold patterns |

## Asset-specific requirements

| Asset | Main requirements | Dependencies |
| --- | --- | --- |
| Unified skill | Strong discovery description, repeatable workflow, and architecture checkpoints | Matching prompt + shared instruction |
| Unified prompt | Required input framing and structured deliverable outputs | Matching skill + shared instruction |
| Unified agent | Orchestrate planning and implementation flow with explicit output expectations | Matching skill + prompt + instruction + hook |
| Shared instruction | Enforce net10 baseline, Result-first flow, reliability and operability gates | MartiX.WebApi active docs |
| Shared hook | Restore/build/test validation baseline from target repository root | .NET SDK + target repository solution/project structure |
| Command/workflow catalogs | Consistent IDs and valid file paths | Existing skill/prompt/instruction files |
| Plugin manifests and registry entries | Name/version/source alignment across all manifests | `marketplace/catalog.yaml` + `.github/plugin/marketplace.json` |

## Update workflow when resources change

1. Detect source guidance changes in `MartiXDev/WebApi` docs or marketplace
   plugin references.
2. Update skill/prompt/instruction/agent/hook content to match changed guidance.
3. Update this file and `INFO.md` for new dependencies or asset changes.
4. Re-run marketplace dry-run install checks:
   - `.\scripts\install-plugins.ps1 -Plugins martix-webapi -DryRun`

---
plugin: martix-csharp
artifact: resource-registry
purpose: Track resources and requirements used to build and maintain plugin assets
---

## Purpose

This file tracks the resources used to create and maintain `martix-csharp`.

## External resources

| Topic | Source | Used for |
| --- | --- | --- |
| C# documentation root | [dotnet/docs/csharp](https://github.com/dotnet/docs/tree/main/docs/csharp) | Primary language guidance |
| C# TOC | [dotnet/docs/csharp/toc.yml](https://github.com/dotnet/docs/blob/main/docs/csharp/toc.yml) | Coverage planning |
| C# version updates | [What's new in C#](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/) | Version-aware modernization |
| Plugin authoring | [Creating Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating) | Plugin manifest and structure |
| Skill authoring | [Create Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-skills) | Skill metadata and workflow quality |

## Internal resources

| File | Role |
| --- | --- |
| `./plugin.yaml` | Human-readable plugin metadata and manifest pointers |
| `./plugin.json` | Copilot CLI plugin manifest |
| `./commands/command-catalog.yaml` | Command ID and entrypoint wiring |
| `./workflows/workflow-catalog.yaml` | Workflow orchestration |
| `./agents/martix-csharp.agent.yaml` | Agent orchestration contract |
| `./skills/martix-csharp/SKILL.md` | Core skill behavior |
| `./skills/martix-csharp/references/csharp-14-language-patterns.md` | C# 14 language modernization patterns |
| `./skills/martix-csharp/references/csharp-anti-patterns.md` | Language-focused anti-pattern remediation |
| `./skills/martix-csharp/references/source-inventory.md` | Source priority map |
| `./skills/martix-csharp/evals/evals.json` | Eval prompts for skill iteration |
| `./prompts/martix-csharp.prompt.md` | Prompt contract and outputs |
| `./instructions/martix-csharp.instructions.md` | Shared operating rules |
| `./hooks/martix-csharp-validation.hook.yaml` | Validation command baseline |
| `./INFO.md` | Plugin summary and inventory |
| `../../../../docs/martix-csharp/martix-csharp-skill-plan.md` | Implementation source plan |

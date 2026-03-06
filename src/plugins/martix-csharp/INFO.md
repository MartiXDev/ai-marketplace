---
plugin: martix-csharp
version: 0.1.0
phase: 3
status: ready
target_repository: language-focused csharp repositories
resource_registry: ./RESOURCES.md
---

## Plugin overview

`martix-csharp` provides one unified command flow for C# 14+ language-focused
authoring, refactoring, and review tasks.

## Basic info

- **Plugin name:** `martix-csharp`
- **Current version:** `0.1.0`
- **Primary target:** language-level C# guidance and quality practices
- **Asset model:** plugin-first

## Asset inventory

| Asset type | IDs / names | Location |
| --- | --- | --- |
| Plugin manifests | `plugin.yaml`, `plugin.json` | `./` |
| Command catalog | `martix-csharp` | `./commands/command-catalog.yaml` |
| Workflow catalog | `csharp-language` | `./workflows/workflow-catalog.yaml` |
| Agent | `martix-csharp` | `./agents/martix-csharp.agent.yaml` |
| Skill | `martix-csharp` | `./skills/martix-csharp/SKILL.md` |
| Prompt | `martix-csharp` | `./prompts/martix-csharp.prompt.md` |
| Shared instruction | `martix-csharp.instructions` | `./instructions/martix-csharp.instructions.md` |
| Shared validation hook | `martix-csharp-validation` | `./hooks/martix-csharp-validation.hook.yaml` |

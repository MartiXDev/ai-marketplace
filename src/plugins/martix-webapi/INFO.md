---
plugin: martix-webapi
version: 0.1.0
phase: 2
status: ready
target_repository: MartiXDev/WebApi
resource_registry: ./RESOURCES.md
---

## Plugin overview

`martix-webapi` provides one unified command flow to plan and implement new
`net10.0` web applications using `MartiX.WebApi` architecture guidance.

## Basic info

- **Plugin name:** `martix-webapi`
- **Current version:** `0.1.0`
- **Primary target:** `MartiXDev/WebApi` guidance and reusable patterns
- **Asset model:** plugin-first

## Asset inventory

| Asset type | IDs / names | Location |
| --- | --- | --- |
| Plugin manifests | `plugin.yaml`, `plugin.json` | `./` |
| Command catalog | `martix-webapi` | `./commands/command-catalog.yaml` |
| Workflow catalog | `webapi-app` | `./workflows/workflow-catalog.yaml` |
| Agents | `martix-webapi` | `./agents/martix-webapi.agent.yaml` |
| Skills | `martix-webapi` | `./skills/` |
| Prompts | `martix-webapi` | `./prompts/` |
| Shared instruction | `martix-webapi.instructions` | `./instructions/martix-webapi.instructions.md` |
| Shared validation hook | `martix-webapi-validation` | `./hooks/martix-webapi-validation.hook.yaml` |

## Requirements to use and maintain this plugin

- Copilot CLI with plugin marketplace support.
- Access to MartiX.WebApi source docs for rule updates.
- .NET 10 SDK available for consumer repository validation.

## Resource and requirement tracking

Use [Plugin resources and requirements](./RESOURCES.md) as source of truth for:

- external references used by this plugin,
- internal files and cross-file dependencies,
- maintenance workflow when source guidance changes.

---
plugin: martix-dotnet-library
version: 0.1.0
phase: 1
status: ready
target_repository: MartiXDev/WebApi
resource_registry: ./RESOURCES.md
---

## Plugin overview

`martix-dotnet-library` provides one unified command flow for creating,
updating, and reviewing .NET libraries in `MartiXDev/WebApi`.

## Basic info

- **Plugin name:** `martix-dotnet-library`
- **Current version:** `0.1.0`
- **Primary target:** `MartiXDev/WebApi`
- **Asset model:** plugin-first (agents, skills, prompts, instructions, hooks
  are inside this plugin folder)

## Asset inventory

| Asset type | IDs / names | Location |
| --- | --- | --- |
| Plugin manifests | `plugin.yaml`, `plugin.json` | `./` |
| Command catalog | `martix-dotnet-library` | `./commands/command-catalog.yaml` |
| Workflow catalog | `dotnet-library` | `./workflows/workflow-catalog.yaml` |
| Agents | `martix-dotnet-library` | `./agents/` |
| Skills | `martix-dotnet-library` | `./skills/` |
| Prompts | `martix-dotnet-library` | `./prompts/` |
| Shared instruction | `martix-dotnet-library.instructions` | `./instructions/martix-dotnet-library.instructions.md` |
| Shared validation hook | `martix-dotnet-library-validation` | `./hooks/martix-dotnet-library-validation.hook.yaml` |

## Requirements to use and maintain this plugin

- Copilot CLI with plugin marketplace support.
- Access to `MartiXDev/WebApi` source code.
- .NET SDK available for validation commands.
- Ability to run commands from the target repository root.

Validation baseline used by this plugin:

```bash
dotnet restore --nologo
dotnet build --nologo
dotnet test --nologo --no-build
dotnet pack -c Release --no-build  # when packaging is in scope
```

## Resource and requirement tracking

Use [Plugin resources and requirements](./RESOURCES.md) as the source of truth
for:

- external documentation links used to build/maintain this plugin,
- internal files used by each asset,
- asset-specific requirements and update workflow when resources change.

## Template relationship

This plugin consumes shared source templates from:

- `../martix-template/dotnet-library/`

Templates are non-installable source assets for future plugin creation and
refactoring. Runtime plugin files remain in this folder.

## Optional complex-asset docs

- [Validation hook info](./hooks/martix-dotnet-library-validation.info.md)


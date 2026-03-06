---
plugin: <plugin-name>
version: <version>
phase: <phase>
status: <status>
target_repository: <target-repository>
resource_registry: ./RESOURCES.md
---

## Plugin overview

<One-paragraph summary of plugin purpose and target scenarios.>

## Basic info

- **Plugin name:** `<plugin-name>`
- **Current version:** `<version>`
- **Primary target:** `<target-repository>`
- **Asset model:** plugin-first

## Asset inventory

| Asset type | IDs / names | Location |
| --- | --- | --- |
| Plugin manifests | `plugin.yaml`, `plugin.json` | `./` |
| Command catalog | `<command IDs>` | `./commands/command-catalog.yaml` |
| Workflow catalog | `<workflow IDs>` | `./workflows/workflow-catalog.yaml` |
| Agents | `<agent IDs>` | `./agents/` |
| Skills | `<skill IDs>` | `./skills/` |
| Prompts | `<prompt IDs>` | `./prompts/` |
| Shared instruction | `<instruction ID>` | `./instructions/` |
| Shared validation hook | `<hook ID>` | `./hooks/` |

## Requirements to use and maintain this plugin

- Copilot CLI with plugin marketplace support.
- Access to target repository and build/test toolchain.
- Ability to run validation commands from target repository root.

## Resource and requirement tracking

Use [Plugin resources and requirements](./RESOURCES.template.md) as source of truth for
external resources, internal files, and update workflow.


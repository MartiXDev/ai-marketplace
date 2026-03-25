# MartiX AI Marketplace for Copilot CLI Plugins

Marketplace for custom MartiX AI Plugins, Agents, Skills, Prompts,
Instructions, Hooks, and related assets.

**Repository:** [https://github.com/MartiXDev/ai-marketplace](https://github.com/MartiXDev/ai-marketplace)

## Resources

### Plugins

Anthropic / Claude

- [Claude Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces)
- [Discover Plugins](https://code.claude.com/docs/en/discover-plugins)
- [Agent Skills Specification](http://agentskills.io/)

GitHub Copilot

- [About CLI Plugins](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-cli-plugins)
- [Finding and Installing Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing)
- [Creating Plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating)
- [Plugins Marketplace](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-marketplace)
- [CLI Plugin Reference](https://docs.github.com/en/copilot/reference/cli-plugin-reference)

### Skills

- [Create Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-skills)
- [skills.sh Documentation](https://skills.sh/docs)
- [skills.sh CLI Reference](https://skills.sh/docs/cli)
- [skills.sh FAQ](https://skills.sh/docs/faq)

### Agents

- [Create Custom Agents for CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-custom-agents-for-cli)

## Marketplace architecture (hybrid source model)

This repository is a custom Copilot CLI marketplace for reusable MartiX
plugins and standalone skills.

- Installable marketplace sources can live either under `src/plugins/martix-*`
  or `src/skills/martix-*`.
- Use `src/skills/<skill-name>/` as the preferred single-source model when a
  standalone skill is sufficient.
- Use `src/plugins/<plugin-name>/` only when the package genuinely needs
  plugin-scoped assets such as agents, prompts, instructions, hooks, or custom
  command and workflow catalogs.
- A plugin source does not have to contain every asset type; only the assets
  required for that package need to exist.
- Plugin layout and naming constraints are defined in
  [`docs/plugin-layout.yaml`](docs/plugin-layout.yaml).
- Shared reusable source templates are stored in
  [`src/plugins/martix-template/`](src/plugins/martix-template/).
- Standalone skills are stored under [`src/skills/`](src/skills/).
- Marketplace metadata is tracked in [`marketplace/catalog.yaml`](marketplace/catalog.yaml).
- Copilot CLI marketplace manifest is tracked in
  [`.github/plugin/marketplace.json`](.github/plugin/marketplace.json).

### `.github` constraint

Do not create new plugin source assets under `.github`.

- Keep new agents/skills/prompts/instructions/hooks under
  `src/plugins/<plugin-name>/...`.
- In this repo, `.github` is reserved for repository instructions and the
  marketplace manifest used by Copilot CLI.

### `martix-template` constraint

`src/plugins/martix-template/` is a non-installable shared source folder.

- Do not register `martix-template` in marketplace plugin manifests.
- Use it to bootstrap/refactor concrete plugins (for example
  `martix-dotnet-library`).
- Keep executable/installable assets only in concrete plugin folders.

### Hybrid component placement policy

- Keep plugin components under `src/plugins/<plugin-name>/...` for:
  - `agents/`
  - `prompts/`
  - `instructions/`
  - `hooks/`
  - plugin manifests and command/workflow catalogs
- Publish directly from `src/skills/<skill-name>/` when the skill stands on its
  own.
- Add `src/plugins/<plugin-name>/skills/...` only when a plugin truly needs a
  plugin-local skill payload in addition to standalone assets.

## Current package inventory

The tables below reflect the current installable package set registered in
[`.github/plugin/marketplace.json`](.github/plugin/marketplace.json).

### Plugin packages

- `martix-dotnet-library` (`0.1.0`) — `src/plugins/martix-dotnet-library`
  Unified .NET library create, update, and review workflows.
- `martix-webapi` (`0.1.0`) — `src/plugins/martix-webapi`
  Planning and implementing new .NET 10 web apps with MartiX.WebApi
  guidance.

### Standalone skills

These packages are registered directly from `src/skills` as the single source
of truth.

- `martix-dotnet-csharp` (`0.1.0`) — `src/skills/martix-dotnet-csharp`
  .NET 10+ and C# 14+ authoring, modernization, and review workflows.
- `martix-fastendpoints` (`0.1.0`) — `src/skills/martix-fastendpoints`
  FastEndpoints startup, contracts, processors, transport, security, testing,
  versioning, and Native AOT.
- `martix-fluentvalidation` (`0.1.0`) — `src/skills/martix-fluentvalidation`
  Validator authoring, RuleSets, ASP.NET Core integration, async validation,
  testing, and upgrade planning.
- `martix-tunit` (`0.1.0`) — `src/skills/martix-tunit`
  Test authoring, parameterized tests, lifecycle hooks, parallel execution,
  DI, and framework migration.
- `martix-powershell` (`0.1.0-preview.1`) — `src/skills/martix-powershell`
  PowerShell cmdlet and advanced-function authoring, validation, pipeline
  behavior, error handling, and safety patterns.
- `martix-markdown` (`0.1.0-preview.1`) — `src/skills/martix-markdown`
  Markdownlint-aware authoring, lint repair, config decisions, custom rules,
  toolchain coexistence, and accessibility review.
- `martix-sharepoint-server` (`0.1.0-preview.1`) — `src/skills/martix-sharepoint-server`
  Classic and on-prem SharePoint Server guidance for farm solutions, WSP
  packaging, features, event receivers, branding, site artifacts, and
  modernization-aware SharePoint 2019 and Subscription Edition work.
- `martix-sharepoint-spfx` (`0.1.0-preview.1`) — `src/skills/martix-sharepoint-spfx`
  SharePoint Framework guidance for SharePoint Online-first SPFx development
  with React, TypeScript, web parts, extensions, deployment, theming,
  Teams/Viva integration, and migration.
- `martix-sharepoint-pnp` (`0.1.0-preview.1`) — `src/skills/martix-sharepoint-pnp`
  SharePoint PnP guidance for PnP PowerShell, CLI for Microsoft 365, PnPjs,
  provisioning, automation, authentication, and cross-tool delivery choices.

### Shared scaffolding

- `src/plugins/martix-template/` is a non-installable shared source folder for
  bootstrapping and refactoring concrete `martix-*` packages.

## Install and use the marketplace

### 1) Register the marketplace

```bash
copilot plugin marketplace add MartiXDev/ai-marketplace
copilot plugin marketplace list
```

### 2) Install a single package (smoke test)

```bash
copilot plugin marketplace browse martix-ai-marketplace
copilot plugin install martix-dotnet-library@martix-ai-marketplace
copilot plugin list
```

The same marketplace also serves standalone skill packages such as
`martix-markdown` and `martix-powershell`.

Optional interactive check:

```text
/skills list
```

Optional cleanup:

```bash
copilot plugin uninstall martix-dotnet-library
copilot plugin marketplace remove martix-ai-marketplace
```

### 3) Batch install plugins

Use the PowerShell helper from the repo root:

```powershell
.\scripts\install-plugins.ps1 -All -DryRun
.\scripts\install-plugins.ps1 -All
.\scripts\install-plugins.ps1 -Plugins martix-dotnet-library
```

Notes:

- The script reads plugin names from `.github\plugin\marketplace.json`
  (preferred) and falls back to `marketplace\catalog.yaml`.
- If marketplace name cannot be resolved from metadata, pass
  `-MarketplaceName martix-ai-marketplace`.
- `martix-template` is intentionally excluded because it is non-installable.

## Shared template source for plugins

Use [`src/plugins/martix-template/`](src/plugins/martix-template/) when
creating or refactoring `martix-*` plugins.

`martix-template` currently includes reusable .NET library templates for:

- agents,
- skills,
- prompts,
- shared instructions,
- validation hooks,
- plugin info/resource registry docs.

Current default for new plugin designs: start with one unified
command/agent/skill/prompt flow, and split into multiple mode-specific assets
only when necessary.

For the extraction map and mapping rationale, see
[`src/plugins/martix-template/dotnet-library/TEMPLATE-EXTRACTION.md`](src/plugins/martix-template/dotnet-library/TEMPLATE-EXTRACTION.md).

## Publish skills to skills.sh

`skills.sh` is a skill directory and ranking ecosystem powered by the `skills`
CLI. It is not a Copilot plugin marketplace replacement.

### What can be published there

- Publish standalone skills from `src/skills/<skill-name>/` (or a dedicated
  skill repository).
- Keep Copilot plugin packaging under `src/plugins/...` and
  `.github/plugin/marketplace.json`.

### How to make your skills installable

1. Create a public GitHub repository for your skill set.
2. Include skill folders with `SKILL.md` and a README with usage notes.
3. Test install from the CLI:

```bash
npx skills add <owner>/<repo>
```

or, for registries/examples that support it:

```bash
npx skills add <owner>/<skill-name>
```

### How skills appear on skills.sh

- According to `skills.sh` docs/FAQ, leaderboard listing is driven by anonymous
  `skills` CLI telemetry from installs.
- Once users install your skill via `npx skills add ...`, it can appear in the
  rankings.
- Telemetry can be disabled with `DISABLE_TELEMETRY=1`.

### Security and quality notes

- skills.sh performs routine audits, but you should still review third-party
  skills before use.
- Report security issues via `https://security.vercel.com/`.

## Add a new `martix-*` plugin

Use this checklist to onboard plugins consistently:

1. Create `src/plugins/martix-<name>/` using the layout in
   [`docs/plugin-layout.yaml`](docs/plugin-layout.yaml), or create
   `src/skills/martix-<name>/` when the package is a standalone skill with no
   extra plugin-scoped assets.
2. Bootstrap from `src/plugins/martix-template/` when a real plugin wrapper is
   needed, then specialize for the target use case.
3. Keep names lowercase and `martix-` prefixed for plugin directory, skill
   directory, plugin name, and component names.
4. Add marketplace metadata in:
   - [`marketplace/catalog.yaml`](marketplace/catalog.yaml)
   - [`.github/plugin/marketplace.json`](.github/plugin/marketplace.json)
5. If you chose a plugin wrapper, add plugin manifests and assets under the
   plugin folder:
   - `plugin.yaml`, `plugin.json`
   - `agents/`, `skills/`, `prompts/`, `instructions/`, `hooks/`
   - `commands/command-catalog.yaml`, `workflows/workflow-catalog.yaml`
   Otherwise, keep the single source under `src/skills/<skill-name>/`.
6. Validate discovery/install:
   - `copilot plugin marketplace browse martix-ai-marketplace`
   - `copilot plugin install martix-<name>@martix-ai-marketplace`
   - `.\scripts\install-plugins.ps1 -Plugins martix-<name> -DryRun`

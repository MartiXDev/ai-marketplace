# MartiX AI Marketplace for Copilot CLI Plugins

Marketplace for custom MartiX AI Plugins, Agents, Skills, Prompts, Instructions, Hooks, etc.

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

## Marketplace architecture (plugin-first)

This repository is a custom Copilot CLI marketplace for reusable MartiX
plugins.

- Source of truth for installable plugins is `src/plugins/martix-*`.
- Every plugin owns its own assets (`agents`, `skills`, `prompts`,
  `instructions`, `hooks`) and manifests (`plugin.yaml`, `plugin.json`,
  `commands/command-catalog.yaml`, `workflows/workflow-catalog.yaml`).
- Plugin doesn't have to contain all types of assets, only some of them or even only one can be used
- Plugin layout and naming constraints are defined in
  [`docs/plugin-layout.yaml`](docs/plugin-layout.yaml).
- Shared reusable source templates are stored in
  [`src/plugins/martix-template/`](src/plugins/martix-template/).
- Optional standalone skills for dual publishing are stored under
  [`src/skills/`](src/skills/).
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
- Skills remain plugin-local under `src/plugins/<plugin-name>/skills/...`.
- Optional standalone skill mirrors may be published from `src/skills/...`.

## Install and use the marketplace

### 1) Register the marketplace

```bash
copilot plugin marketplace add MartiXDev/ai-marketplace
copilot plugin marketplace list
```

### 2) Install a single plugin (smoke test)

```bash
copilot plugin marketplace browse martix-ai-marketplace
copilot plugin install martix-dotnet-library@martix-ai-marketplace
copilot plugin list
```

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

Use [`src/plugins/martix-template/`](src/plugins/martix-template/) when creating or
refactoring `martix-*` plugins.

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
   [`docs/plugin-layout.yaml`](docs/plugin-layout.yaml).
2. Bootstrap from `src/plugins/martix-template/` and then specialize for the target
   use case.
3. Keep names lowercase and `martix-` prefixed for plugin directory, plugin
   name, and component names.
4. Add plugin metadata in:
   - [`marketplace/catalog.yaml`](marketplace/catalog.yaml)
   - [`.github/plugin/marketplace.json`](.github/plugin/marketplace.json)
5. Add plugin manifests and assets under the plugin folder:
   - `plugin.yaml`, `plugin.json`
   - `agents/`, `skills/`, `prompts/`, `instructions/`, `hooks/`
   - `commands/command-catalog.yaml`, `workflows/workflow-catalog.yaml`
   Optional: publish standalone skill mirrors from `src/skills/<skill-name>/`.
6. Validate discovery/install:
   - `copilot plugin marketplace browse martix-ai-marketplace`
   - `copilot plugin install martix-<name>@martix-ai-marketplace`
   - `.\scripts\install-plugins.ps1 -Plugins martix-<name> -DryRun`

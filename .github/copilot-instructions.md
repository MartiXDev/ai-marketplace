## Repository scope

This repository is a custom Copilot CLI marketplace.

- Installable plugins live under `plugins/martix-*`.
- Shared non-installable scaffolding lives under `plugins/martix-template`.
- Marketplace registration metadata is stored in both:
  - `marketplace/catalog.yaml`
  - `.github/plugin/marketplace.json`

## Build, test, and lint commands

### Marketplace checks (run from repository root)

```powershell
.\scripts\install-plugins.ps1 -All -DryRun
.\scripts\install-plugins.ps1 -Plugins martix-dotnet-library -DryRun
.\scripts\install-plugins.ps1 -PluginList "martix-dotnet-library" -DryRun
```

### .NET validation used by `martix-dotnet-library` (run in `MartiXDev/WebApi`)

```powershell
dotnet restore --nologo
dotnet build --nologo
dotnet test --nologo --no-build
dotnet pack -c Release --no-build
```

Single-test example in the target repository:

```powershell
dotnet test --nologo --no-build --filter "FullyQualifiedName~<TestName>"
```

### Linting

No repository-native lint command is currently defined.

## High-level architecture

### Plugin-first marketplace model

- Each installable plugin owns its runtime assets:
  - `agents/`, `skills/`, `prompts/`, `instructions/`, `hooks/`
  - `commands/command-catalog.yaml`, `workflows/workflow-catalog.yaml`
  - `plugin.yaml`, `plugin.json`
- `commands/command-catalog.yaml` is the entrypoint map for runtime assets.
- `workflows/workflow-catalog.yaml` orchestrates command sequences.

### Registry and installation flow

- `marketplace/catalog.yaml` tracks repository plugin entries and paths.
- `.github/plugin/marketplace.json` is the Copilot CLI marketplace manifest.
- `scripts/install-plugins.ps1` reads `.github/plugin/marketplace.json` first,
  then falls back to `marketplace/catalog.yaml`.

### Current plugin topology

- `martix-dotnet-library` uses a unified command model:
  - one command (`martix-dotnet-library`)
  - one workflow (`dotnet-library`)
  - one agent, one skill, one prompt
  - shared instruction and shared validation hook
- `.NET` quality gates and external guidance references are maintained in:
  - `plugins/martix-dotnet-library/instructions/martix-dotnet-library.instructions.md`
  - `plugins/martix-dotnet-library/RESOURCES.md`

### Template source topology

- `plugins/martix-template` is a shared template source and must stay
  non-installable.
- Do not add `martix-template` to marketplace manifests.
- Use template files as source for reusable patterns, then specialize concrete
  plugin runtime files.

## Key repository conventions

- Naming uses `martix-` prefix for plugin and component identifiers
  (`docs/plugin-layout.yaml`).
- New skill source files belong under `plugins/<plugin>/skills` (never under
  `.github`).
- Use unified command/agent/skill/prompt by default; split by mode only when
  complexity requires it.
- When adding/updating an installable plugin, update both registry files:
  - `marketplace/catalog.yaml`
  - `.github/plugin/marketplace.json`
- Keep command entrypoints and workflow IDs synchronized with actual file paths.
- Keep `RESOURCES.md` current when external guidance or requirements change.
- For PowerShell scripts, follow `.github/instructions/powershell.instructions.md`
  patterns: comment-based help, `SupportsShouldProcess`, non-interactive design,
  and structured object output.
- For SKILL files, follow `.github/instructions/agent-skills.instructions.md`:
  required frontmatter and high-quality `description` for activation.


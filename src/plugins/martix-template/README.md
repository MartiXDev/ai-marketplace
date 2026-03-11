## MartiX template source (non-installable)

`src/plugins/martix-template` is a shared source folder for reusable MartiX plugin
templates.

## Scope

- This folder is **not** an installable marketplace plugin.
- This folder should not be added to:
  - `marketplace/catalog.yaml`
  - `.github/plugin/marketplace.json`
- Runtime assets must stay in concrete packages such as
  `src/plugins/martix-dotnet-library` or standalone skill folders under
  `src/skills/` when no plugin-scoped assets are needed.

## Current template set

- `dotnet-library/`: templates and extraction map for .NET library
  author/update/review plugin assets.
  - Unified command scaffolds for `agents/`, `prompts/`, `instructions/`, and
    `hooks/`.
  - Layered skill-package scaffolds for `SKILL.md`, `AGENTS.md`, `README.md`,
    `metadata.json`, `rules/`, `references/`, and repo-native `evals/`.

## Structure baseline

- Follow the structure and style baseline from
  `vercel-labs/agent-skills/react-best-practices` for skill packages:
  - trigger-aware skill descriptions,
  - quick-reference guidance in `SKILL.md`,
  - detailed rule files under `rules/`,
  - expanded long-form guidance in `AGENTS.md`,
  - package metadata in `metadata.json`,
  - maintenance instructions in a package-local `README.md`.
- Adapt that baseline to this repository's hybrid source model:
  - executable plugin assets still live under
    `src/plugins/<plugin>/agents/`, `prompts/`, `instructions/`, `hooks/`,
    `commands/`, and `workflows/`,
  - standalone skill packages can live under `src/skills/<skill-name>/` when no
    plugin-scoped assets are needed,
  - plugin-local `skills/` folders are only needed when a concrete plugin
    genuinely requires them alongside plugin-scoped assets,
  - evaluation artifacts use repo-native `evals/` instead of Vercel's generated
    `test-cases.json`.

Default recommendation: start with a unified command/agent/skill/prompt model,
and split by mode only when there is clear operational need.

## Maintenance

- Update templates first when shared boilerplate changes.
- Then update concrete plugins that consume these templates.
- Keep layered skill-package files (`SKILL.md`, `AGENTS.md`, `README.md`,
  `metadata.json`, `rules/`, `references/`, `evals/`) aligned when the template
  changes.
- Track upstream references and requirements in each concrete plugin's
  `RESOURCES.md`.


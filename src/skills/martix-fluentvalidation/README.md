# Package overview

`martix-fluentvalidation` is the canonical standalone-first source package for
the MartiX FluentValidation skill. It stores the authored entrypoints, rule
library, reference maps, templates, and registration-ready metadata that direct
standalone installs should consume from this folder.

- Canonical source root: `src\skills\martix-fluentvalidation`
- Primary install surface: standalone `skills` CLI
- Future secondary install surface: direct Copilot marketplace registration
- Discovery key: `martix-fluentvalidation`

## Package structure

| Path | Purpose |
| --- | --- |
| [SKILL.md](./SKILL.md) | Activation router |
| [AGENTS.md](./AGENTS.md) | Companion guide |
| [rules/](./rules) | 23 rule files plus support scaffolds |
| [references/](./references) | 10 workstream maps, compatibility, and ecosystem notes |
| [templates/](./templates) | Author scaffolds |
| [assets/](./assets) | Supporting taxonomy and ordering data |
| [metadata.json](./metadata.json) | Package metadata and distribution notes |

## Maintainer notes

- The shared rule contract lives in
  [rules/_sections.md](./rules/_sections.md).
- The primary entry maps live under [references/](./references):
  foundation, built-in validators, rule configuration, integration,
  extensibility, runtime metadata, testing, and upgrade guidance.
- The registration-ready inventory lives in
  [metadata.json](./metadata.json).
- When marketplace registration is added later, point it directly at this folder
  instead of duplicating the package elsewhere in the repository.

## Installation

## Standalone skills CLI flow

Use the standalone flow as the primary install surface for this package.

- Official docs currently show `npx skills add <source>`.
- Official docs do **not** currently show `npx skill add <source>`.
- Because this repository stores the package under `src\skills\...`, prefer an
  absolute folder path or direct GitHub tree URL instead of repo-root
  discovery. In this environment, a Windows relative path such as
  `.\src\skills\martix-fluentvalidation` is treated like a git source by the
  `skills` CLI and fails preview or install.

```powershell
npx skills add C:\Git\MartiXDev\ai-marketplace\src\skills\martix-fluentvalidation -a github-copilot -y
npx skills add C:\Git\MartiXDev\ai-marketplace\src\skills\martix-fluentvalidation -a github-copilot --copy -y

# Or from GitHub:
# npx skills add <github-tree-url> -a github-copilot -y
```

To use a GitHub tree URL, use the direct path to the
`martix-fluentvalidation` folder in the repository.

## Verification

## Standalone validation

Preview or verify the standalone package with these commands:

```powershell
npx skills add C:\Git\MartiXDev\ai-marketplace\src\skills\martix-fluentvalidation --list
npx skills list
```

Expect to see an installed entry named `martix-fluentvalidation` after a
successful install.

## Update

```powershell
npx skills check
npx skills update
```

## Uninstall

```powershell
npx skills remove martix-fluentvalidation
npx skills rm martix-fluentvalidation
```

Add `-g` when removing a global standalone install.

## Discovery precedence and same-name conflicts

Copilot deduplicates by the skill `name` declared in `SKILL.md`, not by folder
path. A project or personal standalone install can load before a later direct
marketplace registration with the same skill name.

- A standalone `martix-fluentvalidation` install can shadow a future marketplace
  version of `martix-fluentvalidation`.
- For marketplace validation, use a clean environment or remove the standalone
  copy first.
- If both surfaces must coexist, the eventual package names must stay distinct.

## Troubleshooting

### `npx skill add` fails

- Cause: The documented binary is `skills`, not `skill`
- Solution: Use `npx skills add <source>` exactly as shown

### Repo-root install discovery fails

- Cause: `src\skills` is not a default discovery root
- Solution: Use direct folder path or GitHub tree URL

### Standalone install linked instead of copied

- Cause: `skills` CLI uses symlink installs by default
- Solution: Re-run with `--copy` for copied layout

### Skill updates missing after later marketplace work

- Cause: Same-name standalone install takes precedence
- Solution: Remove the standalone copy or validate in a clean environment

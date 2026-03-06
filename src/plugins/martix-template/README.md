## MartiX template source (non-installable)

`plugins/martix-template` is a shared source folder for reusable MartiX plugin
templates.

## Scope

- This folder is **not** an installable marketplace plugin.
- This folder should not be added to:
  - `marketplace/catalog.yaml`
  - `.github/plugin/marketplace.json`
- Runtime assets must stay in concrete plugins such as
  `plugins/martix-dotnet-library`.

## Current template set

- `dotnet-library/`: templates and extraction map for .NET library
  author/update/review plugin assets.

Default recommendation: start with a unified command/agent/skill/prompt model,
and split by mode only when there is clear operational need.

## Maintenance

- Update templates first when shared boilerplate changes.
- Then update concrete plugins that consume these templates.
- Track upstream references and requirements in each concrete plugin's
  `RESOURCES.md`.


# Standalone Skills (Hybrid Publishing)

Use this folder for standalone skill packages that can be installed directly or
wired into the marketplace without duplicating their source elsewhere in the
repository.

## Conventions

- Keep installable plugin assets in `src/plugins/<plugin>/...` when a package
  needs plugin-scoped assets such as agents, prompts, instructions, hooks,
  commands, or workflows.
- Use `src/skills/<skill-name>/...` as the canonical source for standalone
  skills that do not need extra plugin-scoped assets.
- When a standalone skill is registered in the marketplace, point
  `.github/plugin/marketplace.json` and `marketplace/catalog.yaml` directly at
  the matching `src/skills/<skill-name>/` folder.
- Treat each package-local `README.md` as the maintainer guide for that
  standalone skill.

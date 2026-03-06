# Standalone Skills (Hybrid Publishing)

Use this folder for optional standalone skill packages that may be published
outside plugin packaging workflows.

## Conventions

- Keep installable plugin assets in `src/plugins/<plugin>/...`.
- Keep agents, prompts, instructions, hooks, and plugin manifests inside
  plugin folders.
- Use `src/skills/<skill-name>/...` only for standalone skill distribution.
- Until a sync workflow is introduced, treat plugin-local skill content as the
  canonical source.

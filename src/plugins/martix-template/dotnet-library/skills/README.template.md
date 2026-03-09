## .NET Library Skill Package Template

This template mirrors the layered structure and writing style inspired by
`vercel-labs/agent-skills/react-best-practices`, adapted for the MartiX
plugin-first model.

## Package layout

| File or folder | Purpose |
| --- | --- |
| `SKILL.md` | Quick-reference overview, trigger cues, workflow, and output checklist |
| `AGENTS.md` | Expanded long-form guidance for large or nuanced tasks |
| `metadata.json` | Version, abstract, source references, category priorities, and prefixes |
| `rules/` | Focused rule files with incorrect/correct examples |
| `references/` | Runbooks, checklists, and source inventories |
| `evals/` | Repo-native evaluation prompts and assertions |

## Authoring workflow

1. Define the skill scope, triggers, and category prefixes in `metadata.json`
   and `rules/_sections.md`.
2. Draft the high-signal overview in `SKILL.md`.
3. Add detailed rule files under `rules/` for topics that need deeper examples.
4. Expand or curate `AGENTS.md` when the quick reference is not enough.
5. Add operational runbooks and source inventories under `references/`.
6. Add or refresh evaluation prompts in `evals/`.

## Style guidance

- Use trigger-aware descriptions so the skill is easy to activate correctly.
- Keep `SKILL.md` concise and scannable; move deep detail into `rules/` and
  `references/`.
- Prefer incorrect/correct examples in rule files when behavior or tradeoffs are
  easy to misunderstand.
- Keep external authority links centralized in `metadata.json` and
  `references/source-inventory.md`.
- Preserve the MartiX operational style: explicit workflows, validation gates,
  output checklists, and risk notes.
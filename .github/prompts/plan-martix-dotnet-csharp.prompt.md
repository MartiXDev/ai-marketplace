---
description: 'Create or update the planning-phase package for the martix-dotnet-csharp skill brief.'
name: 'plan-martix-dotnet-csharp'
agent: 'agent'
tools: ['read', 'search', 'edit', 'web', 'agent']
argument-hint: 'Optional: override the brief path, plan path, or future file map path'
---

# Plan martix-dotnet-csharp skill

## Mission

Convert the `martix-dotnet-csharp` brief into an approved planning-phase
package. Produce or update the session plan, define the future file map, and
identify the research work needed before implementation.

## Scope & Preconditions

- Read `${input:briefPath:docs\\martix-dotnet-csharp\\martix-dotnet-csharp.md}`
  first.
- Treat the brief as the highest-priority source.
- Use in-repo information only from approved metadata documents unless the user
  expands the allowlist:
  - `README.md`
  - `docs\\plugin-layout.yaml`
  - `marketplace\\catalog.yaml`
  - `.github\\plugin\\marketplace.json`
- Do not use content from:
  - `docs\\martix-csharp`
  - `src\\plugins\\martix-dotnet-library`
  - `src\\plugins\\martix-webapi`
- Treat `src\\skills\\martix-dotnet-csharp\\...` as the canonical source of
  truth.
- Plan plugin integration as a later wrapper or distribution layer.
- Cover both install surfaces:
  - standalone install via the official skills CLI flow; verify whether the
    command is `npx skills add` or an equivalent variant before finalizing docs
  - Copilot CLI plugin discovery or install via `/plugin` and marketplace
    metadata
- If the user has not provided
  `${input:planPath:an absolute session plan.md path}`, ask for it or write to
  the active session plan file.

## Inputs

- `briefPath`: The planning brief to process.
- `planPath`: The session `plan.md` path to create or update.
- `futureFileMapPath`: Optional session artifact path for a standalone file map.

## Workflow

1. Read the brief and extract requirements, forbidden sources, install needs,
   deliverables, and unresolved questions.
2. Normalize the planning decisions:
   - precedence rules
   - source layout
   - source allowlist
   - install surfaces
3. Research only the allowed external references needed for planning:
   - Agent Skills specification
   - skills CLI or standalone skill installation docs
   - Copilot CLI plugin docs
   - Vercel `react-best-practices` structure
4. Build or update the plan with these sections:
   - problem statement
   - resolved decisions
   - phased execution strategy
   - parallel research workstreams
   - validation strategy
   - risks and open questions
5. Build or update the future file map at
   `${input:futureFileMapPath:optional session workspace path}`. If no separate
   path is supplied, embed the file map in the plan.
6. Include a planning track for:
   - README install guidance
   - standalone skill packaging
   - plugin wrapper packaging
   - benchmark comparison against external .NET and C# skills
7. If the brief's task list can be improved, create or update a repository
   prompt file under `.github/prompts/` instead of editing the brief into an
   unstructured note.
8. Use parallel subagents for independent research tracks when the environment
   supports them.

## Output Expectations

- Update the session plan with a multi-phase plan and clear task breakdown.
- Produce a future directory or file map for both the standalone skill and the
  later plugin wrapper.
- Capture validation steps for:
  - standalone skills CLI installation
  - Copilot CLI plugin install or discovery
  - markdown and accessibility review
  - marketplace dry-run checks
- Call out documentation discrepancies explicitly. Do not silently assume
  `npx skill add` is correct if official docs differ.

## Quality Assurance

- Keep the tool list minimal.
- Use direct, unambiguous instructions.
- Stop and ask the user before using non-approved repository sources.
- Do not start authoring the final skill implementation unless the user asks.
- Ensure the prompt file remains reusable and repository-specific.

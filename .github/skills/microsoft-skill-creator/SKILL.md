---
name: microsoft-skill-creator
description: 'Create or refine agent skills for Microsoft technologies by combining local guidance with Learn MCP lookups. Use whenever requests mention building a skill for Azure, .NET, Microsoft 365, Power Platform, Semantic Kernel, VS Code, GitHub, Bicep, or other Microsoft services, SDKs, and frameworks, especially for hybrid skills that keep essentials local and fetch deeper details on demand.'
context: fork
compatibility: Requires Microsoft Learn MCP Server (https://learn.microsoft.com/api/mcp)
---

## Microsoft Skill Creator Router

## When to Use

- Create a new skill for a Microsoft SDK, service, framework, or API.
- Refine an existing Microsoft-focused skill so routing, examples, and Learn queries are stronger.
- Decide what knowledge belongs in `SKILL.md`, `references/`, `sample_codes/`, or dynamic MCP lookups.

## Inputs

- Technology or product area.
- Primary tasks the skill must support.
- Preferred language or platform.
- Whether the skill best fits an SDK/Library, Azure Service, Framework/Platform, or API/Protocol template.

## Tool Routes

| Goal | Tool | Example |
| ---- | ---- | ------- |
| Discover scope | `microsoft_docs_search` | `Semantic Kernel overview` |
| Deep dive | `microsoft_docs_fetch` | Fetch the most relevant Learn page |
| Find runnable code | `microsoft_code_sample_search` | `Azure AI Search csharp` |

## Default Workflow

1. Investigate the technology with Learn MCP tools: search, fetch, then sample search.
2. Extract the 3 to 5 concepts, common patterns, best practices, and troubleshooting paths that an agent needs most often.
3. Decide what stays local versus what should remain a dynamic lookup.
4. Generate a hybrid skill with concise frontmatter, a focused `SKILL.md`, and only the supporting files that add durable value.
5. Validate that the skill solves common tasks without duplicating full Microsoft reference docs.

## Output Structure

| Path | Include |
| ---- | ------- |
| `SKILL.md` | Trigger-rich description, workflow, key concepts, and MCP query guidance |
| `references/` | Stable detailed guidance that agents will reuse |
| `sample_codes/` | Minimal working examples or common patterns |
| `assets/` | Static templates or files used as-is |

## Local vs Dynamic

| Keep local | Keep dynamic |
| ---------- | ------------ |
| Foundational concepts and common patterns | Exhaustive API reference |
| Hello world and top tasks | Version-specific or fast-changing details |
| High-value best practices | Large troubleshooting matrices |
| Search and query recipes | Deep dives that Learn MCP can fetch on demand |

## Validation

- Frontmatter description must say what the skill does, when to use it, and likely trigger phrases.
- Keep local knowledge lean; do not duplicate the same content across `SKILL.md` and `references/`.
- Include at least one verified code path or official sample for the primary scenario.
- Provide concrete Learn queries for deeper investigation.

## References

- [Skill templates](./references/skill-templates.md)
- [Microsoft Learn MCP](https://learn.microsoft.com/api/mcp)

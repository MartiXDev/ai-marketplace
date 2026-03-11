---
name: microsoft-docs
description: 'Query official Microsoft documentation and samples across Azure, .NET, Agent Framework, Aspire, VS Code, GitHub, Microsoft 365, Power Platform, Semantic Kernel, and more. Use whenever requests mention Microsoft Learn MCP, Context7, aspire.dev, official docs lookup, tutorials, configuration, or code examples.'
---

## Microsoft Docs Router

## When to Use

- Find official concepts, tutorials, configuration guides, or code examples for Microsoft technologies.
- Decide whether the source lives on Learn, aspire.dev, VS Code docs, GitHub docs, or a repo.
- Route queries to Microsoft Learn MCP first, then Aspire MCP or Context7 when the docs live elsewhere.

## Route Table

| Source or topic | Default tool or tools | Use when |
| --------------- | --------------------- | -------- |
| `learn.microsoft.com` | `microsoft_docs_search`, `microsoft_code_sample_search`, and `microsoft_docs_fetch` | Azure, .NET, M365, Power Platform, Semantic Kernel, Windows, or Agent Framework tutorials |
| .NET Aspire on `aspire.dev` | `list_docs`, `search_docs`, and `get_doc` | Aspire CLI 13.2+ docs, integrations, deployment, and CLI reference |
| Aspire fallback | `mcp_context7_resolve-library-id` plus `mcp_context7_query-docs` with `/microsoft/aspire.dev`, `/dotnet/aspire`, or `/communitytoolkit/aspire` | Older Aspire MCP setups or source-level detail |
| VS Code docs | Context7 with `/websites/code_visualstudio` or `/websites/code_visualstudio_api` | Editor features, settings, debugging, or extension APIs |
| GitHub docs | Context7 with `/websites/github_en` or `/websites/cli_github` | GitHub Actions, Copilot, repositories, security, or `gh` CLI |
| Agent Framework deep detail | Learn MCP plus Context7 with `/websites/learn_microsoft_en-us_agent-framework` and `/microsoft/agent-framework` | Pair Learn tutorials with repo-level API or DevUI detail |

## Default Workflow

1. Start with Microsoft Learn tools unless the docs are known to live outside Learn.
2. Resolve Context7 library IDs once per session before querying external docs.
3. Make queries specific by including product, version, intent, and language.
4. Fetch full pages when search excerpts miss setup steps, limits, or full configuration tables.

## Query Patterns

| Goal | Better query |
| ---- | ------------ |
| Overview | `Azure Functions Python v2 programming model` |
| Limits and best practices | `Cosmos DB partition key design best practices` |
| Workflow or automation | `GitHub Actions workflow_dispatch inputs matrix strategy` |
| Aspire integration | `Aspire AddUvicornApp Python FastAPI integration` |
| Agent Framework | `Agent Framework workflow conditional edges branching handoff` |

## Validation

- Do not use Context7 for Learn content unless the authoritative docs are actually external.
- Include version, task intent, and language whenever the product is broad or polyglot.
- For Agent Framework, combine Learn guidance with repo detail when APIs or DevUI endpoints matter.

## References

- [Microsoft Learn](https://learn.microsoft.com/)
- [Aspire docs MCP tools overview](https://davidpine.dev/posts/aspire-docs-mcp-tools/)

---
name: microsoft-code-reference
description: 'Verify Microsoft SDK and API usage against official docs and samples. Use whenever requests mention Azure SDKs, Microsoft Graph, .NET libraries, method signatures, overloads, packages, deprecated APIs, auth failures, RBAC, or "is this API call correct?".'
compatibility: Requires Microsoft Learn MCP Server (https://learn.microsoft.com/api/mcp)
---

## Microsoft Code Reference Router

## When to Use

- Validate an Azure SDK, Microsoft Graph, Entra, or other Microsoft API call.
- Find the correct method, class, namespace, overload, or package.
- Compare current code against a working Microsoft sample before writing or fixing code.

## Tool Routes

| Need | Tool | Example query |
| ---- | ---- | ------------- |
| API lookup | `microsoft_docs_search` | `BlobClient UploadAsync Azure.Storage.Blobs` |
| Full signature or overloads | `microsoft_docs_fetch` | Fetch the page returned from search |
| Working sample | `microsoft_code_sample_search` | `upload blob managed identity` with `language: "csharp"` |
| Package or namespace check | `microsoft_docs_search` | `DefaultAzureCredential Azure.Identity package` |
| Migration or deprecation | `microsoft_docs_search` | `CloudBlobClient migration v12` |

## Default Workflow

1. Confirm the API surface exists with `microsoft_docs_search`.
2. Fetch the full reference page when overloads, parameters, or deprecation notes matter.
3. Find a working sample with `microsoft_code_sample_search`.
4. Return the verified method, package, and sample-based pattern instead of guessing.

## Validation

- Re-check any method name that seems unusually convenient or novel.
- Verify SDK family and package naming, such as `Azure.*`, `azure-*`, or `Microsoft.Graph`.
- For auth or `403 Forbidden` issues, route to credential, RBAC, or permissions docs.
- Prefer official migration guidance when v11 or v12 differences or deprecated APIs appear.

## References

- [Microsoft Learn](https://learn.microsoft.com/)
- [Azure SDK guidelines](https://azure.github.io/azure-sdk/)

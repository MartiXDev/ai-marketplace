# PowerShell Cmdlet Developer Skill Package — Strategic Design Report

**Prepared for:** AI Marketplace Skill Authoring  
**Source Corpus:** Microsoft PowerShell-Docs `reference/docs-conceptual/developer/cmdlet/`  
**Scope:** Compiled binary cmdlet development in C#; advanced function guidance mirrors cmdlet patterns only  
**Date:** 2026-03-10

---

## EXECUTIVE SUMMARY

### Corpus Overview
- **Total documented files:** 81 markdown articles  
- **Curated core files:** ~48 essential topics with actionable guidance  
- **Docstring source:** Microsoft Learn (learn.microsoft.com/powershell/scripting/developer/cmdlet/...)  
- **Target audience:** C# developers authoring compiled cmdlets; advanced functions as secondary mirrors  
- **Knowledge model compatibility:** ~400KB source text across rules, maps, and tutorials

### Recommended Skill Package Approach
A **standalone-first, domain-decomposed** package following `martix-tunit` pattern with:
- **7 core rule domains** (not 8—omit advanced-function-only content)  
- **2 risk-escalation rules** for front-loading highest pitfalls  
- **4 reference maps** covering lifecycle, patterns, compatibility, and source inventory  
- **1 compatibility matrix** (advanced function gaps, transactions, jobs)  
- **~2–3 rule files per domain**, each 3–5 KB, SKILL.md ≤15 KB  

---

## 1. DOMAIN DECOMPOSITION

### Candidate Domains (with prevalence and risk rank)

| Domain | Rule Count | Risk Rank | Precedence | Purpose |
|--------|-----------|-----------|-----------|---------|
| **Foundation** | 1–2 | **CRITICAL** | First | Base class selection, cmdlet attribute, assembly structure, module packaging |
| **Parameters** | 2–3 | **CRITICAL** | Second | Parameter sets, validation, standard names, pipeline input (ValueFromPipeline, ValueFromPipelineByPropertyName) |
| **Input & Output** | 2 | **HIGH** | Third | BeginProcessing/ProcessRecord/EndProcessing, object vs. text output, streaming |
| **Error Handling** | 2 | **CRITICAL** | Third | Terminating vs. non-terminating, ErrorRecord construction, categories, identifiers |
| **Confirmation & Safety** | 1–2 | **HIGH** | Fourth | ShouldProcess/ShouldContinue, Force parameter, WhatIf, transactions |
| **Advanced Patterns** | 1–2 | **MEDIUM** | Fifth | Dynamic parameters, aliases, session state, scriptblock invocation |
| **Attributes & Extensibility** | 1 | **MEDIUM** | Sixth | Custom validators, OutputType, Alias, credential handling |

### Recommended Final Structure (7 domains)

The skill should be organized into 7 progressive domains:

1. **foundation** — Base class, Cmdlet/PSCmdlet, module packaging
2. **parameters** — Declaration, sets, validation, standard names
3. **pipeline** — Input processing methods, Begin/Process/End, output streaming
4. **error-handling** — Terminating/non-terminating, ErrorRecord, categories
5. **confirmation-safety** — ShouldProcess, ShouldContinue, Force, WhatIf, transactions
6. **advanced-patterns** — Dynamic params, aliases, scriptblock invocation, session state
7. **attributes-validators** — Validation attributes, OutputType, custom validators, credentials

**Rationale:** Mirrors martix-tunit separation by lifecycle/execution/extensibility. Groups related decision clusters (confirmation + safety together, not separated). Omits module-only and advanced-function-only content (ETS, providers, formatting, hosting, help authoring).


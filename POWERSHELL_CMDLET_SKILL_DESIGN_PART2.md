---

## 2. HIGHEST-RISK PITFALLS & FRONT-LOADED RULES (CRITICAL)

### Five Critical Pitfalls

**PITFALL #1: Wrong Base Class or Missing Cmdlet Attribute** (RC01, RC02)
- **Risk:** Cmdlet not recognized by PowerShell; assembly load fails; non-functional code.
- **Common mistake:** Deriving from Cmdlet when PSCmdlet needed (or vice versa); missing [Cmdlet(VerbXxx, "Noun")].
- **Front-load rule:** "Foundation — base class and cmdlet attribute"
  - When to use Cmdlet (lightweight, no runtime dependency) vs PSCmdlet (runtime access, larger footprint).
  - Minimum attribute structure: verb, noun, SupportsShouldProcess flag.
  - Assembly and module shape (DLL, .psd1, OutputType in csproj).

**PITFALL #2: Incorrect Error Handling Pattern** (RC06)
- **Risk:** Scripts fail silently; pipelines don't break on critical errors; user confusion.
- **Common mistake:** Using throw instead of WriteError + ErrorRecord; not distinguishing terminating vs. non-terminating.
- **Front-load rule:** "Error Handling — Terminating vs. Non-Terminating Patterns"
  - Decision tree: Is this record-level or pipeline-stopping? → WriteError or ThrowTerminatingError.
  - ErrorRecord construction (exception, identifier, category, target).
  - When to use \\.WriteError()\ vs. \\.ThrowTerminatingError()\.

**PITFALL #3: Missing Confirmation & Force Parameter** (RD04, RD05)
- **Risk:** Destructive operations run without user feedback; non-interactive scripts fail.
- **Common mistake:** SupportsShouldProcess=true but no ShouldProcess call; Force parameter doesn't bypass ShouldContinue correctly.
- **Front-load rule:** "Confirmation & Safety — ShouldProcess, ShouldContinue, and Force Pattern"
  - Minimal nesting: \if(ShouldProcess) { if(Force || ShouldContinue) { DoThing(); } }\.
  - ConfirmImpact levels and when each is warranted.
  - Force parameter must bypass ShouldContinue but NOT ShouldProcess.

**PITFALL #4: Pipeline Input Misconceptions** (types-of-cmdlet-parameters)
- **Risk:** Parameter doesn't accept pipeline; users can't chain cmdlets; usability broken.
- **Common mistake:** Using ValueFromPipeline=true but not catching in ProcessRecord (BeginProcessing only); retaining handles to objects.
- **Front-load rule:** "Pipeline Input/Output — Parameter Binding and Streaming"
  - When to use each binding attribute and how to implement Begin/Process/End.
  - Anti-pattern: Collecting all input before processing (kills streaming).
  - Pipeline object lifecycle and why WriteObject must be in Process, not BeginProcessing.

**PITFALL #5: Parameter Set Confusion & Validation Gaps** (cmdlet-parameter-sets.md)
- **Risk:** Ambiguous parameter combinations; validation doesn't run; invalid input accepted.
- **Common mistake:** Parameter sets not mutually exclusive; validation stacking without order; using ValidateScript for simple enum checks.
- **Covered in:** Parameters domain (not standalone risk rule, but critical validation).

---

## 3. RECOMMENDED RULE & REFERENCE SPLIT

### 14 Rule Files (~49 KB gross; 3–4 KB each)

**Foundation (2 rules, 7 KB)**
1. foundation-base-class-attribute.md — Cmdlet vs. PSCmdlet, Cmdlet attribute, OutputType, SupportsShouldProcess, SupportsTransactions
2. foundation-project-module-shape.md — Project file shape, DLL naming, .psd1 manifest, Import-Module wiring, testing

**Parameters (3 rules, 10.5 KB)**
3. parameters-declaration-validation.md — Parameter attribute, Mandatory/Position/ParameterSetName, validation stacking, standard names
4. parameters-sets-dynamic.md — Parameter sets (unique per set, default), dynamic parameters (IDynamicParameters), conditions
5. parameters-pipeline-binding.md — ValueFromPipeline, ValueFromPipelineByPropertyName, wildcard support, binding precedence

**Pipeline (2 rules, 7.5 KB)**
6. pipeline-input-processing-methods.md — BeginProcessing, ProcessRecord, EndProcessing, StopProcessing, proper sequencing
7. pipeline-output-streaming.md — WriteObject semantics, object vs. text, null handling, extending output objects, OutputType

**Error Handling (2 rules, 7.5 KB)**
8. error-handling-terminating-nonterminating.md — Decision tree, ThrowTerminatingError vs. WriteError, ErrorRecord anatomy, categories
9. error-handling-errorrecord-construction.md — Exception object, ErrorId design, category selection, PSCmdlet methods vs. Write-Error

**Confirmation & Safety (2 rules, 7 KB)**
10. confirmation-shouldprocess-shouldcontinue.md — ShouldProcess declarative, ShouldContinue, nesting pattern, ConfirmImpact, WhatIf/Confirm
11. confirmation-force-parameter.md — Force parameter semantics, non-interactive scripts, what Force bypasses and doesn't

**Advanced Patterns (2 rules, 7 KB)**
12. advanced-dynamic-parameters-alias.md — IDynamicParameters, aliases, scriptblock invocation, session state access via PSCmdlet
13. advanced-transactions-jobs.md [OPTIONAL] — Transaction support (SupportsTransactions), job framework basics, when to use

**Attributes & Validators (1 rule, 3.5 KB)**
14. attributes-validators-outputtype.md — ValidateSet, ValidateRange, ValidatePattern, ValidateScript, ValidateLength, ValidateCount, OutputType, approved verbs

---

### 4 Reference Maps (~26 KB gross; 5–8 KB each)

1. **foundation-map.md** (6 KB) — Cmdlet vs. PSCmdlet comparison, module structure checklist, common mistakes.
2. **parameters-validation-map.md** (7 KB) — Parameter attribute matrix, validation attribute guide, standard names table, parameter set checklist.
3. **error-handling-categories-map.md** (6 KB) — ErrorCategory enum reference, terminating vs. non-terminating decision tree, ErrorRecord templates.
4. **doc-source-index.md** (5 KB) — Source file inventory, must-read/strongly-recommended/context-only precedence, out-of-scope topics.

---

## 4. SKILL.MD LENGTH & CONTEXT WINDOW MANAGEMENT

### Target: SKILL.md ≤12 KB

The SKILL.md should be a **router only**, not documentation. Route to 7 domains:

- Foundation and base class selection
- Parameters, validation, and sets
- Input processing and output streaming
- Error handling
- Confirmation, safety, and transactions
- Advanced patterns and extensibility
- Attributes, validators, and approved verbs

Each domain section should be 1–2 paragraphs pointing to 1–3 rules + 1 reference map.

### Context Window Budget

- **Rules:** 14 × 3.5 KB = 49 KB → ~40K tokens
- **References:** 4 × 6.5 KB = 26 KB → ~52K tokens
- **SKILL + assets:** 15 KB → ~30K tokens
- **Grand total:** ~122K tokens for full package

**Recommendation:** Stage loading by domain, not all at once. Load SKILL.md + section-order.json first (~30K tokens), then domain-specific rules + map (~20K tokens per workstream).

---

## 5. CORE VS. TUTORIAL VS. OPTIONAL

### CORE (Must include)
- foundation-base-class-attribute
- foundation-project-module-shape
- parameters-declaration-validation
- parameters-pipeline-binding
- pipeline-input-processing-methods
- pipeline-output-streaming
- error-handling-terminating-nonterminating
- error-handling-errorrecord-construction
- confirmation-shouldprocess-shouldcontinue
- confirmation-force-parameter
- attributes-validators-outputtype

**Subtotal:** 11 rules, ~38 KB. (Covers ~95% of common cmdlet scenarios.)

### STRONGLY ENCOURAGED
- parameters-sets-dynamic
- advanced-dynamic-parameters-alias

**Subtotal:** 2 rules, ~7 KB. (Multi-action cmdlets, dynamic parameters are frequent.)

### OPTIONAL / v1.1
- advanced-transactions-jobs (5–10% of cmdlets; complex setup)
- error-handling-categories-map (can embed in error-handling rule initially)

---

## 6. WHICH TOPICS ARE CORE VS. SECONDARY

### ✅ CORE (in skill)
- Cmdlet vs. PSCmdlet base class selection
- Parameter declaration, validation, sets, and standard names
- Begin/Process/End processing methods
- Streaming and object output vs. formatted text
- Terminating vs. non-terminating error patterns
- ErrorRecord construction and error categories
- ShouldProcess and Force parameter patterns
- Module packaging and deployment

### ⚠️ SECONDARY / MIRRORS (mention in context of cmdlets)
- Advanced functions with [CmdletBinding()]: Keep references minimal. Advanced functions follow cmdlet patterns, but not a focus.
- Dynamic parameters: Covered in advanced-patterns rule; not front-loaded.
- Transactions and jobs: Rare, complex; defer to v1.1.
- Session state access: Advanced; include in advanced-patterns rule only.

### ❌ OUT OF SCOPE (separate skills or excluded)
- **Providers** — PowerShell provider SDK is distinct; 10 files, 50+ KB.
- **ETS (Extended Type System)** — types.ps1xml, script methods. Platform-level; mention only in output rules.
- **Help Authoring** — Comment-based help, Platyps. Separate skill or AGENTS.md pointer.
- **Formatting** — Format.ps1xml, custom formatters. Platform feature, not cmdlet-specific.
- **Hosting** — InitialSessionState, Runspace APIs. Distinct surface (embedding PowerShell).
- **Background Jobs** — Full job framework. Advanced/rare; minimal mention only.

---

## 7. IMPLEMENTATION PHASES

### Phase 1: Minimal Viable Skill (Weeks 1–2)
- [ ] 5 core rules (foundation ×2, parameters ×1, pipeline ×1, error-handling ×1)
- [ ] SKILL.md + taxonomy.json + section-order.json
- [ ] doc-source-index.md

### Phase 2: Foundation Stability (Weeks 3–4)
- [ ] 3 additional rules (parameters ×2, confirmation-safety ×1)
- [ ] parameters-validation-map.md
- [ ] Full SKILL.md routing

### Phase 3: Error Handling & Polish (Week 5)
- [ ] 4 rules (error-handling ×2, confirmation-safety ×1, advanced-patterns ×1, attributes ×1)
- [ ] error-handling-categories-map.md + foundation-map.md

### Phase 4: Companion Materials (Week 6)
- [ ] AGENTS.md, README.md, LICENSE.txt
- [ ] templates/ (rule-template.md, research-pack-template.md)
- [ ] Marketplace registration

---

## CONCLUSION

A well-scoped martix-powershell-cmdlet skill should:

✅ **7 progressive domains** with clear precedence (foundation → parameters → pipeline → safety → advanced).  
✅ **14 rule files** (~49 KB; 3–4 KB each) structured as Purpose/Guidance/Avoid/Checklist/Sources.  
✅ **4 reference maps** for navigation (foundation, parameters-validation, error-categories, source-index).  
✅ **SKILL.md ≤12 KB** routing to all domains; ~30K tokens for SKILL + assets.  
✅ **Tier-0 pitfalls front-loaded** in foundational rules.  
✅ **Staged context loading** by domain; ~120K tokens total.  
✅ **Standalone-first, marketplace-ready** deployment.  

**Estimated effort:** 40–60 hours authoring + ~20 hours validation = 6–8 weeks for release-ready package.


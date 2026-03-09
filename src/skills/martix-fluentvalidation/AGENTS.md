---
description: 'Long-form companion guide for the martix-fluentvalidation standalone skill package'
---

# MartiX FluentValidation companion

- This file is the long-form companion to [SKILL.md](./SKILL.md).
- The package follows a layered, standalone-first split: `SKILL.md` routes
  activation, `AGENTS.md` explains how to apply the library, `rules\*.md`
  holds atomic guidance, `references\*.md` maps guidance to approved sources,
  and `templates\*.md` plus `assets\*.json` keep the package maintainable.
- Start with the closest bundled workstream map and keep ecosystem notes as a
  second-pass expansion surface instead of a first-stop rule source.

## Package inventory

| Layer | Purpose | Key files |
| --- | --- | --- |
| Discovery | Quick activation and workstream routing | [SKILL.md](./SKILL.md) |
| Companion | Cross-workstream guidance, review routes, and maintainer notes | [AGENTS.md](./AGENTS.md) |
| Rules | 23 atomic FluentValidation decision guides | [Rule section contract](./rules/_sections.md) |
| References | 10 maps, compatibility notes, and ecosystem notes | [Foundation map](./references/foundation-map.md) |
| Templates | Authoring, research, and comparison scaffolds | [Rule template](./templates/rule-template.md) |
| Assets | Supporting taxonomy and ordering data | [taxonomy.json](./assets/taxonomy.json) and [section-order.json](./assets/section-order.json) |
| Metadata | Package identity, inventory, and distribution intent | [metadata.json](./metadata.json) |

## Working stance

- Keep this package FluentValidation-specific. General ASP.NET Core request
  handling, broader .NET architecture, or generic localization guidance belongs
  in sibling MartiX .NET skills unless FluentValidation adds package-specific
  behavior.
- Prefer documented FluentValidation defaults before custom wrappers: built-in
  validators, `RuleFor(...)`, `RuleForEach(...)`, `SetValidator(...)`,
  `ValidateAsync(...)`, RuleSets, and first-party error metadata APIs.
- Keep validator authoring, application integration, metadata contracts, and
  tests aligned instead of treating them as separate cleanup passes.
- Treat official FluentValidation documentation as the first-pass authority.
  Use ecosystem sources only when the official docs explicitly defer to them or
  when the task is about comparing adapters.
- Keep review notes concrete at validator, property, collection, entrypoint,
  async boundary, and upgrade-path level.

## Workstream playbook

## Foundation and composition

- Open this workstream before changing package setup, version baselines,
  `AbstractValidator<T>` shape, nested validators, collection validation, or
  same-root validator composition.
- Start with
  [FluentValidation installation and versioning baseline](./rules/foundation-installation-versioning.md),
  [FluentValidation validator basics](./rules/foundation-validator-basics.md),
  and
  [FluentValidation collections and composition](./rules/foundation-collections-composition.md).
- Pair with the
  [FluentValidation foundation map](./references/foundation-map.md) when install
  assumptions, collection APIs, or supported composition options matter.
- Review questions:
  - Is the solution on a supported FluentValidation line for its runtime
    baseline?
  - Does the validator use the smallest durable building blocks:
    `RuleFor(...)`, `RuleForEach(...)`, `SetValidator(...)`, or `Include(...)`?
  - Are nested or collection rules keeping property paths and composition
    boundaries clear?

## Built-in validator families

- Open this workstream when choosing validator chains for presence checks,
  comparisons, numeric bounds, string length or format, enums, regex, or
  predicate fallbacks.
- Start with
  [FluentValidation null, empty, and presence validators](./rules/validators-null-empty.md),
  [FluentValidation comparison and range validators](./rules/validators-comparison-range.md),
  [FluentValidation length and format validators](./rules/validators-length-format.md),
  and
  [FluentValidation enum, predicate, and regex validators](./rules/validators-enum-predicate-regex.md).
- Pair with the
  [FluentValidation built-in validators map](./references/built-in-validators-map.md)
  when the right validator family is still unclear.
- Review questions:
  - Is a built-in validator available before reaching for `Must` or a custom
    validator?
  - Do the chosen validators preserve `PropertyPath`,
    `{CollectionIndex}`, and message placeholders that downstream consumers need?
  - Does the chain clearly separate required-value, comparison, and format
    intent?

## Rule configuration and execution

- Open this workstream for custom messages, placeholders, property names,
  property paths, collection indexers, conditions, RuleSets, cascade modes,
  validator inclusion, and dependent-rule behavior.
- Start with
  [FluentValidation messages and placeholders](./rules/configuration-messages-placeholders.md),
  [FluentValidation property names and paths](./rules/configuration-property-names-paths.md),
  [FluentValidation conditions and RuleSets](./rules/execution-conditions-rulesets.md),
  and
  [FluentValidation cascade, inclusion, and dependent rules](./rules/execution-cascade-dependent-inclusion.md).
- Pair with the
  [FluentValidation rule configuration map](./references/rule-configuration-map.md)
  when execution flow or configuration APIs drive the behavior change.
- Review questions:
  - Are messages, property labels, and paths explicit enough for users and
    downstream error handling?
  - Should behavior be controlled with RuleSets or conditions instead of
    duplicating validators?
  - Does cascade or dependent-rule usage improve clarity, or is it hiding logic
    that should stay explicit?

## Integration and application boundaries

- Open this workstream for DI registration, ASP.NET Core integration, MVC or
  Razor Pages validation boundaries, Minimal APIs, async entrypoints, and
  Blazor-adapter evaluation.
- Start with
  [FluentValidation DI registration and discovery](./rules/integration-di-registration.md),
  [FluentValidation ASP.NET Core application integration](./rules/integration-aspnet-core.md),
  and
  [FluentValidation async validation integration](./rules/integration-async-validation.md).
- Pair with the
  [FluentValidation integration map](./references/integration-map.md), then add
  the [FluentValidation Blazor ecosystem note](./references/blazor-ecosystem-note.md)
  only when the task explicitly reaches Blazor.
- Review questions:
  - Is validation running at the intended boundary: manual application code,
    filter-based integration, or a narrowly justified ecosystem adapter?
  - Are async rules always invoked with `ValidateAsync(...)` all the way to the
    application entrypoint?
  - Are third-party packages clearly treated as ecosystem choices rather than
    first-party FluentValidation defaults?

## Extensibility and advanced behavior

- Open this workstream for `Must`, `Custom`, reusable extension methods, custom
  property validators, inheritance dispatch, `PreValidate`, `RootContextData`,
  and validation-exception customization.
- Start with
  [FluentValidation custom validator selection](./rules/extensibility-custom-validators.md),
  [FluentValidation reusable property validators and SetValidator](./rules/extensibility-property-validators.md),
  and
  [FluentValidation inheritance, pre-validation, and context hooks](./rules/extensibility-inheritance-prevalidate-context.md).
- Pair with the
  [FluentValidation extensibility map](./references/extensibility-map.md) when
  deciding how far to widen beyond built-in validators.
- Review questions:
  - Is the chosen extensibility point the smallest one that models the rule?
  - Should reusable logic live in an extension method, a property validator, or
    a normal composed validator?
  - Are ambient context, inheritance mapping, and exception behavior explicit
    enough for reviewers to reason about?

## Runtime metadata and localization

- Open this workstream for severity, error codes, custom state, localized
  messages, `LanguageManager`, and validation metadata that downstream systems
  consume.
- Start with
  [FluentValidation severity, error codes, and custom state](./rules/runtime-severity-error-codes-state.md)
  and
  [FluentValidation localization and language manager](./rules/runtime-localization-language-manager.md).
- Pair with the
  [FluentValidation runtime metadata and localization map](./references/runtime-metadata-map.md)
  when the validation contract needs to stay machine-readable across locales.
- Review questions:
  - Are severity, error codes, and custom state used for stable downstream
    handling instead of parsing message text?
  - Does localization strategy preserve the placeholders and metadata the app
    expects?
  - Are global language-manager changes deliberate and visible at startup?

## Testing and verification

- Open this workstream for validator black-box tests, `FluentValidation.TestHelper`,
  async test paths, boundary stubs, DI registration checks, and application
  integration tests.
- Start with
  [FluentValidation validator test helper usage](./rules/testing-validator-testhelper.md)
  and
  [FluentValidation testing integration boundaries](./rules/testing-integration-boundaries.md).
- Pair with the [FluentValidation testing map](./references/testing-map.md) for
  the official source trail behind validator-focused tests versus application
  entrypoint tests.
- Review questions:
  - Does the scenario need validator tests, application integration tests, or
    both?
  - Are async validators tested with async entrypoints all the way through?
  - Are assertions focused on failure shape and boundary behavior instead of
    FluentValidation internals?

## Upgrade and compatibility

- Open this workstream for current-version targets, staged major-version
  upgrades, runtime support decisions, and cleanup of deprecated FluentValidation
  APIs across 8.x-12.x.
- Start with
  [FluentValidation current upgrade baseline](./rules/upgrade-current-baseline.md)
  and
  [FluentValidation upgrade breaking changes history](./rules/upgrade-breaking-changes-history.md).
- Pair with the [FluentValidation upgrade map](./references/upgrade-map.md) and
  [FluentValidation compatibility matrix](./references/compatibility-matrix.md)
  before recommending 12.x or skipping historical cleanup.
- Review questions:
  - Does the solution's lowest supported runtime allow FluentValidation 12, or
    is 11.x still the compatibility waypoint?
  - Are sync-over-async calls, cascade API changes, old ASP.NET integration
    hooks, or custom validator internals still present?
  - Is the upgrade plan staged in a way that keeps validator behavior observable
    and testable?

## Common review routes

| Scenario | Start with | Then add |
| --- | --- | --- |
| New validator for a model or DTO | [FluentValidation validator basics](./rules/foundation-validator-basics.md) | [Null, empty, and presence validators](./rules/validators-null-empty.md), [Collections and composition](./rules/foundation-collections-composition.md), [Validator test helper usage](./rules/testing-validator-testhelper.md) |
| Required fields, comparison rules, or string constraints | [FluentValidation built-in validators map](./references/built-in-validators-map.md) | [Messages and placeholders](./rules/configuration-messages-placeholders.md), [Property names and paths](./rules/configuration-property-names-paths.md) |
| RuleSets, conditions, or fail-fast behavior | [FluentValidation rule configuration map](./references/rule-configuration-map.md) | [Conditions and RuleSets](./rules/execution-conditions-rulesets.md), [Cascade, inclusion, and dependent rules](./rules/execution-cascade-dependent-inclusion.md), [Testing integration boundaries](./rules/testing-integration-boundaries.md) |
| ASP.NET Core or Minimal API integration | [FluentValidation ASP.NET Core application integration](./rules/integration-aspnet-core.md) | [DI registration and discovery](./rules/integration-di-registration.md), [Async validation integration](./rules/integration-async-validation.md), [Testing integration boundaries](./rules/testing-integration-boundaries.md) |
| Async validation bug or sync-over-async review | [FluentValidation async validation integration](./rules/integration-async-validation.md) | [Testing map](./references/testing-map.md), [Current upgrade baseline](./rules/upgrade-current-baseline.md), [ASP.NET Core application integration](./rules/integration-aspnet-core.md) |
| Custom validator or reusable extension design | [FluentValidation custom validator selection](./rules/extensibility-custom-validators.md) | [Reusable property validators and SetValidator](./rules/extensibility-property-validators.md), [Built-in validators map](./references/built-in-validators-map.md), [Validator test helper usage](./rules/testing-validator-testhelper.md) |
| Error metadata or localization contract review | [FluentValidation severity, error codes, and custom state](./rules/runtime-severity-error-codes-state.md) | [Localization and language manager](./rules/runtime-localization-language-manager.md), [Messages and placeholders](./rules/configuration-messages-placeholders.md), [Property names and paths](./rules/configuration-property-names-paths.md) |
| Major-version upgrade planning | [FluentValidation upgrade map](./references/upgrade-map.md) | [Compatibility matrix](./references/compatibility-matrix.md), [Current upgrade baseline](./rules/upgrade-current-baseline.md), [Upgrade breaking changes history](./rules/upgrade-breaking-changes-history.md) |
| Blazor adapter evaluation | [FluentValidation Blazor ecosystem note](./references/blazor-ecosystem-note.md) | [Integration map](./references/integration-map.md), [Async validation integration](./rules/integration-async-validation.md), [DI registration and discovery](./rules/integration-di-registration.md) |

## Reference map index

- [FluentValidation foundation map](./references/foundation-map.md)
- [FluentValidation built-in validators map](./references/built-in-validators-map.md)
- [FluentValidation rule configuration map](./references/rule-configuration-map.md)
- [FluentValidation integration map](./references/integration-map.md)
- [FluentValidation extensibility map](./references/extensibility-map.md)
- [FluentValidation runtime metadata and localization map](./references/runtime-metadata-map.md)
- [FluentValidation testing map](./references/testing-map.md)
- [FluentValidation upgrade map](./references/upgrade-map.md)
- [FluentValidation compatibility matrix](./references/compatibility-matrix.md)
- [FluentValidation Blazor ecosystem note](./references/blazor-ecosystem-note.md)

## Official core docs

- Foundation:
  - [Installation](https://docs.fluentvalidation.net/en/latest/installation.html)
  - [Creating your first validator](https://docs.fluentvalidation.net/en/latest/start.html)
  - [Collections](https://docs.fluentvalidation.net/en/latest/collections.html)
  - [Including Rules](https://docs.fluentvalidation.net/en/latest/including-rules.html)
- Built-in validators and configuration:
  - [Built-in validators](https://docs.fluentvalidation.net/en/latest/built-in-validators.html)
  - [Configuring Validators](https://docs.fluentvalidation.net/en/latest/configuring.html)
  - [Conditions](https://docs.fluentvalidation.net/en/latest/conditions.html)
  - [RuleSets](https://docs.fluentvalidation.net/en/latest/rulesets.html)
  - [Setting the Cascade mode](https://docs.fluentvalidation.net/en/latest/cascade.html)
  - [Dependent Rules](https://docs.fluentvalidation.net/en/latest/dependentrules.html)
  - [Validating specific properties](https://docs.fluentvalidation.net/en/latest/specific-properties.html)
- Integration and extensibility:
  - [Dependency injection](https://docs.fluentvalidation.net/en/latest/di.html)
  - [ASP.NET Core integration](https://docs.fluentvalidation.net/en/latest/aspnet.html)
  - [Asynchronous Validation](https://docs.fluentvalidation.net/en/latest/async.html)
  - [Custom validators](https://docs.fluentvalidation.net/en/latest/custom-validators.html)
  - [Advanced features](https://docs.fluentvalidation.net/en/latest/advanced.html)
  - [Inheritance validation](https://docs.fluentvalidation.net/en/latest/inheritance.html)
- Runtime, testing, and upgrades:
  - [Severity](https://docs.fluentvalidation.net/en/latest/severity.html)
  - [Custom Error Codes](https://docs.fluentvalidation.net/en/latest/error-codes.html)
  - [Custom State](https://docs.fluentvalidation.net/en/latest/custom-state.html)
  - [Localization](https://docs.fluentvalidation.net/en/latest/localization.html)
  - [Testing](https://docs.fluentvalidation.net/en/latest/testing.html)
  - [Upgrading to 12](https://docs.fluentvalidation.net/en/latest/upgrading-to-12.html)
  - [Upgrading to 11](https://docs.fluentvalidation.net/en/latest/upgrading-to-11.html)
  - [Upgrading to 10](https://docs.fluentvalidation.net/en/latest/upgrading-to-10.html)
  - [Upgrading to 9](https://docs.fluentvalidation.net/en/latest/upgrading-to-9.html)
  - [Upgrading to 8](https://docs.fluentvalidation.net/en/latest/upgrading-to-8.html)

## Linked ecosystem sources

- Treat these as linked ecosystem context, not first-pass policy:
  - [FluentValidation.AspNetCore](https://github.com/FluentValidation/FluentValidation.AspNetCore)
    for legacy MVC auto-validation history
  - [SharpGrip.FluentValidation.AutoValidation](https://github.com/SharpGrip/FluentValidation.AutoValidation)
    for third-party async auto-validation
  - [ForEvolve.FluentValidation.AspNetCore.Http](https://github.com/Carl-Hugo/FluentValidation.AspNetCore.Http)
    for Minimal API filter integration
  - [AutoRegisterInject](https://github.com/patrickklaeren/AutoRegisterInject)
    for compile-time DI registration
  - [Blazilla](https://github.com/loresoft/Blazilla),
    [Blazored.FluentValidation](https://github.com/Blazored/FluentValidation),
    [Blazor-Validation](https://github.com/mrpmorris/blazor-validation),
    [Accelist.FluentValidation.Blazor](https://github.com/ryanelian/FluentValidation.Blazor),
    and [vNext.BlazorComponents.FluentValidation](https://github.com/Liero/vNext.BlazorComponents.FluentValidation)
    for Blazor adapter evaluation
- Use these links only when the official docs point to them or when the task is
  explicitly about adapter choice, migration, or ecosystem comparison.

## Maintenance and package growth

## Authoring contract

- Keep every rule aligned with [rules/_sections.md](./rules/_sections.md).
- Use [the rule template](./templates/rule-template.md) when adding or revising
  rule files.
- Keep new guidance small, decision-oriented, and cross-linked instead of
  turning one rule into a tutorial dump.

## Research and comparison

- Use [the research pack template](./templates/research-pack-template.md) when a
  future expansion needs a scoped source inventory before new rules are added.
- Use
  [the comparison matrix template](./templates/comparison-matrix-template.md)
  when comparing this package with external FluentValidation, ASP.NET Core, or
  .NET validation skills.
- Treat [metadata.json](./metadata.json) as the registration-ready inventory and
  distribution contract for future package growth.

## Standalone packaging note

- This package is the canonical standalone skill under `src\skills`.
- If you document or install it directly, use `npx skills add <source>`.
- Future direct marketplace registration should point to
  `src\skills\martix-fluentvalidation` rather than duplicating the package
  elsewhere.

## Source boundaries

- Approved first-pass guidance comes from the official FluentValidation docs
  surfaced by the bundled reference maps.
- Treat linked ecosystem sources as opt-in context for adapter selection,
  migration, or legacy integration reviews.
- Do not widen this package into generic ASP.NET Core or unrelated repository
  guidance unless a later task explicitly requires it.

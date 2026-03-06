## .NET Library Checklists Template

Use this file as a starting point for mode-specific planning and review
checklists.

## Author mode

- Public API shape is intentional and documented.
- Target framework strategy is explicit.
- Dependency additions are minimal and justified.
- Tests cover expected, edge, and failure behavior.

## Update mode

- Baseline behavior and contracts are confirmed before changes.
- Compatibility impact is classified (source/binary/behavioral).
- Migration guidance is documented when compatibility risks exist.
- SemVer recommendation matches change impact.

## Review mode

- Findings are prioritized by risk and release impact.
- Dependency/versioning/packaging risks are explicit.
- Validation evidence is reproducible.
- Follow-up tasks are specific and testable.

## Release readiness

- Restore/build/test commands passed.
- Pack passed when packaging is in scope.
- Unresolved risks and mitigation are documented.

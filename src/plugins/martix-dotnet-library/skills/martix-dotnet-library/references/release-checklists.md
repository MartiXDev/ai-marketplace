## MartiX .NET Library Checklists

Use these checklists for author, update, review, and release preparation tasks.

## Author Mode

- Public API shape and naming are intentional.
- Target framework strategy is documented.
- Dependency additions are minimal and justified.
- Tests cover happy path, failures, and edge cases.

## Update Mode

- Existing behavior baseline is confirmed before edits.
- Compatibility impact is classified (source/binary/behavioral).
- Migration guidance is added when compatibility changes are possible.
- Versioning recommendation matches SemVer impact.

## Review Mode

- Findings are prioritized by risk and release impact.
- Dependency, versioning, and packaging risks are explicit.
- Validation evidence is reproducible from repository root.
- Follow-up actions are specific and testable.

## Release Readiness

- `dotnet restore --nologo` passed.
- `dotnet build --nologo` passed.
- `dotnet test --nologo --no-build` passed.
- `dotnet pack -c Release --no-build` passed when packaging is in scope.
- Open risks and rollback plan are documented.

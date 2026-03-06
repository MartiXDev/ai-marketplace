## Validation hook info

This file documents the shared validation hook used by author, update, and
review assets in `martix-dotnet-library`.

## Hook identity

- **Hook ID:** `martix-dotnet-library-validation`
- **Hook file:** `./martix-dotnet-library-validation.hook.yaml`
- **Used by command:** `martix-dotnet-library`

## Requirements

- Run from `MartiXDev/WebApi` repository root.
- .NET SDK installed.
- Restore, build, and test commands available:
  - `dotnet restore --nologo`
  - `dotnet build --nologo`
  - `dotnet test --nologo --no-build`
- Packaging command available when release/package changes are in scope:
  - `dotnet pack -c Release --no-build`

## Inputs and outputs

- **Input:** local state of target repository and caller-selected command mode.
- **Output:** pass/fail validation result from restore/build/test and optional
  pack stage.
- **Failure policy:** stop on first error.

## Maintenance notes

- If validation commands or target repository strategy changes, update:
  - `./martix-dotnet-library-validation.hook.yaml`
  - `../instructions/martix-dotnet-library.instructions.md`
  - `../RESOURCES.md`


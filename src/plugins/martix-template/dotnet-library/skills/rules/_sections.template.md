## Sections

This file defines category ordering, impact levels, and filename prefixes for a
concrete skill package.

## 1. Compatibility and API evolution (compat)

**Impact:** CRITICAL
**Description:** Preserve source, binary, and behavioral compatibility through
additive changes, migration bridges, and explicit release notes.

## 2. Targeting and framework strategy (target)

**Impact:** HIGH
**Description:** Keep target framework choices explicit, supportable, and
aligned to consumer expectations.

## 3. Dependencies and packaging (package)

**Impact:** HIGH
**Description:** Control NuGet dependencies, package metadata, Source Link, and
debuggability.

## 4. Validation and release readiness (validate)

**Impact:** HIGH
**Description:** Make restore/build/test/pack gates and residual risks visible
before release.

## 5. Documentation and discoverability (docs)

**Impact:** MEDIUM
**Description:** Keep XML docs, metadata, and source inventories accurate and
maintainable.

## 6. Advanced interoperability (advanced)

**Impact:** LOW
**Description:** Capture niche integration or interoperability guidance without
crowding the main quick reference.
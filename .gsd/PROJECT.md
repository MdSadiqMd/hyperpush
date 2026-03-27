# Project

## What This Is

Mesh is a programming language and backend application platform repository aimed at being trustworthy for real backend work, not just toy examples. The repo contains the compiler, runtime, formatter, LSP, REPL, package tooling, docs site, package registry, package website, and two dogfood applications: `reference-backend/` as the narrow proof surface and `mesher/` as the broader pressure test.

## Core Value

Dogfood friction should turn into honest platform improvements: when Mesh or its surrounding delivery/tooling/editor/package surfaces hit a real limitation, the repo should fix that limitation at the source and then prove the repaired path end to end instead of carrying permanent folklore or artifact-only confidence.

## Current State

Mesh already ships a broad backend-oriented stack:
- Rust workspace crates under `compiler/` for lexing, parsing, type checking, code generation, runtime, formatter, LSP, REPL, package tooling, and CLI commands
- native compilation to standalone binaries
- runtime support for actors, supervision, HTTP, WebSocket, JSON, database access, migrations, files, env, crypto, datetime, and collections
- dogfooded applications: `reference-backend/` and `mesher/`
- a real package registry service in `registry/`, a public packages website in `packages-website/`, and a VS Code extension in `tools/editors/vscode-mesh/`

Recent milestone state:
- M028 established the production-backend trust baseline around API + DB + migrations + jobs
- M029 completed the major formatter correctness and dogfood cleanup wave across `mesher/` and `reference-backend/`
- M031 fixed several real DX/compiler rough edges found through dogfooding and expanded the regression suite
- M032 retired stale Mesher limitation folklore, fixed real blockers in Mesh, and dogfooded those repairs back into `mesher/`
- M033 strengthened the neutral ORM/migration core, added explicit PostgreSQL extras, and left a clean path for later SQLite-specific work
- M034/S01 now proves the real registry publish/install path end to end: scoped installed packages resolve from their natural cache layout, `scripts/verify-m034-s01.sh` publishes and installs a real scoped package through the live registry path, and the publish/download/named-install/docs contracts are now mechanically checked instead of assumed.
- M034/S02 now promotes that live proof into the repo's CI/release contract: one reusable authoritative workflow owns `bash scripts/verify-m034-s01.sh`, trusted same-repo PR/main/manual/weekly lanes call it without widening fork trust boundaries, `release.yml` gates tag publication on the same reusable proof, and `scripts/verify-m034-s02-workflows.sh` enforces the three-workflow contract locally. GitHub-side run evidence is still pending the next push because the new workflow files are not yet present on the remote default branch.
- M034/S03 now proves the public installer path instead of just release uploads: `website/docs/public/install.{sh,ps1}` are the canonical installer sources, repo-local copies are kept byte-identical, staged verifier scripts prove checksum/install/runtime truth against release-style assets, `release.yml` now ships Windows `meshpkg` plus a `verify-release-assets` smoke gate before publication, and the public docs/editor README treat `https://meshlang.dev/install.{sh,ps1}` as the verified way to install both `meshc` and `meshpkg`.
- M034/S04 now hardens the VS Code extension release lane into a truthful prepublish gate: deterministic `dist/mesh-lang-<version>.vsix` packaging ships the real runtime dependency tree, `scripts/verify-m034-s04-extension.sh` replays tag/docs/package drift checks plus the shared `e2e_lsp` proof and emits exact VSIX diagnostics under `.tmp/m034-s04/verify/`, and the new reusable `extension-release-proof.yml` workflow is the only workflow allowed to run that verifier before the thin publish job hands the same verified VSIX to both registries.
- M034/S05 now assembles those proof surfaces behind `scripts/verify-m034-s05.sh`: the wrapper reuses the S01-S04 verifiers unchanged, derives binary vs extension candidate tags into `.tmp/m034-s05/verify/candidate-tags.json`, records hosted workflow evidence in `.tmp/m034-s05/verify/remote-runs.json`, verifies deploy-workflow/docs truth locally, and fail-closes before public publish/install if GitHub rollout or deployed public content is stale.
- M034/S06 now makes hosted-rollout state durable and non-destructive even while rollout is blocked: `scripts/verify-m034-s05.sh` supports `--stop-after remote-evidence`, `scripts/verify-m034-s06-remote-evidence.sh` snapshots labeled bundles under `.tmp/m034-s06/evidence/`, the extension proof is derived from the `publish-extension.yml` caller run instead of a non-existent standalone push workflow, and the slice preserved transport-recovery evidence showing this host still cannot land the rollout commit over HTTPS (`HTTP 408` on both chunked and 1 GiB-buffered pushes).

M034 has now repaired the two local blocker surfaces that were left after S09. On the code side, the registry recomputes `packages.latest_version` from committed `versions` rows under a per-package lock so metadata/search stay monotonic across overlapping publishes, and `mesh-codegen` now performs target-aware runtime discovery/linking for Windows MSVC while the staged PowerShell verifier preserves actionable phase logs. Those fixes hold locally through the focused registry, linker, and workflow-contract proofs.

The hosted state is still not milestone-green, but the blocker is narrower and more specific now. A fresh S11 replay of `VERIFY_M034_S05_STOP_AFTER=remote-evidence bash scripts/verify-m034-s05.sh` rebuilt `.tmp/m034-s05/verify/remote-runs.json` and confirmed that five hosted lanes are green on their expected refs: `deploy.yml` and `authoritative-verification.yml` are green on `main` SHA `e59f18203a30951af5288791bf9aed5b53a24a2a`, `deploy-services.yml` is green on binary tag `v0.1.0` SHA `1e83ea930fdfd346b9e56659dc50d2f759ec5da2`, and the extension proof/publish lanes are green on `ext-v0.3.0` SHA `8e6d49dacc4f4cd64824b032078ae45aabfe9635`. The only remaining red lane is `release.yml` on `v0.1.0` SHA `1e83ea930fdfd346b9e56659dc50d2f759ec5da2`.

That distinction matters because the current failing `release.yml` run (`23669185030`) already includes the Windows smoke-toolchain steps (`Install LLVM 21 for Windows smoke verifier`, `Set LLVM prefix for Windows smoke verifier`, and `Build mesh-rt for smoke verifier`). The remaining failure is therefore not a stale workflow patch: the `Verify staged installer assets (Windows)` step still crashes during `installed meshc.exe build installer smoke fixture` with hosted diagnostics showing `exit_code: -1073741819` and empty stdout/stderr in `.tmp/m034-s11/t03/diag-download/windows/verify/run/07-hello-build.log`.

M034 is therefore in a blocked closeout state. `first-green` has still not been captured, `.tmp/m034-s06/evidence/first-green/` must remain absent, and S11 cannot be completed honestly until the installed Windows compiler crash is fixed or otherwise retired on the live `v0.1.0` release lane.

## Architecture / Key Patterns

- Rust workspace under `compiler/` with separate crates for parser, type checker, codegen, runtime, formatter, LSP, CLI, REPL, package tooling, and CLI-facing package manager code
- backend-first proof surfaces through `reference-backend/` and `mesher/`
- release/deploy/package surfaces split across GitHub Actions, `registry/`, `packages-website/`, `website/`, install scripts, and `tools/editors/vscode-mesh/`
- proof-first dogfooding: reproduce a real app or delivery limitation, fix it at the right layer, then dogfood the repaired path back into the repo’s real workflows
- keep the default surface boring and composable; use explicit boundary markers when behavior is genuinely vendor-, editor-, or deployment-specific

## Capability Contract

See `.gsd/REQUIREMENTS.md` for the explicit capability contract, requirement status, and coverage mapping.

## Milestone Sequence

- [x] M028: Language Baseline Audit & Hardening — prove the first honest API + DB + migrations + jobs backend path
- [x] M029: Mesher & Reference-Backend Dogfood Completion — fix formatter corruption and complete the dogfood cleanup wave
- [x] M031: Language DX Audit & Rough Edge Fixes — retire real dogfood rough edges through compiler and parser fixes
- [x] M032: Mesher Limitation Truth & Mesh Dogfood Retirement — audit workaround folklore, fix real blockers in Mesh, and dogfood those repairs back into `mesher/`
- [x] M033: ORM Expressiveness & Schema Extras — strengthen the neutral data layer, add PG-first extras now, and leave a clean path for SQLite extras later
- [ ] M034: Delivery Truth & Public Release Confidence — harden CI/CD, prove the package manager end to end, and make the public release path trustworthy instead of artifact-only
- [ ] M035: Test Framework Hardening — get Mesh’s testing story ready to test `mesher` thoroughly during development
- [ ] M036: Editor Parity & Multi-Editor Support — make editor support match real Mesh syntax and give at least one non-VSCode editor a first-class path
- [ ] M037: Package Experience & Ecosystem Polish — improve the package manager experience, website-first, once the underlying trust path is proven

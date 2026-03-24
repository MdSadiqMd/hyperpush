# Project

## What This Is

Mesh is a programming language and application platform repository focused on becoming a production-trustworthy general-purpose language with a lean toward server/backend code. It already contains the compiler, runtime, standard library, formatter, LSP, REPL, package tooling, registry, docs site, benchmarks, and dogfooded applications. The current priority is fixing syntax rough edges and DX friction discovered through real backend dogfooding, then cleaning up both dogfood codebases to use idiomatic Mesh.

## Core Value

Mesh should be something you can trust for a real production app backend in any capacity, starting with an honest API + DB + migrations + background jobs path that feels as easy to deploy as a Go binary.

## Current State

The repository ships a broad backend-oriented language platform:
- Rust workspace crates for lexing, parsing, type checking, code generation, runtime, formatter, LSP, REPL, package resolution, and CLI tooling
- native LLVM code generation to standalone binaries
- runtime support for actors, supervision, HTTP, WebSocket, JSON, database access, migrations, files, env, crypto, datetime, and collections
- package and registry infrastructure plus a docs/website surface
- dogfooded backend applications: `reference-backend/` (API + DB + jobs) and `mesher/` (error monitoring platform)

M028 established the backend trust baseline with recovery proof, deployment proof, tooling trust, and documentation. M031 completed the language DX audit: fixed three compiler bugs (trailing-closure disambiguation in control-flow conditions, else-if chain value correctness, multiline fn call type resolution), added parenthesized multiline imports and trailing-comma support, cleaned both dogfood codebases to idiomatic Mesh (125 `let _ =` removed, 15 `== true` removed, struct update syntax, else-if chains, interpolation), and expanded the e2e test suite to 328 tests covering all 12 pattern categories. M029 is now slice-complete: S01 fixed dotted-path and multiline-import formatter corruption, S02 closed the Mesher JSON/interpolation and pipe-style cleanup, and S03 finished the multiline-import rollout, repaired the last formatter/CLI truth-surface regressions (`pub type`/schema spacing and noisy `fmt --check` success output), and left both `mesher/` and `reference-backend/` passing their formatter/build gates under canonical output. The remaining milestone-wide proof outside the S03 closeout surface is the broader `cargo test -p meshc --test e2e` acceptance rerun from the roadmap definition of done.

## Architecture / Key Patterns

- Rust workspace under `compiler/` with distinct crates for lexer, parser, type checker, codegen, runtime, formatter, LSP, REPL, package tooling, and CLI
- native-binary compilation via LLVM rather than a VM runtime requirement
- runtime centered on actors, supervision, HTTP, WebSocket, DB, migrations, and other backend primitives
- dogfooding through `reference-backend/` and `mesher/`
- proof-first rule: if a language limitation blocks the app, fix Mesh at the source and prove it through a real backend workflow

## Capability Contract

See `.gsd/REQUIREMENTS.md` for the explicit capability contract, requirement status, and coverage mapping.

## Milestone Sequence

- [x] M028: Language Baseline Audit & Hardening — backend trust baseline established; serial recovery-proof has residual flake
- [ ] M029: Mesher & Reference-Backend Dogfood Completion — all three slices are complete, both dogfood apps pass slice-level formatter/build/import-shape gates, and the remaining milestone-wide proof outside S03 is the roadmap’s full `cargo test -p meshc --test e2e` rerun
- [ ] M030: Tooling & Package Trust — make fmt/LSP/tests/coverage/dependency flow credible for daily backend work
- [x] M031: Language DX Audit & Rough Edge Fixes — 3 compiler bugs fixed, multiline imports/trailing commas added, both dogfood codebases cleaned, 328 e2e tests

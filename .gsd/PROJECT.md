# Project

## What This Is

Mesh is a programming language and application platform repository focused on becoming a production-trustworthy general-purpose language with a lean toward server/backend code. It already contains the compiler, runtime, standard library, formatter, LSP, REPL, package tooling, registry, docs site, benchmarks, and dogfooded applications. The current priority is M030: making the tooling, package, and dependency trust story credible for daily backend work now that the dogfood cleanup and formatter-correctness work are closed.

## Core Value

Mesh should be something you can trust for a real production app backend in any capacity, starting with an honest API + DB + migrations + background jobs path that feels as easy to deploy as a Go binary.

## Current State

The repository ships a broad backend-oriented language platform:
- Rust workspace crates for lexing, parsing, type checking, code generation, runtime, formatter, LSP, REPL, package resolution, and CLI tooling
- native LLVM code generation to standalone binaries
- runtime support for actors, supervision, HTTP, WebSocket, JSON, database access, migrations, files, env, crypto, datetime, and collections
- package and registry infrastructure plus a docs/website surface
- dogfooded backend applications: `reference-backend/` (API + DB + jobs) and `mesher/` (error monitoring platform)

M028 established the backend trust baseline with recovery proof, deployment proof, tooling trust, and documentation. M031 completed the language DX audit: fixed three compiler bugs (trailing-closure disambiguation in control-flow conditions, else-if chain value correctness, multiline fn call type resolution), added parenthesized multiline imports and trailing-comma support, cleaned both dogfood codebases to idiomatic Mesh (125 `let _ =` removed, 15 `== true` removed, struct update syntax, else-if chains, interpolation), and expanded the e2e test suite to 328 tests covering all 12 pattern categories. M029 is complete: S01 fixed dotted-path and multiline-import formatter corruption, S02 closed the Mesher JSON/interpolation and pipe-style cleanup, S03 finished the multiline-import rollout and the last formatter/CLI truth-surface repairs (`pub type`/schema spacing, silent `fmt --check` success), and milestone closeout reran the formatter library/CLI proofs, both dogfood formatter/build gates, and the full `cargo test -p meshc --test e2e` baseline at 318 passed / 10 known pre-existing try-family failures. The current repo state is ready to move into M030’s tooling/package trust work rather than more dogfood cleanup.

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
- [x] M029: Mesher & Reference-Backend Dogfood Completion — formatter corruption fixed, Mesher cleanup finished, both dogfood apps formatter/build clean, full `meshc` e2e baseline rerun at 318 passed / 10 known pre-existing failures
- [ ] M030: Tooling & Package Trust — make fmt/LSP/tests/coverage/dependency flow credible for daily backend work
- [x] M031: Language DX Audit & Rough Edge Fixes — 3 compiler bugs fixed, multiline imports/trailing commas added, both dogfood codebases cleaned, 328 e2e tests

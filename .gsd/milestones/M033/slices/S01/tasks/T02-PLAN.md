---
estimated_steps: 4
estimated_files: 7
skills_used:
  - test
  - debug-like-expert
---

# T02: Move direct Mesher mutations onto the neutral write core

**Slice:** S01 — Neutral expression core on real write paths
**Milestone:** M033

## Description

Prove the new core on the simplest live Mesher write families before tackling conflict upserts. This task rewrites the direct mutation paths that currently use raw SQL for `NULL`, `now()`, or PG-only body parsing: API-key revoke, issue assign/unassign, alert acknowledge/resolve, and project settings updates. The route/service layer should stay behavior-compatible while the storage layer stops depending on raw SQL for these portable cases.

## Steps

1. Rewrite `revoke_api_key`, `assign_issue`, `acknowledge_alert`, `resolve_fired_alert`, and `update_project_settings` in `mesher/storage/queries.mpl` to use the new expression-aware Query/Repo surface.
2. Parse project settings JSON in Mesh-side helpers so partial updates use the neutral core instead of PG-side `jsonb` extraction, and keep the HTTP/service signatures in `mesher/api/settings.mpl`, `mesher/api/team.mpl`, `mesher/api/alerts.mpl`, `mesher/services/project.mpl`, and `mesher/ingestion/routes.mpl` stable.
3. Extend `compiler/meshc/tests/e2e_m033_s01.rs` with live Mesher route proofs that hit the real endpoints, then inspect database rows for `NULL`, timestamp, and field-value changes instead of trusting HTTP status alone.
4. Re-run the targeted live test filter plus Mesher build/fmt to catch any behavioral or formatting drift before handing off T03.

## Must-Haves

- [ ] The named direct-mutation functions stop calling `Repo.execute_raw` / `Repo.query_raw` for S01-owned portable cases
- [ ] Settings partial updates are driven by Mesh-side parsing plus neutral expressions, not PG-only body extraction
- [ ] Live Mesher tests assert DB-side field changes for `assigned_to`, `acknowledged_at`, `resolved_at`, `retention_days`, `sample_rate`, and `revoked_at`

## Verification

- `cargo test -p meshc --test e2e_m033_s01 mesher_mutations -- --nocapture`
- `cargo run -q -p meshc -- fmt --check mesher`
- `cargo run -q -p meshc -- build mesher`

## Observability Impact

- Signals added/changed: named `mesher_mutations` acceptance proofs for each direct write family plus direct row snapshots of `alerts`, `projects`, `api_keys`, and `issues`
- How a future agent inspects this: rerun the `mesher_mutations` filter in `compiler/meshc/tests/e2e_m033_s01.rs` and inspect the captured row assertions for the route that drifted
- Failure state exposed: when a route still uses raw SQL or mutates the wrong field, the harness reports the exact route/storage function and the mismatched DB columns

## Inputs

- `compiler/meshc/tests/e2e_m033_s01.rs` — contract-level S01 test target from T01
- `mesher/storage/queries.mpl` — current raw write implementations for revoke/unassign/ack/resolve/settings
- `mesher/api/alerts.mpl` — alert transition routes that must stay behavior-compatible
- `mesher/api/settings.mpl` — project settings route and current body handling
- `mesher/api/team.mpl` — API-key revoke route behavior
- `mesher/services/project.mpl` — project service wrapper for API-key revoke
- `mesher/ingestion/routes.mpl` — issue assign/unassign route behavior

## Expected Output

- `mesher/storage/queries.mpl` — neutral-expression rewrites for direct Mesher mutation functions
- `mesher/api/alerts.mpl` — route compatibility updates if needed for the new storage calls
- `mesher/api/settings.mpl` — Mesh-side settings parsing and unchanged response behavior
- `mesher/api/team.mpl` — API-key revoke route compatibility with the rewritten storage call
- `mesher/services/project.mpl` — service wrapper updates if the storage contract shifts
- `mesher/ingestion/routes.mpl` — assign/unassign route compatibility with `NULL`-capable expression updates
- `compiler/meshc/tests/e2e_m033_s01.rs` — live Mesher mutation proofs for direct write paths

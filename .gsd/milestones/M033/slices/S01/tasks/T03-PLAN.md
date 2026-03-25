---
estimated_steps: 4
estimated_files: 6
skills_used:
  - test
  - debug-like-expert
---

# T03: Rewrite issue upsert and close the slice with live Mesher acceptance

**Slice:** S01 — Neutral expression core on real write paths
**Milestone:** M033

## Description

Finish the slice on the hardest neutral-write family: `upsert_issue`. This task replaces the raw `INSERT ... ON CONFLICT` write with structured conflict-update expressions, then closes the slice with a serial live acceptance script that proves the whole S01 write bundle and locks the remaining raw write keep-list to PG-specific JSONB work only.

## Steps

1. Rewrite `upsert_issue` in `mesher/storage/queries.mpl` to use the neutral expression core for `event_count + 1`, `last_seen = now()`, and `CASE`-driven regression from `resolved` back to `unresolved`.
2. Extend `compiler/meshc/tests/e2e_m033_s01.rs` so the live Mesher harness ingests repeated events around a manual resolve and proves new-issue creation, regression-to-unresolved, `event_count` growth, and `last_seen` movement on the real runtime path.
3. Add `scripts/verify-m033-s01.sh` to run the S01 test target, keep Mesher fmt/build green, and assert that the remaining raw write keep-list is limited to PG-specific JSONB helpers such as `create_alert_rule`, `fire_alert`, and `insert_event`.
4. Re-run the targeted upsert filter and the closeout script until the slice demo is mechanically true from repo root.

## Must-Haves

- [ ] `upsert_issue` no longer depends on raw `INSERT ... ON CONFLICT` SQL
- [ ] Live acceptance proves the real issue regression path: ingest -> resolve -> ingest again results in `unresolved` plus incremented `event_count` and refreshed `last_seen`
- [ ] `scripts/verify-m033-s01.sh` makes the residual raw write keep-list explicit and excludes the S01-owned families

## Verification

- `cargo test -p meshc --test e2e_m033_s01 mesher_issue_upsert -- --nocapture`
- `bash scripts/verify-m033-s01.sh`

## Observability Impact

- Signals added/changed: serial slice-closeout script output, captured Mesher server logs, and DB snapshots for `issues` before/after resolve + reingest
- How a future agent inspects this: run `scripts/verify-m033-s01.sh` first, then inspect the failing `mesher_issue_upsert` test or the script’s keep-list/DB assertion that drifted
- Failure state exposed: the closeout path identifies whether the regression is in conflict-update SQL generation, route/runtime behavior, or an unexpected raw write still present in `mesher/storage/queries.mpl`

## Inputs

- `compiler/meshc/tests/e2e_m033_s01.rs` — existing S01 live Mesher harness from T01/T02
- `mesher/storage/queries.mpl` — current raw `upsert_issue` implementation and remaining raw-write keep-sites
- `mesher/services/event_processor.mpl` — live ingest path that depends on `upsert_issue`
- `mesher/ingestion/routes.mpl` — resolve route and ingest-side acceptance touchpoints
- `mesher/storage/writer.mpl` — PG-specific raw write keep-site that must remain explicit for S02
- `scripts/verify-m032-s01.sh` — reference style for a repo-root verification script with concrete failure output

## Expected Output

- `mesher/storage/queries.mpl` — structured conflict-update rewrite of `upsert_issue` plus an honest raw-write keep-list
- `mesher/services/event_processor.mpl` — compatibility updates if the upsert contract changes at the call site
- `mesher/ingestion/routes.mpl` — any route-side acceptance wiring needed for resolve/reingest proofs
- `mesher/storage/writer.mpl` — retained PG-specific keep-site wording that stays truthful after S01 cleanup
- `compiler/meshc/tests/e2e_m033_s01.rs` — live issue-upsert/regression acceptance proofs
- `scripts/verify-m033-s01.sh` — serial slice-closeout verification for S01

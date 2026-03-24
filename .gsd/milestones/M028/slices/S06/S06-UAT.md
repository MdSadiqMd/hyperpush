# S06 UAT — Honest Production Proof and Documentation

## Status
This UAT script is tailored to the **current** S06 state. Public proof/docs surfaces exist, but slice acceptance is **not complete** until the recovery proofs are green.

## Preconditions
- Worktree: `M028`
- Repo `.env` exists and exports a valid `DATABASE_URL`
- `cargo`, `npm`, `bash`, `curl`, `psql`, and `python3` are installed
- Run database-backed ignored proofs **serially**, not in parallel

## Test Case 1 — Landing page routes evaluators to the real proof surface
1. Open `README.md`.
2. Confirm there is an early **Production Backend Proof** section or link.
3. Confirm it points to:
   - `https://meshlang.dev/docs/production-backend-proof/`
   - `reference-backend/README.md`
4. Confirm README no longer contains `placeholder link` wording.

**Expected outcome**
- A fresh evaluator can find the production proof path directly from the repo landing page.
- README points to the real reference backend proof surfaces instead of relying on toy examples.

## Test Case 2 — Website docs expose one canonical production proof page
1. Open `website/docs/docs/production-backend-proof/index.md`.
2. Confirm it lists the named backend proof commands, including:
   - `cargo run -p meshc -- build reference-backend`
   - `cargo run -p meshc -- fmt --check reference-backend`
   - `cargo run -p meshc -- test reference-backend`
   - `cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_builds -- --nocapture`
   - `bash reference-backend/scripts/verify-production-proof-surface.sh`
3. Confirm `website/docs/.vitepress/config.mts` includes the page in navigation.

**Expected outcome**
- The website has exactly one canonical production proof page.
- The page points back to the real runbook and verifier rather than duplicating a second backend manual.

## Test Case 3 — Generic docs route back to the canonical proof surface
1. Open each of these files:
   - `website/docs/docs/getting-started/index.md`
   - `website/docs/docs/web/index.md`
   - `website/docs/docs/databases/index.md`
   - `website/docs/docs/concurrency/index.md`
   - `website/docs/docs/tooling/index.md`
   - `website/docs/docs/testing/index.md`
2. In each file, confirm there is a link to `/docs/production-backend-proof/`.
3. Confirm each callout references `reference-backend/README.md` as the deeper runbook.
4. In getting-started, confirm the stale install URL `mesh-lang.org/install.sh` is gone.

**Expected outcome**
- Generic docs teach their subsystem but route evaluators back to the canonical proof surface for readiness claims.
- No stale installer URL remains in getting-started.

## Test Case 4 — Mechanical doc-truth verifier passes
1. Run:
   ```bash
   bash reference-backend/scripts/verify-production-proof-surface.sh
   ```
2. Read the `[proof-docs]` phases.

**Expected outcome**
- The script exits 0.
- It confirms canonical files exist, generic docs link back correctly, sidebar/README point to the proof page, and stale phrases are absent.

## Test Case 5 — Website build still succeeds with the new proof page
1. Run:
   ```bash
   npm --prefix website ci
   npm --prefix website run build
   ```

**Expected outcome**
- Install and docs build both exit 0.
- The new proof page and cross-links do not break the site.

## Test Case 6 — Reference backend baseline remains green
1. Run:
   ```bash
   cargo run -p meshc -- build reference-backend
   cargo run -p meshc -- fmt --check reference-backend
   cargo run -p meshc -- test reference-backend
   cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_builds -- --nocapture
   ```

**Expected outcome**
- All four commands pass.
- S06 docs are anchored to a buildable/testable `reference-backend`, not a stale or broken package.

## Test Case 7 — Staged deploy proof still works
1. Load env:
   ```bash
   set -a && source .env && set +a
   ```
2. Run:
   ```bash
   cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_deploy_artifact_smoke -- --ignored --nocapture
   ```

**Expected outcome**
- The ignored deploy-artifact smoke proof passes.
- The staged bundle starts outside the repo root, applies deploy SQL, serves `/health`, creates a job, and processes it.

## Test Case 8 — Recovery visibility proof (current blocker)
1. Load env:
   ```bash
   set -a && source .env && set +a
   ```
2. Run:
   ```bash
   cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_worker_crash_recovers_job -- --ignored --nocapture
   ```

**Expected outcome for slice completion**
- The test should pass.
- During recovery, `/health` must expose a **degraded / recovering** state before returning to healthy.
- Final health should show the recovery fields consistently.

**Current observed result in this worktree**
- This test still fails.
- The worker eventually reaches healthy state with `restart_count=1` and `recovered_jobs=1`, but the harness never sees the degraded/recovering window.

## Test Case 9 — Restart visibility proof after Test Case 8 is fixed
1. Load env if needed.
2. Run:
   ```bash
   cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_worker_restart_is_visible_in_health -- --ignored --nocapture
   ```

**Expected outcome**
- The test passes.
- `/health` exposes restart/recovery metadata during and after worker restart.

## Test Case 10 — Whole-process restart recovery proof after Tests 8-9 are fixed
1. Load env if needed.
2. Run:
   ```bash
   cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_process_restart_recovers_inflight_job -- --ignored --nocapture
   ```

**Expected outcome**
- The process-restart proof exists and passes.
- An inflight job is not stranded across full backend restart.

## Edge Cases

### Edge Case A — Doc drift without backend drift
- If docs pass but Test Case 8 fails, S06 is still not done.
- The proof surface must remain honest about recovery trust.

### Edge Case B — Backend recovers too quickly for observability
- If recovery eventually succeeds but `/health` never exposes degraded/recovering state, treat that as a failure.
- S06 requires visible recovery truth, not hidden eventual correctness.

### Edge Case C — Shared test database interference
- If ignored DB-backed proofs are run in parallel on one `DATABASE_URL`, treat failures as invalid evidence and rerun serially.

## Acceptance rule
S06 can be marked complete only when:
- doc verifier passes,
- website build passes,
- reference-backend baseline commands pass,
- staged deploy smoke passes,
- worker crash recovery proof passes,
- worker restart visibility proof passes,
- whole-process restart proof exists and passes.

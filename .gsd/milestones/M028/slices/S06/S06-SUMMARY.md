# Slice Summary — S06: Honest Production Proof and Documentation

## Status
- **State:** partial / not done
- **Roadmap checkbox:** remains unchecked
- **Why:** the public proof surface was improved and most non-recovery gates are green again, but the authoritative crash/recovery proof is still red, so S06 cannot honestly close.

## What this slice actually delivered

### 1. Public proof surfaces are now real and discoverable
The slice did establish the repo/docs shape S06 wanted for honest promotion:
- `README.md` now links early to the production backend proof surface instead of leaving evaluators on toy-first examples.
- `website/docs/docs/production-backend-proof/index.md` exists as the canonical public proof page.
- `website/docs/.vitepress/config.mts` includes the proof page in the docs navigation.
- Generic docs were cross-linked back to the canonical proof surface instead of duplicating long backend runbooks:
  - `website/docs/docs/getting-started/index.md`
  - `website/docs/docs/web/index.md`
  - `website/docs/docs/databases/index.md`
  - `website/docs/docs/concurrency/index.md`
  - `website/docs/docs/tooling/index.md`
  - `website/docs/docs/testing/index.md`
- `reference-backend/scripts/verify-production-proof-surface.sh` now acts as a mechanical doc-truth guard for proof links and stale phrases.

### 2. The formatter blocker that was corrupting supervisor child specs was fixed
Task work repaired the `meshc fmt` child-spec regression in `compiler/mesh-fmt`, which had been corrupting `child ... do` supervisor blocks and blocking honest proof promotion. That unblocked:
- `cargo run -p meshc -- fmt --check reference-backend`
- formatting `reference-backend/jobs/worker.mpl` without parse-invalid output

### 3. The staged deploy proof is green again
During closer verification, the slice got the staged deploy artifact proof back to green:
- `cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_deploy_artifact_smoke -- --ignored --nocapture` passed

That means the artifact-first deploy story still holds for the reference backend even though the recovery gate is not done.

### 4. The remaining blocker is narrow and explicit
The current blocker is no longer “reference-backend is broadly broken.” It is now a specific recovery-contract mismatch:
- `e2e_reference_backend_worker_crash_recovers_job` fails because `/health` never exposes the expected **degraded / recovering** window before the worker returns to healthy.
- The latest failing evidence shows the worker eventually reaches a healthy state with `restart_count=1`, `recovered_jobs=1`, and a processed job, but the degraded transitional state is skipped too quickly for the harness contract.

That means S06 is blocked on **honest recovery visibility**, not on docs discoverability, deploy smoke, buildability, or formatter stability.

## Verification run by the closer

### Passing in this wrap-up window
- `cargo run -p meshc -- build reference-backend`
- `cargo run -p meshc -- fmt --check reference-backend`
- `cargo run -p meshc -- test reference-backend`
- `cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_builds -- --nocapture`
- `set -a && source .env && set +a && cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_deploy_artifact_smoke -- --ignored --nocapture`

### Previously verified by task work and still present on disk
- `bash reference-backend/scripts/verify-production-proof-surface.sh`
- `npm --prefix website ci`
- `npm --prefix website run build`

### Failing
- `set -a && source .env && set +a && cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_worker_crash_recovers_job -- --ignored --nocapture`

Failure shape:
- The harness fails at `wait_for_worker_recovery_health(...)` because it never observes the expected degraded state.
- Last observed health already shows recovery completed:
  - `status: "ok"`
  - `worker.liveness: "healthy"`
  - `restart_count: 1`
  - `recovered_jobs: 1`
  - `processed_jobs: 1`
  - `recovery_active: false`
- So the backend eventually recovers, but it does **not** currently satisfy the visibility contract that the proof expects.

### Not rerun after the prerequisite failure
- `e2e_reference_backend_worker_restart_is_visible_in_health`
- `e2e_reference_backend_process_restart_recovers_inflight_job`

These should stay blocked behind the crash-recovery proof until the degraded/recovering window is made observable.

## Requirement impact
- **R008:** still active. Discoverability/docs work landed, but S06 cannot honestly validate it while the promoted recovery proof remains red.
- **R009:** still active. The real reference backend remains the proof target, but the slice did not finish the end-to-end recovery proof contract.
- **R004:** still effectively the blocker feeding S06. Recovery exists in some form, but the proof surface is not yet trustworthy enough.

## Patterns established
- Keep one canonical truth hierarchy:
  - public map: `website/docs/docs/production-backend-proof/index.md`
  - deep operator runbook: `reference-backend/README.md`
  - mechanical doc guard: `reference-backend/scripts/verify-production-proof-surface.sh`
- Do not duplicate backend runbooks across generic docs; link back to the proof page and runbook instead.
- Treat the database-backed ignored proofs as serial-only against one `DATABASE_URL`.

## Precise resume point for the next unit
1. Start from the current failing proof, not from docs:
   - `set -a && source .env && set +a && cargo test -p meshc --test e2e_reference_backend e2e_reference_backend_worker_crash_recovers_job -- --ignored --nocapture`
2. Fix `reference-backend/jobs/worker.mpl` so `/health` exposes a real observable degraded/recovering interval before flipping back to healthy.
   - Current behavior recovers too eagerly and skips the proof-visible degraded phase.
3. Once that passes, rerun in order:
   - `e2e_reference_backend_worker_restart_is_visible_in_health`
   - implement/rerun `e2e_reference_backend_process_restart_recovers_inflight_job`
4. Only after all recovery proofs pass should S06 be marked complete.

## What the next slice / reassess-roadmap agent should know
S06 did not collapse. It narrowed the milestone’s remaining problem to one honest blocker:
- docs/discoverability/proof-page wiring exist,
- formatter and deploy-smoke are green,
- but the recovery contract still is not truthfully promotable.

If the roadmap is reassessed, the right interpretation is **not** “docs work failed.” The right interpretation is: Mesh now has the public proof surface S06 wanted, but the final recovery gate still belongs to the same reference-backend proof harness and must be finished before calling the milestone closed.

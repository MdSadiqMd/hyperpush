---
estimated_steps: 4
estimated_files: 7
skills_used:
  - github-workflows
  - gh
---

# T03: Capture the authoritative `first-green` hosted-evidence bundle and validate its manifest

Once the candidate-tag runs are actually green, the slice still is not done until the repo-owned wrapper preserves that truth under the reserved `first-green` label. This task performs the one final stop-after capture, reruns the contract tests if earlier tasks touched the wrapper, and validates the archived manifest and copied verifier artifacts so milestone closeout can rely on the bundle directly.

## Failure Modes

| Dependency | On error | On timeout | On malformed response |
|------------|----------|-----------|----------------------|
| `scripts/verify-m034-s06-remote-evidence.sh` | Fail closed and inspect the copied `phase-report.txt` / `remote-runs.json` instead of fabricating a green bundle. | Treat timeout as a verifier regression and preserve the partial archive staging logs if any exist. | Treat missing manifest fields, wrong `current-phase`, or missing workflow summaries as archive failure. |
| `.env` / authenticated hosted checks | Stop with the missing key names only; never echo secret values. | N/A | Treat auth or credential drift as a hard blocker because the final bundle must come from the canonical wrapper. |
| Hosted workflow state from T02 | Refuse to claim `first-green` if any required workflow is still red or tied to the wrong ref. | Keep the last saved T02 status snapshot and stop. | Treat incomplete `workflow-status.json` or green-but-stale runs as failure. |

## Load Profile

- **Shared resources**: one final stop-after S05 replay plus the archived evidence directory `.tmp/m034-s06/evidence/first-green/`.
- **Per-operation cost**: contract tests, one authenticated archive-helper run, and one manifest validation pass.
- **10x breakpoint**: repeated claims of the reserved label would destroy the first-green proof, so this task must run exactly once after T02 says the hosted runs are ready.

## Negative Tests

- **Malformed inputs**: reserved label already exists, missing `.env`, or incomplete T02 workflow snapshots.
- **Error paths**: wrapper exits non-zero, copied bundle lacks `remote-runs.json`, or any `remoteRunsSummary` entry stays red.
- **Boundary conditions**: `first-green` must end with `status.txt=ok`, `current-phase.txt=stopped-after-remote-evidence`, `s05ExitCode=0`, and every summarized workflow marked `ok`.

## Steps

1. Reconfirm that `.tmp/m034-s06/evidence/first-green/` is absent and that T02’s saved workflow snapshots are all green on the expected refs.
2. Run the repo-owned wrapper exactly once with `bash scripts/verify-m034-s06-remote-evidence.sh first-green` from the `.env`-loaded repo root, and rerun the Node contract tests if T01 changed the wrapper or its tests.
3. Validate the archived `status.txt`, `current-phase.txt`, `phase-report.txt`, `manifest.json`, and `remote-runs.json` so closeout can trust the bundle without another hosted query.
4. Leave the bundle in place as the single authoritative first-green archive; do not overwrite it with follow-up retries.

## Must-Haves

- [ ] The final archive uses the reserved `first-green` label exactly once.
- [ ] The wrapper remains the sole owner of the final hosted-evidence proof path.
- [ ] `manifest.json` and `remote-runs.json` both show all required workflows green.
- [ ] The task leaves a durable bundle that milestone validation can read without reconstructing hosted state.

## Inputs

- ``scripts/verify-m034-s06-remote-evidence.sh``
- ``scripts/tests/verify-m034-s05-contract.test.mjs``
- ``scripts/tests/verify-m034-s06-contract.test.mjs``
- ``.tmp/m034-s08/tag-rollout/workflow-status.json``

## Expected Output

- ``.tmp/m034-s06/evidence/first-green/manifest.json``
- ``.tmp/m034-s06/evidence/first-green/remote-runs.json``
- ``.tmp/m034-s06/evidence/first-green/phase-report.txt``
- ``.tmp/m034-s06/evidence/first-green/status.txt``

## Verification

node --test scripts/tests/verify-m034-s05-contract.test.mjs scripts/tests/verify-m034-s06-contract.test.mjs
bash -c 'set -euo pipefail; test -f .env; set -a; source .env; set +a; bash scripts/verify-m034-s06-remote-evidence.sh first-green'
python3 - <<'PY'
import json
from pathlib import Path
root = Path('.tmp/m034-s06/evidence/first-green')
assert (root / 'status.txt').read_text().strip() == 'ok'
assert (root / 'current-phase.txt').read_text().strip() == 'stopped-after-remote-evidence'
phase_report = (root / 'phase-report.txt').read_text()
for needle in ['candidate-tags\tpassed', 'remote-evidence\tpassed']:
    assert needle in phase_report, needle
manifest = json.loads((root / 'manifest.json').read_text())
assert manifest['s05ExitCode'] == 0
assert manifest['stopAfterPhase'] == 'remote-evidence'
for entry in manifest['remoteRunsSummary']:
    assert entry['status'] == 'ok', entry
PY

## Observability Impact

- Signals added/changed: the final `first-green` manifest and copied verifier artifacts become the milestone-closeout inspection surface.
- How a future agent inspects this: read `.tmp/m034-s06/evidence/first-green/{manifest.json,remote-runs.json,phase-report.txt,status.txt,current-phase.txt}`.
- Failure state exposed: any remaining red workflow, stop-after drift, or wrapper regression is visible in durable bundle files instead of implied by exit code alone.

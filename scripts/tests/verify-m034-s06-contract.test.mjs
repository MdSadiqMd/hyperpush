import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const scriptDir = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(scriptDir, "..", "..");
const helperPath = path.join(root, "scripts", "verify-m034-s06-remote-evidence.sh");
const s05VerifierPath = path.join(root, "scripts", "verify-m034-s05.sh");

function read(relativePath) {
  return fs.readFileSync(path.join(root, relativePath), "utf8");
}

function runHelper(label, env) {
  return spawnSync("bash", [helperPath, label], {
    cwd: root,
    env: { ...process.env, ...env },
    encoding: "utf8",
  });
}

function createStubHarness(t, { exitCode = 1, includeRemoteRuns = true, archiveLabel = "contract-red" } = {}) {
  const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), "verify-m034-s06-"));
  t.after(() => fs.rmSync(tmpRoot, { recursive: true, force: true }));

  const verifyRoot = path.join(tmpRoot, "m034-s05-verify");
  const evidenceRoot = path.join(tmpRoot, "m034-s06-evidence");
  const invokedMarker = path.join(tmpRoot, "stub-invoked.txt");
  const stubPath = path.join(tmpRoot, "stub-verify-m034-s05.sh");

  const remoteRunsBlock = includeRemoteRuns
    ? `cat >"$VERIFY_ROOT/remote-runs.json" <<'JSON'\n${JSON.stringify(
        {
          repository: "snowdamiz/mesh-lang",
          workflows: [
            {
              workflowFile: "deploy.yml",
              status: "failed",
              requiredHeadBranch: "main",
              failure: "deploy.yml hosted run is missing required steps",
              runSummary: {
                headBranch: "main",
                headSha: "5ddf3b2dce17abe08e1188d9b46e575d83525b50",
                url: "https://github.com/snowdamiz/mesh-lang/actions/runs/23506361663",
              },
            },
          ],
        },
        null,
        2,
      )}\nJSON`
    : "rm -f \"$VERIFY_ROOT/remote-runs.json\"";

  fs.writeFileSync(
    stubPath,
    `#!/usr/bin/env bash
set -euo pipefail

if [[ "\${VERIFY_M034_S05_STOP_AFTER:-}" != "remote-evidence" ]]; then
  echo "expected VERIFY_M034_S05_STOP_AFTER=remote-evidence" >&2
  exit 91
fi

VERIFY_ROOT="\${M034_S05_VERIFY_ROOT:?}"
mkdir -p "$VERIFY_ROOT"
printf 'stub invoked\n' >"${invokedMarker}"
printf 'remote-evidence\n' >"$VERIFY_ROOT/current-phase.txt"
printf 'failed\n' >"$VERIFY_ROOT/status.txt"
printf 'remote-evidence\n' >"$VERIFY_ROOT/failed-phase.txt"
cat >"$VERIFY_ROOT/phase-report.txt" <<'EOF'
prereq-sweep	started
prereq-sweep	passed
candidate-tags	started
candidate-tags	passed
remote-evidence	started
remote-evidence	failed
EOF
cat >"$VERIFY_ROOT/candidate-tags.json" <<'JSON'
${JSON.stringify(
  {
    meshcVersion: "0.1.0",
    meshpkgVersion: "0.1.0",
    extensionVersion: "0.3.0",
    binaryTag: "v0.1.0",
    extensionTag: "ext-v0.3.0",
  },
  null,
  2,
)}
JSON
${remoteRunsBlock}
printf 'display: gh run list\n' >"$VERIFY_ROOT/remote-deploy-list.log"
exit ${exitCode}
`,
    { mode: 0o755 },
  );

  return {
    archiveLabel,
    evidenceRoot,
    invokedMarker,
    stubPath,
    verifyRoot,
  };
}

test("verify-m034-s05 exposes an explicit stop-after remote-evidence boundary", () => {
  const script = read("scripts/verify-m034-s05.sh");
  assert.match(
    script,
    /usage: bash scripts\/verify-m034-s05\.sh \[--stop-after remote-evidence\]/,
    "S05 verifier should document the stop-after operator surface",
  );
  assert.match(
    script,
    /run_remote_evidence\nif should_stop_after_phase "remote-evidence"; then\n  complete_stop_after_phase "remote-evidence"\nfi\nrun_public_http_truth/,
    "S05 verifier must stop cleanly after remote-evidence before public-http",
  );
});

test("verify-m034-s05 derives reusable extension proof from the publish workflow surface", () => {
  const script = read("scripts/verify-m034-s05.sh");
  const proofWorkflow = read(".github/workflows/extension-release-proof.yml");
  const publishWorkflow = read(".github/workflows/publish-extension.yml");

  assert.match(proofWorkflow, /\non:\n  workflow_call:\n/, "extension proof workflow should stay workflow_call-only");
  assert.match(
    publishWorkflow,
    /uses: \.\/\.github\/workflows\/extension-release-proof\.yml/,
    "publish workflow should call the reusable extension proof workflow",
  );
  assert.match(
    script,
    /'workflowFile': 'extension-release-proof\.yml',\n\s+'queryWorkflowFile': 'publish-extension\.yml',\n\s+'requiredEvent': 'push',\n\s+'requiredHeadBranch': extension_tag,\n\s+'requiredJobs': \['Verify extension release proof'\],\n\s+'requiredJobSuccesses': \['Verify extension release proof'\],\n\s+'successFromJobsOnly': True,/,
    "S05 remote evidence should derive extension proof truth from the publish workflow caller run",
  );
  assert.match(
    script,
    /def job_name_matches\(actual_name, required_name\):[\s\S]*reusable_suffix = f' \/ \{required_name\}'/,
    "S05 verifier should tolerate reusable-workflow job name prefixes in gh run view output",
  );
});

test("remote-evidence helper archives a red hosted bundle and returns the verifier exit code", (t) => {
  const harness = createStubHarness(t, { exitCode: 1, includeRemoteRuns: true, archiveLabel: "contract-red" });
  const result = runHelper(harness.archiveLabel, {
    M034_S05_VERIFY_SCRIPT: harness.stubPath,
    M034_S05_VERIFY_ROOT: harness.verifyRoot,
    M034_S06_EVIDENCE_ROOT: harness.evidenceRoot,
  });

  assert.equal(result.status, 1, result.stderr || result.stdout);
  assert.ok(fs.existsSync(harness.invokedMarker), "wrapper should invoke the S05 verifier when the label is new");

  const archiveRoot = path.join(harness.evidenceRoot, harness.archiveLabel);
  assert.ok(fs.existsSync(path.join(archiveRoot, "remote-runs.json")), "red remote evidence should still be archived");
  assert.ok(fs.existsSync(path.join(archiveRoot, "candidate-tags.json")), "candidate tags should be archived");
  assert.ok(fs.existsSync(path.join(archiveRoot, "remote-deploy-list.log")), "remote logs should be archived");

  const manifest = JSON.parse(fs.readFileSync(path.join(archiveRoot, "manifest.json"), "utf8"));
  assert.equal(manifest.label, harness.archiveLabel);
  assert.equal(manifest.stopAfterPhase, "remote-evidence");
  assert.equal(manifest.s05ExitCode, 1);
  assert.equal(manifest.failedPhase, "remote-evidence");
  assert.equal(manifest.gitRefs.binaryTag, "v0.1.0");
  assert.equal(manifest.gitRefs.extensionTag, "ext-v0.3.0");
  assert.deepEqual(manifest.phaseReport.slice(-2), ["remote-evidence\tstarted", "remote-evidence\tfailed"]);
  assert.ok(
    manifest.artifacts.contents.includes("manifest.json") && manifest.artifacts.contents.includes("remote-runs.json"),
    "manifest should inventory the copied bundle contents",
  );
  assert.equal(manifest.remoteRunsSummary[0].workflowFile, "deploy.yml");
  assert.match(result.stdout, new RegExp(`archive: .*${harness.archiveLabel.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}`));
});

test("remote-evidence helper fails closed when required hosted artifacts are missing", (t) => {
  const harness = createStubHarness(t, { exitCode: 1, includeRemoteRuns: false, archiveLabel: "missing-remote-runs" });
  const result = runHelper(harness.archiveLabel, {
    M034_S05_VERIFY_SCRIPT: harness.stubPath,
    M034_S05_VERIFY_ROOT: harness.verifyRoot,
    M034_S06_EVIDENCE_ROOT: harness.evidenceRoot,
  });

  assert.notEqual(result.status, 0, "archive contract should fail when remote-runs.json is missing");
  assert.match(result.stderr, /missing remote runs artifact/);
  assert.ok(!fs.existsSync(path.join(harness.evidenceRoot, harness.archiveLabel)), "failed archive contracts must not leave a destination bundle behind");
});

test("remote-evidence helper refuses to overwrite an existing label directory", (t) => {
  const harness = createStubHarness(t, { exitCode: 0, includeRemoteRuns: true, archiveLabel: "preexisting-label" });
  const existingArchiveRoot = path.join(harness.evidenceRoot, harness.archiveLabel);
  fs.mkdirSync(existingArchiveRoot, { recursive: true });

  const result = runHelper(harness.archiveLabel, {
    M034_S05_VERIFY_SCRIPT: harness.stubPath,
    M034_S05_VERIFY_ROOT: harness.verifyRoot,
    M034_S06_EVIDENCE_ROOT: harness.evidenceRoot,
  });

  assert.notEqual(result.status, 0, "existing label directories must fail closed");
  assert.match(result.stderr, /archive label already exists/);
  assert.ok(!fs.existsSync(harness.invokedMarker), "overwrite refusal should happen before the S05 verifier runs");
});

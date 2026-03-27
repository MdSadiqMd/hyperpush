---
verdict: needs-remediation
remediation_round: 0
---

# Milestone Validation: M034

## Success Criteria Checklist
# Success Criteria Checklist

- [x] **Real registry publish/install proof is live and reproducible.** S01 delivered and replayed the canonical real-registry verifier (`bash scripts/verify-m034-s01.sh`), and the slice summary/UAT plus R007 validation show publish → metadata/search/detail → download checksum → install → `mesh.lock` truth → consumer build/run → duplicate-publish rejection all passed on the public registry path.
- [ ] **Authoritative CI/release verification reruns the real proof surfaces on hosted GitHub events.** S02 delivered the reusable workflow, caller lane, release gating, and local contract verifier, but its own summary/UAT record that GitHub still has no hosted evidence because the new workflows are not yet on the remote default branch (`gh run list --workflow authoritative-verification.yml --limit 1` still returns 404). The planned hosted proof lane is structurally present locally, but not yet proven in the real environment.
- [ ] **Released `meshc` and `meshpkg` assets are proven installable/runnable through the documented public installer path.** S03 delivered canonical installers, mirrored repo copies, local staged installer verifiers, release-asset gating, and docs updates. However, the first hosted `verify-release-assets` run is still pending, and S05 later confirms the deployed `meshlang.dev/install.sh` / `install.ps1` surfaces are still stale relative to the repo contract.
- [ ] **The VS Code extension release lane is proven fail-closed on the real publish path.** S04 delivered deterministic VSIX packaging, a canonical extension verifier, reusable proof/publish workflows, and local contract verification. But the first live `extension-release-proof` / `publish-extension` hosted runs with real marketplace credentials are still pending, so the planned public-path proof remains incomplete.
- [ ] **One release candidate is proven end to end across binaries, installer, docs deploy, registry/packages-site health, and extension release checks.** S05 delivered the canonical assembly verifier and local workflow/docs contract checks, but the actual assembled replay is not green: `bash scripts/verify-m034-s05.sh` currently fails closed at `remote-evidence`, and direct public-surface checks still show stale `meshlang.dev` installers and docs pages.


## Slice Delivery Audit
# Slice Delivery Audit

| Slice | Planned deliverable / demo claim | Delivered evidence | Audit |
|---|---|---|---|
| S01 | Real registry publish/install proof on the real public path | S01 summary + UAT + R007 validation show the canonical verifier passed live and preserved per-phase artifacts under `.tmp/m034-s01/verify/<version>/`. | **Pass** |
| S02 | PR and release verification rerun the real Mesh proof surfaces instead of stopping at builds | Local workflow artifacts are present (`authoritative-live-proof.yml`, `authoritative-verification.yml`, `release.yml`, `scripts/verify-m034-s02-workflows.sh`) and the local contract verifier passes. But the hosted same-repo PR/push/manual/tag proof run is still missing. | **Partial — local contract delivered, hosted rollout evidence missing** |
| S03 | Released binaries are proven installable/runnable through the documented installer path | Local staged installer truth is strong (`scripts/verify-m034-s03.sh`, mirrored installers, release gating, docs updates), but the first hosted `verify-release-assets` runner proof and matching deployed public installer content are still absent. | **Partial — local installer proof delivered, public/hosted proof incomplete** |
| S04 | Extension publish lane validates the packaged extension and prerequisites before publication | Deterministic VSIX pathing, archive audit, shared `e2e_lsp` prerequisite, reusable proof workflow, thin publish workflow, and local workflow contract verification are all delivered. The hosted tag/publish evidence is still pending. | **Partial — fail-closed local lane delivered, hosted publish proof still missing** |
| S05 | One release candidate is proven across binaries, installer, docs deploy, registry/packages-site health, and extension checks as a single public-ready flow | The canonical assembly verifier exists and composes S01–S04 honestly, but the first full replay is not green. It stops at `remote-evidence`, and public installer/docs freshness is still red. | **Fail — final planned public-ready replay not yet delivered** |


## Cross-Slice Integration
# Cross-Slice Integration

## Boundaries that align

- **S01 → S02 / S05:** S01's canonical live package verifier is reused directly instead of being reimplemented in YAML. S02's reusable workflow and S05's assembly verifier both consume the same S01 proof surface.
- **S02 → S03 / S04 / S05:** The reusable-workflow + local-contract-verifier pattern from S02 is clearly consumed by S03 release gating, S04 extension proof/publish gating, and S05 deploy/workflow verification.
- **S03 + S04 → S05:** S05 composes the existing installer and extension proof surfaces rather than inventing new parallel checks, which is the right integration shape.
- **S01 public package surfaces remain healthy:** S05's independent checks still find the packages-site detail/search pages and registry scoped-search API returning the exact S01 proof package identity and description.

## Boundary mismatches still open

- **Hosted workflow rollout boundary is still open.** S02/S03/S04 all delivered local workflow contracts, but S05's `remote-evidence` phase shows the remote default branch / candidate-tag workflow history has not yet consumed those changes. That breaks the intended end-to-end chain from local proof ownership to hosted release confidence.
- **Public docs/installers deployment boundary is still open.** S03/S05 aligned repo-local installer/docs truth, but S05's direct public checks still find stale `meshlang.dev/install.sh`, `meshlang.dev/install.ps1`, and stale getting-started/tooling pages. The repo contract and deployed public contract are not yet reconciled.

## Integration assessment

Local composition is coherent and the slice boundaries match the planned architecture. The milestone is blocked not by missing local seams, but by incomplete rollout across hosted workflows and stale deployed public surfaces.


## Requirement Coverage
# Requirement Coverage

- **R007** is fully addressed and validated by S01, then reused by S02 and S05 as the authoritative package-manager proof surface.
- No other active requirement rows in `.gsd/REQUIREMENTS.md` are currently owned by M034.
- M034 context references broader release-confidence requirements (`R021`, `R045`, `R046`, `R047`), but only `R021` exists in `.gsd/REQUIREMENTS.md`, where it remains deferred; `R045`/`R046`/`R047` are not formalized there. That is a traceability gap, but it is not the direct completion blocker.

## Coverage assessment

Formal requirement coverage does not block milestone completion here; the direct blocker is that the planned public-release proof is still missing hosted/public execution evidence. Requirement traceability for the broader release-confidence work should be cleaned up later, but the immediate remediation work is rollout and redeploy.


## Verdict Rationale
M034 cannot be completed yet because the milestone's final public-release-confidence claim is still unproven in the real hosted/public environment.

**Verification class assessment:**

- **Contract:** Strongly addressed. Every slice established named repo-local verifiers and mechanical contract checks (`scripts/verify-m034-s01.sh`, `verify-m034-s02-workflows.sh`, `verify-m034-s03.sh`, `verify-m034-s04-extension.sh`, `verify-m034-s04-workflows.sh`, `verify-m034-s05.sh`, `verify-m034-s05-workflows.sh`). This tier is green.
- **Integration:** Partially addressed. The real `meshpkg` ↔ registry contract is proven, installer and extension proof surfaces are composed into S05, and packages-site/registry search truth is still healthy. But the full assembled release path is not yet proven because hosted workflow rollout and public docs/installers are not current.
- **Operational:** **Not yet proven, and this is material.** The plan explicitly called for tag/release promotion behavior, deploy health, installer/use-after-install smoke, and external publication-path readiness on the real path. The evidence across S02–S05 still shows missing hosted candidate-tag runs, missing hosted release-smoke / extension-proof runs, and stale public `meshlang.dev` installers/docs. This is the main reason the milestone needs remediation rather than attention-only.
- **UAT:** Addressed honestly. Each slice has a UAT that matches the current truth, including explicit current expected failures for remote rollout/public freshness in S05. The UATs are good gate documentation, but they also confirm the milestone is not yet ready to seal.

Because the final S05 acceptance replay is still red and planned operational verification remains unproven on the real public path, the correct verdict is **needs-remediation** rather than pass or needs-attention.

## Remediation Plan
# Remediation Plan

1. **Add a hosted-rollout remediation slice.** Push the new workflow graph to the remote default branch and capture first green hosted evidence for the candidate tags/workflows that S05 expects: `authoritative-verification.yml`, `release.yml` / `verify-release-assets`, `deploy.yml`, `deploy-services.yml`, `extension-release-proof.yml`, and `publish-extension.yml` for `v0.1.0` / `ext-v0.3.0`.
2. **Add a public-freshness remediation slice.** Redeploy `meshlang.dev` so `install.sh`, `install.ps1`, getting-started, and tooling pages match the repo-local contract that S03/S05 now verify.
3. **Rerun the canonical assembly verifier.** After hosted rollout and redeploy, rerun `set -a && source .env && set +a && bash scripts/verify-m034-s05.sh` and require `remote-evidence`, `public-http`, and `s01-live-proof` to pass with `.tmp/m034-s05/verify/status.txt = ok` before milestone completion.
4. **Preserve the first all-green artifact bundle.** Keep the first successful `.tmp/m034-s05/verify/` evidence set as the closeout proof bundle for milestone completion.


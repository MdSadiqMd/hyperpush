mod support;

use std::path::{Path, PathBuf};
use support::m046_route_free as route_free;

const MIGRATION_GUIDANCE: &str = "If you are migrating older clustered code, move `clustered(work)` into source-first `@cluster`, delete any `[cluster]` manifest stanza, and rename helper-shaped entries such as `execute_declared_work(...)` / `Work.execute_declared_work` to ordinary verbs like `add()` or `sync_todos()`.";
const TODO_WRAPPER_GUIDANCE: &str = "Keep the route-free `@cluster` surfaces canonical: the Todo starter only dogfoods explicit-count `HTTP.clustered(1, ...)` on `GET /todos` and `GET /todos/:id`, while `GET /health` and mutating routes stay local.";
const S07_RAIL_GUIDANCE: &str = "Default-count and two-node clustered-route behavior stay on the repo S07 rail (`cargo test -p meshc --test e2e_m047_s07 -- --nocapture`).";
const STALE_CLUSTERED_NON_GOAL: &str = "`HTTP.clustered(...)` is still not shipped.";
const CUTOVER_RAIL: &str = "`bash scripts/verify-m047-s04.sh` — the authoritative cutover rail for the source-first route-free clustered contract";
const TODO_SUBRAIL: &str = "`bash scripts/verify-m047-s05.sh` — the lower-level Todo/runtime subrail that proves the fuller starter natively and inside Docker";
const CLOSEOUT_RAIL: &str = "`bash scripts/verify-m047-s06.sh` — the final closeout rail that wraps S05, rebuilds docs truth, and owns the assembled `.tmp/m047-s06/verify` bundle";
const S07_RAIL_COMMAND: &str = "`cargo test -p meshc --test e2e_m047_s07 -- --nocapture`";

struct ContractSources {
    readme: String,
    tooling: String,
    clustered_example: String,
    distributed_proof: String,
    distributed: String,
    verifier: String,
}

fn repo_root() -> PathBuf {
    route_free::repo_root()
}

fn artifact_dir(test_name: &str) -> PathBuf {
    route_free::artifact_dir("m047-s06", test_name)
}

fn assert_contains(path_label: &str, source: &str, needle: &str) {
    assert!(
        source.contains(needle),
        "expected {path_label} to contain {needle:?}, got:\n{source}"
    );
}

fn assert_omits(path_label: &str, source: &str, needle: &str) {
    assert!(
        !source.contains(needle),
        "expected {path_label} to omit {needle:?}, got:\n{source}"
    );
}

fn assert_contains_all(path_label: &str, source: &str, needles: &[&str]) {
    for needle in needles {
        assert_contains(path_label, source, needle);
    }
}

fn load_contract_sources(artifacts: &Path) -> ContractSources {
    let contract_artifacts = artifacts.join("contract");
    ContractSources {
        readme: route_free::read_and_archive(
            &repo_root().join("README.md"),
            &contract_artifacts.join("README.md"),
        ),
        tooling: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/tooling/index.md"),
            &contract_artifacts.join("tooling.index.md"),
        ),
        clustered_example: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/getting-started/clustered-example/index.md"),
            &contract_artifacts.join("clustered-example.index.md"),
        ),
        distributed_proof: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/distributed-proof/index.md"),
            &contract_artifacts.join("distributed-proof.index.md"),
        ),
        distributed: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/distributed/index.md"),
            &contract_artifacts.join("distributed.index.md"),
        ),
        verifier: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m047-s06.sh"),
            &contract_artifacts.join("verify-m047-s06.sh"),
        ),
    }
}

#[test]
fn m047_s06_public_docs_layer_route_free_surfaces_and_todo_starter() {
    let artifacts = artifact_dir("docs-authority-contract");
    let sources = load_contract_sources(&artifacts);

    for (path_label, source) in [
        ("README.md", &sources.readme),
        ("website/docs/docs/tooling/index.md", &sources.tooling),
        (
            "website/docs/docs/getting-started/clustered-example/index.md",
            &sources.clustered_example,
        ),
        (
            "website/docs/docs/distributed-proof/index.md",
            &sources.distributed_proof,
        ),
        (
            "website/docs/docs/distributed/index.md",
            &sources.distributed,
        ),
    ] {
        assert_contains(path_label, source, "meshc init --template todo-api");
        assert_contains(path_label, source, MIGRATION_GUIDANCE);
        assert_contains(path_label, source, TODO_WRAPPER_GUIDANCE);
        assert_contains(path_label, source, S07_RAIL_GUIDANCE);
        assert_contains(path_label, source, "sync_todos()");
        assert_omits(path_label, source, STALE_CLUSTERED_NON_GOAL);
    }

    assert_contains(
        "README.md",
        &sources.readme,
        "meshc init --clustered hello_cluster",
    );
    assert_contains(
        "README.md",
        &sources.readme,
        "The Todo template is the fuller starter layered on top of that same contract, not a replacement for the route-free public surfaces.",
    );
    assert_contains(
        "website/docs/docs/tooling/index.md",
        &sources.tooling,
        "Treat it as the fuller starter layered above the same route-free clustered contract, not as a replacement for the canonical route-free public surfaces.",
    );
    assert_contains(
        "website/docs/docs/getting-started/clustered-example/index.md",
        &sources.clustered_example,
        "When you want a fuller starter without changing that contract, use `meshc init --template todo-api`.",
    );
    assert_contains(
        "website/docs/docs/getting-started/clustered-example/index.md",
        &sources.clustered_example,
        "@cluster pub fn add() -> Int do",
    );
    assert_contains(
        "website/docs/docs/distributed-proof/index.md",
        &sources.distributed_proof,
        "Mesh exposes one clustered-work story through two layers:",
    );
    assert_omits(
        "website/docs/docs/distributed-proof/index.md",
        &sources.distributed_proof,
        "package-authored claims that `HTTP.clustered(...)` already ships",
    );
    assert_contains(
        "website/docs/docs/distributed/index.md",
        &sources.distributed,
        "for the three canonical route-free surfaces, then layer on `meshc init --template todo-api` when you want the fuller starter without changing that source-first `@cluster` contract.",
    );
}

#[test]
fn m047_s06_docs_layer_s04_s05_s06_and_s07_truthfully() {
    let artifacts = artifact_dir("rail-layering-contract");
    let sources = load_contract_sources(&artifacts);

    for (path_label, source) in [
        ("README.md", &sources.readme),
        (
            "website/docs/docs/distributed-proof/index.md",
            &sources.distributed_proof,
        ),
    ] {
        assert_contains_all(
            path_label,
            source,
            &[CUTOVER_RAIL, TODO_SUBRAIL, CLOSEOUT_RAIL, S07_RAIL_COMMAND],
        );
    }

    for (path_label, source) in [
        ("website/docs/docs/tooling/index.md", &sources.tooling),
        (
            "website/docs/docs/getting-started/clustered-example/index.md",
            &sources.clustered_example,
        ),
        (
            "website/docs/docs/distributed/index.md",
            &sources.distributed,
        ),
    ] {
        assert_contains(path_label, source, "bash scripts/verify-m047-s04.sh");
        assert_contains(
            path_label,
            source,
            "the authoritative cutover rail for the source-first route-free clustered contract",
        );
        assert_contains(
            path_label,
            source,
            "the lower-level Todo/runtime subrail that proves the fuller starter natively and inside Docker",
        );
        assert_contains(
            path_label,
            source,
            "the final closeout rail that wraps S05, rebuilds docs truth, and owns the assembled `.tmp/m047-s06/verify` bundle",
        );
        assert_contains(path_label, source, "bash scripts/verify-m047-s05.sh");
        assert_contains(path_label, source, "bash scripts/verify-m047-s06.sh");
        assert_contains(path_label, source, "cargo test -p meshc --test e2e_m047_s07 -- --nocapture");
    }
}

#[test]
fn m047_s06_verifier_contract_wraps_s05_and_owns_retained_bundle() {
    let artifacts = artifact_dir("verifier-contract");
    let sources = load_contract_sources(&artifacts);
    let verifier = &sources.verifier;

    assert_contains_all(
        "scripts/verify-m047-s06.sh",
        verifier,
        &[
            "ARTIFACT_ROOT=\".tmp/m047-s06\"",
            "RETAINED_M047_S05_VERIFY_DIR=\"$ARTIFACT_DIR/retained-m047-s05-verify\"",
            "RETAINED_M047_S05_BUNDLE_POINTER_PATH=\"$ARTIFACT_DIR/retained-m047-s05-latest-proof-bundle.txt\"",
            "RETAINED_M047_S06_ARTIFACTS_DIR=\"$ARTIFACT_DIR/retained-m047-s06-artifacts\"",
            "RETAINED_PROOF_BUNDLE_DIR=\"$ARTIFACT_DIR/retained-proof-bundle\"",
            "bash scripts/verify-m047-s05.sh",
            "cargo test -p meshc --test e2e_m047_s06 m047_s06_ -- --nocapture",
            "npm --prefix website run build",
            "assert_file_omits_regex",
            "e2e_m047_s07",
            "HTTP\\.clustered\\(1, \\.\\.\\.\\)",
            "GET /health",
            "mutating routes stay local",
            "HTTP\\.clustered\\(\\.\\.\\.\\) is still not shipped",
            "HTTP\\.clustered\\(\\.\\.\\.\\).*already ships",
            "status.txt",
            "current-phase.txt",
            "phase-report.txt",
            "full-contract.log",
            "latest-proof-bundle.txt",
            "retained-m047-s05-verify",
            "retained-m047-s05-latest-proof-bundle.txt",
            "retained-m047-s06-artifacts",
            "retained-proof-bundle",
            "contract-guards",
            "m047-s05-replay",
            "retain-m047-s05-verify",
            "m047-s06-e2e",
            "m047-s06-docs-build",
            "m047-s06-artifacts",
            "m047-s06-bundle-shape",
            "verify-m047-s06: ok",
        ],
    );

    for delegated_phase in [
        "m047-s04-replay",
        "retain-m047-s04-verify",
        "m047-s05-pkg",
        "m047-s05-tooling",
        "m047-s05-e2e",
        "m047-s05-docs-build",
        "retain-m047-s05-artifacts",
        "m047-s05-bundle-shape",
    ] {
        assert_contains("scripts/verify-m047-s06.sh", verifier, delegated_phase);
    }

    assert_omits(
        "scripts/verify-m047-s06.sh",
        verifier,
        "ARTIFACT_ROOT=\".tmp/m047-s05\"",
    );
    assert_omits(
        "scripts/verify-m047-s06.sh",
        verifier,
        "bash scripts/verify-m047-s04.sh",
    );
    assert_omits(
        "scripts/verify-m047-s06.sh",
        verifier,
        "cargo test -p meshc --test e2e_m047_s05 -- --nocapture",
    );
    assert_omits(
        "scripts/verify-m047-s06.sh",
        verifier,
        "the explicit HTTP.clustered(...) non-goal",
    );
    assert_omits(
        "scripts/verify-m047-s06.sh",
        verifier,
        "HTTP\\.clustered\\(\\.\\.\\.\\).*not shipped",
    );
}

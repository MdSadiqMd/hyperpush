mod support;

use serde_json::json;
use std::path::{Path, PathBuf};
use support::m046_route_free as route_free;

struct ContractSources {
    verify_script: String,
    verify_m045_s04: String,
    verify_m045_s05: String,
    verify_m046_s04: String,
    verify_m046_s05: String,
    verify_m046_s06: String,
    readme: String,
    distributed_proof: String,
    distributed: String,
    tooling: String,
    clustered_example: String,
    tiny_cluster_readme: String,
    cluster_proof_readme: String,
}

fn repo_root() -> PathBuf {
    route_free::repo_root()
}

fn artifact_dir(test_name: &str) -> PathBuf {
    route_free::artifact_dir("m047-s04", test_name)
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

fn assert_omits_all(path_label: &str, source: &str, needles: &[&str]) {
    for needle in needles {
        assert_omits(path_label, source, needle);
    }
}

fn assert_clustered_surface_omits_routeful_drift(path_label: &str, source: &str) {
    assert_omits_all(
        path_label,
        source,
        &[
            "Continuity.submit_declared_work",
            "/work/:request_key",
            "Timer.sleep(5000)",
        ],
    );
}

fn load_contract_sources(artifacts: &Path) -> ContractSources {
    let contract_artifacts = artifacts.join("contract");
    ContractSources {
        verify_script: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m047-s04.sh"),
            &contract_artifacts.join("verify-m047-s04.sh"),
        ),
        verify_m045_s04: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m045-s04.sh"),
            &contract_artifacts.join("verify-m045-s04.sh"),
        ),
        verify_m045_s05: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m045-s05.sh"),
            &contract_artifacts.join("verify-m045-s05.sh"),
        ),
        verify_m046_s04: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m046-s04.sh"),
            &contract_artifacts.join("verify-m046-s04.sh"),
        ),
        verify_m046_s05: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m046-s05.sh"),
            &contract_artifacts.join("verify-m046-s05.sh"),
        ),
        verify_m046_s06: route_free::read_and_archive(
            &repo_root().join("scripts/verify-m046-s06.sh"),
            &contract_artifacts.join("verify-m046-s06.sh"),
        ),
        readme: route_free::read_and_archive(
            &repo_root().join("README.md"),
            &contract_artifacts.join("README.md"),
        ),
        distributed_proof: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/distributed-proof/index.md"),
            &contract_artifacts.join("distributed-proof.index.md"),
        ),
        distributed: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/distributed/index.md"),
            &contract_artifacts.join("distributed.index.md"),
        ),
        tooling: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/tooling/index.md"),
            &contract_artifacts.join("tooling.index.md"),
        ),
        clustered_example: route_free::read_and_archive(
            &repo_root().join("website/docs/docs/getting-started/clustered-example/index.md"),
            &contract_artifacts.join("clustered-example.index.md"),
        ),
        tiny_cluster_readme: route_free::read_and_archive(
            &repo_root().join("tiny-cluster/README.md"),
            &contract_artifacts.join("tiny-cluster.README.md"),
        ),
        cluster_proof_readme: route_free::read_and_archive(
            &repo_root().join("cluster-proof/README.md"),
            &contract_artifacts.join("cluster-proof.README.md"),
        ),
    }
}

#[test]
fn m047_s04_authoritative_cutover_rail_replays_source_first_contract_and_snapshots_the_graph() {
    let artifacts = artifact_dir("cutover-verifier-contract");
    let sources = load_contract_sources(&artifacts);

    route_free::write_json_artifact(
        &artifacts.join("scenario-meta.json"),
        &json!({
            "authoritative_verifier": "scripts/verify-m047-s04.sh",
            "historical_wrapper_aliases": [
                "scripts/verify-m046-s06.sh",
                "scripts/verify-m046-s05.sh",
                "scripts/verify-m046-s04.sh",
                "scripts/verify-m045-s05.sh",
                "scripts/verify-m045-s04.sh"
            ],
            "public_surfaces": [
                "README.md",
                "website/docs/docs/distributed-proof/index.md",
                "website/docs/docs/distributed/index.md",
                "website/docs/docs/tooling/index.md",
                "website/docs/docs/getting-started/clustered-example/index.md",
                "tiny-cluster/README.md",
                "cluster-proof/README.md"
            ]
        }),
    );

    assert_contains_all(
        "scripts/verify-m047-s04.sh",
        &sources.verify_script,
        &[
            "cargo test -p mesh-parser m047_s04 -- --nocapture",
            "cargo test -p mesh-pkg m047_s04 -- --nocapture",
            "cargo test -p meshc --test e2e_m047_s01 -- --nocapture",
            "cargo test -p mesh-pkg scaffold_clustered_project_writes_public_cluster_contract -- --nocapture",
            "cargo test -p meshc --test tooling_e2e test_init_clustered_creates_project -- --nocapture",
            "cargo run -q -p meshc -- test tiny-cluster/tests",
            "cargo run -q -p meshc -- build tiny-cluster",
            "cargo run -q -p meshc -- test cluster-proof/tests",
            "cargo run -q -p meshc -- build cluster-proof",
            "npm --prefix website run build",
            "cargo test -p meshc --test e2e_m047_s04 -- --nocapture",
            "status.txt",
            "current-phase.txt",
            "phase-report.txt",
            "full-contract.log",
            "latest-proof-bundle.txt",
            "retained-m047-s04-artifacts",
            "m047-s04-parser",
            "m047-s04-pkg",
            "m047-s04-compiler",
            "m047-s04-scaffold-unit",
            "m047-s04-scaffold-smoke",
            "m047-s04-tiny-cluster-tests",
            "m047-s04-tiny-cluster-build",
            "m047-s04-cluster-proof-tests",
            "m047-s04-cluster-proof-build",
            "m047-s04-docs-build",
            "m047-s04-e2e",
            "m047-s04-artifacts",
            "m047-s04-bundle-shape",
        ],
    );

    for (path_label, source) in [
        ("scripts/verify-m045-s04.sh", &sources.verify_m045_s04),
        ("scripts/verify-m045-s05.sh", &sources.verify_m045_s05),
        ("scripts/verify-m046-s04.sh", &sources.verify_m046_s04),
        ("scripts/verify-m046-s05.sh", &sources.verify_m046_s05),
        ("scripts/verify-m046-s06.sh", &sources.verify_m046_s06),
    ] {
        assert_contains_all(
            path_label,
            source,
            &[
                "bash scripts/verify-m047-s04.sh",
                "retained-m047-s04-verify",
                "latest-proof-bundle.txt",
                "phase-report.txt",
                "status.txt",
                "current-phase.txt",
                "full-contract.log",
                "m047-s04-replay",
                "retain-m047-s04-verify",
            ],
        );
    }
}

#[test]
fn m047_s04_public_docs_repoint_to_the_new_cutover_rail() {
    let artifacts = artifact_dir("cutover-docs-contract");
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
            &[
                "`bash scripts/verify-m047-s04.sh` — the authoritative cutover rail for the source-first route-free clustered contract",
                "`bash scripts/verify-m046-s06.sh` — the historical M046 closeout wrapper retained as a compatibility alias into the M047 cutover rail",
                "`bash scripts/verify-m046-s05.sh` — the historical M046 equal-surface wrapper retained as a compatibility alias into the M047 cutover rail",
                "`bash scripts/verify-m045-s05.sh` — the historical M045 closeout wrapper retained as a compatibility alias into the M047 cutover rail",
            ],
        );
        assert_omits_all(
            path_label,
            source,
            &[
                "`bash scripts/verify-m046-s06.sh` — the authoritative assembled closeout rail",
                "`bash scripts/verify-m046-s05.sh` — the lower-level equal-surface subrail",
                "`bash scripts/verify-m045-s05.sh` — the historical wrapper name retained for replay and transition into the S06 closeout rail",
            ],
        );
        assert_clustered_surface_omits_routeful_drift(path_label, source);
    }
}

#[test]
fn m047_s04_clustered_runbooks_treat_m046_and_m045_as_aliases_not_authority() {
    let artifacts = artifact_dir("cutover-runbook-contract");
    let sources = load_contract_sources(&artifacts);

    for (path_label, source) in [
        (
            "website/docs/docs/distributed/index.md",
            &sources.distributed,
        ),
        ("website/docs/docs/tooling/index.md", &sources.tooling),
        (
            "website/docs/docs/getting-started/clustered-example/index.md",
            &sources.clustered_example,
        ),
        ("tiny-cluster/README.md", &sources.tiny_cluster_readme),
        ("cluster-proof/README.md", &sources.cluster_proof_readme),
    ] {
        assert_contains(path_label, source, "bash scripts/verify-m047-s04.sh");
        assert_contains(path_label, source, "bash scripts/verify-m046-s06.sh");
        assert_contains(path_label, source, "bash scripts/verify-m046-s05.sh");
        assert_contains(path_label, source, "bash scripts/verify-m045-s05.sh");
        assert_omits_all(
            path_label,
            source,
            &[
                "The authoritative assembled closeout rail is `bash scripts/verify-m046-s06.sh`",
                "the authoritative repo-wide closeout rail is `bash scripts/verify-m046-s06.sh`",
                "For the repo-wide closeout story, `bash scripts/verify-m046-s06.sh` is the authoritative assembled closeout rail",
            ],
        );
        assert_clustered_surface_omits_routeful_drift(path_label, source);
    }
}

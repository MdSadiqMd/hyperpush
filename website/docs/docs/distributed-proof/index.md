---
title: Distributed Proof
description: Public proof map for the route-free clustered-work canonical surfaces plus the fuller Todo starter, with M047 S04 retained as the cutover rail, M047 S05 as the Todo/runtime subrail, M047 S06 as the final closeout wrapper, and the repo S07 rail covering default-count/two-node clustered routes.
---

# Distributed Proof

Mesh exposes one clustered-work story through two layers:

- three equal canonical route-free surfaces:
  - [Clustered Example](/docs/getting-started/clustered-example/) for the public scaffold-first app walkthrough
  - [`tiny-cluster/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/tiny-cluster/README.md) for the smallest repo-owned proof package
  - [`cluster-proof/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/cluster-proof/README.md) for the deeper packaged failover/operator runbook
- the fuller starter: `meshc init --template todo-api <name>` keeps the same source-first `@cluster` contract while adding local SQLite/HTTP routes, explicit-count `HTTP.clustered(1, ...)` on the selected read routes, and Docker packaging

All four surfaces keep the same source-first runtime-owned clustered contract, and the Todo starter adds one bounded read-route adoption on top of it:

- `mesh.toml` stays package-only
- `work.mpl` owns an ordinary `@cluster pub fn add()` / `@cluster pub fn sync_todos()`-style declaration instead of a helper-shaped public entrypoint
- `main.mpl` boots only through `Node.start_from_env()`
- the runtime automatically starts declared work at startup
- operators inspect truth through `meshc cluster status`, continuity list, continuity record, and diagnostics
- the Todo starter keeps `work.mpl` route-free, dogfoods explicit-count `HTTP.clustered(1, ...)` on `GET /todos` and `GET /todos/:id`, and keeps `GET /health` plus mutating routes local instead of inventing package-owned cluster control planes

If you are migrating older clustered code, move `clustered(work)` into source-first `@cluster`, delete any `[cluster]` manifest stanza, and rename helper-shaped entries such as `execute_declared_work(...)` / `Work.execute_declared_work` to ordinary verbs like `add()` or `sync_todos()`. Keep the route-free `@cluster` surfaces canonical: the Todo starter only dogfoods explicit-count `HTTP.clustered(1, ...)` on `GET /todos` and `GET /todos/:id`, while `GET /health` and mutating routes stay local. Default-count and two-node clustered-route behavior stay on the repo S07 rail (`cargo test -p meshc --test e2e_m047_s07 -- --nocapture`).

## Canonical surfaces and verifier rails

- [Clustered Example](/docs/getting-started/clustered-example/) — first stop for the public scaffold surface
- [`tiny-cluster/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/tiny-cluster/README.md) — smallest repo-owned route-free package surface
- [`cluster-proof/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/cluster-proof/README.md) — deeper packaged failover/operator surface
- `meshc init --template todo-api <name>` — the fuller starter that keeps the same source-first contract while adding SQLite/HTTP/Docker proof plus explicit-count `HTTP.clustered(1, ...)` on the selected read routes
- `bash scripts/verify-m047-s04.sh` — the authoritative cutover rail for the source-first route-free clustered contract
- `bash scripts/verify-m047-s05.sh` — the lower-level Todo/runtime subrail that proves the fuller starter natively and inside Docker
- `cargo test -p meshc --test e2e_m047_s07 -- --nocapture` — the repo S07 rail for default-count and two-node `HTTP.clustered(...)` behavior beyond the Todo starter's explicit-count read routes
- `bash scripts/verify-m047-s06.sh` — the final closeout rail that wraps S05, rebuilds docs truth, and owns the assembled `.tmp/m047-s06/verify` bundle
- `bash scripts/verify-m046-s06.sh` — the historical M046 closeout wrapper retained as a compatibility alias into the M047 cutover rail
- `bash scripts/verify-m046-s05.sh` — the historical M046 equal-surface wrapper retained as a compatibility alias into the M047 cutover rail
- `bash scripts/verify-m046-s04.sh` — the historical M046 package/startup wrapper retained as a compatibility alias into the M047 cutover rail
- `bash scripts/verify-m045-s05.sh` — the historical M045 closeout wrapper retained as a compatibility alias into the M047 cutover rail
- `bash scripts/verify-m045-s04.sh` — the historical M045 assembled wrapper retained as a compatibility alias into the M047 cutover rail
- `bash scripts/verify-m045-s03.sh` — historical failover-specific subrail
- `bash scripts/verify-m043-s04-fly.sh` — read-only Fly sanity/config/log/probe verifier

## What the public clustered contract proves

The shared public clustered story is intentionally smaller than a generic clustering marketing page:

- start from any of the three canonical route-free surfaces and learn the same package/runtime contract
- layer on `meshc init --template todo-api` when you want the fuller starter, selected `HTTP.clustered(1, ...)` read routes, and Docker packaging without changing that contract
- keep clustered declaration state in source instead of the manifest
- rename legacy helper-shaped names to ordinary verbs instead of preserving runtime-plumbing-shaped public APIs
- let the runtime own startup, placement, continuity, promotion, recovery, and diagnostics
- use the same operator flow everywhere: status, continuity list, continuity record, diagnostics
- keep the Todo starter's clustered-route adoption narrow: `work.mpl` stays route-free, `GET /todos` and `GET /todos/:id` use explicit-count `HTTP.clustered(1, ...)`, and `GET /health` plus mutating routes stay local application routes
- defer default-count and two-node `HTTP.clustered(...)` behavior to `cargo test -p meshc --test e2e_m047_s07 -- --nocapture` instead of implying the route-free public surfaces or the Todo starter already prove it
- keep Fly as read-only evidence instead of destructive failover proof

## Named proof commands

These are the repo-level commands behind the current distributed proof story:

```bash
bash scripts/verify-m047-s04.sh
bash scripts/verify-m047-s05.sh
cargo test -p meshc --test e2e_m047_s07 -- --nocapture
bash scripts/verify-m047-s06.sh
bash scripts/verify-m046-s06.sh
bash scripts/verify-m046-s05.sh
bash scripts/verify-m046-s04.sh
bash scripts/verify-m045-s05.sh
bash scripts/verify-m045-s04.sh
bash scripts/verify-m045-s03.sh
cargo run -q -p meshc -- build tiny-cluster
cargo run -q -p meshc -- test tiny-cluster/tests
cargo run -q -p meshc -- build cluster-proof
cargo run -q -p meshc -- test cluster-proof/tests
npm --prefix website run build
bash scripts/verify-m043-s04-fly.sh --help
CLUSTER_PROOF_FLY_APP=mesh-cluster-proof \
CLUSTER_PROOF_BASE_URL=https://mesh-cluster-proof.fly.dev \
  bash scripts/verify-m043-s04-fly.sh
```

> **Note:** The Fly verifier is intentionally read-only. Use `bash scripts/verify-m043-s04-fly.sh --help` when you only want the non-live syntax/help path. Live mode inspects an already-deployed app and optionally reads an existing continuity key with `CLUSTER_PROOF_REQUEST_KEY`; it does not create new work or mutate authority.

## Operator workflow across all surfaces

Whichever surface you start from, the operator flow stays the same:

1. `meshc cluster status <node-name@host:port> --json`
2. `meshc cluster continuity <node-name@host:port> --json`
3. `meshc cluster continuity <node-name@host:port> <request-key> --json`
4. `meshc cluster diagnostics <node-name@host:port> --json`

Use the list form first to discover startup or request keys. Only then drill into a single continuity record.

## Supported topology and non-goals

Supported topology and operator seam:

- one primary plus one standby using the same image and the same repo-root packaging path
- small env surface: cookie, discovery seed, explicit identity injection, continuity role, and promotion epoch
- same-image local proof for destructive failover and rejoin truth
- read-only Fly inspection for already-deployed apps

Non-goals for this public rail:

- active-active writes or active-active intake
- multi-standby quorum or consensus claims
- package-owned operator surfaces that compete with the runtime CLI
- presenting the canonical route-free surfaces as wrapper-first or claiming the Todo starter already proves default-count/two-node `HTTP.clustered(...)` behavior that is actually owned by the repo S07 rail
- destructive failover on Fly as a required proof surface

## When to use this page vs the generic distributed guide

Use the generic [Distributed Actors](/docs/distributed/) guide when you want the language/runtime primitives.

Use this page when you want the named proof surfaces behind the shared route-free canonical surfaces, the fuller Todo starter, and the repo-owned S07 clustered-route rail.

## Failure inspection map

If a proof fails, rerun the named command for the exact surface you care about:

- **Final closeout rail:** `bash scripts/verify-m047-s06.sh`
- **Todo/runtime subrail:** `bash scripts/verify-m047-s05.sh`
- **Repo S07 clustered-route rail:** `cargo test -p meshc --test e2e_m047_s07 -- --nocapture`
- **Authoritative cutover rail:** `bash scripts/verify-m047-s04.sh`
- **Historical M046 closeout alias:** `bash scripts/verify-m046-s06.sh`
- **Historical M046 equal-surface alias:** `bash scripts/verify-m046-s05.sh`
- **Historical M046 package/startup alias:** `bash scripts/verify-m046-s04.sh`
- **Historical M045 closeout alias:** `bash scripts/verify-m045-s05.sh`
- **Historical M045 assembled alias:** `bash scripts/verify-m045-s04.sh`
- **Historical failover-only subrail:** `bash scripts/verify-m045-s03.sh`
- **Smallest package contract:** `cargo run -q -p meshc -- build tiny-cluster && cargo run -q -p meshc -- test tiny-cluster/tests`
- **Packaged failover contract:** `cargo run -q -p meshc -- build cluster-proof && cargo run -q -p meshc -- test cluster-proof/tests`
- **Public docs build:** `npm --prefix website run build`
- **Read-only Fly sanity:** `bash scripts/verify-m043-s04-fly.sh --help` for syntax, or `CLUSTER_PROOF_FLY_APP=mesh-cluster-proof CLUSTER_PROOF_BASE_URL=https://mesh-cluster-proof.fly.dev bash scripts/verify-m043-s04-fly.sh` for live inspection

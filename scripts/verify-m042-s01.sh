#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

cargo test -p mesh-rt continuity -- --nocapture
cargo run -q -p meshc -- test cluster-proof/tests
cargo test -p meshc --test e2e_m042_s01 continuity_api -- --nocapture

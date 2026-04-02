use std::any::Any;
use std::fs::{self, File};
use std::io::{Read as _, Write as _};
use std::net::{TcpListener, TcpStream};
use std::path::{Path, PathBuf};
use std::process::{Child, Command, Output, Stdio};
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

use serde_json::Value;

const LOOPBACK_V4: &str = "127.0.0.1";
const LOOPBACK_V6: &str = "::1";
const DISCOVERY_SEED: &str = "localhost";
const SHARED_COOKIE: &str = "mesh-m039-s01-cookie";

#[derive(Clone, Debug)]
struct ClusterProofConfig {
    node_basename: String,
    advertise_host: String,
    cluster_port: u16,
    http_port: u16,
}

struct SpawnedClusterProof {
    config: ClusterProofConfig,
    child: Child,
    stdout_path: PathBuf,
    stderr_path: PathBuf,
}

struct StoppedClusterProof {
    stdout: String,
    stderr: String,
    combined: String,
    stdout_path: PathBuf,
    stderr_path: PathBuf,
}

#[derive(Clone, Debug)]
struct MembershipSnapshot {
    mode: String,
    self_name: String,
    peers: Vec<String>,
    membership: Vec<String>,
    discovery_provider: String,
    discovery_seed: String,
    cluster_port: u16,
    http_port: u16,
    raw_body: String,
}

struct HttpResponse {
    status_code: u16,
    body: String,
    raw: String,
}

fn repo_root() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .unwrap()
        .parent()
        .unwrap()
        .to_path_buf()
}

fn meshc_bin() -> PathBuf {
    PathBuf::from(env!("CARGO_BIN_EXE_meshc"))
}

fn cluster_proof_binary() -> PathBuf {
    repo_root().join("cluster-proof").join("cluster-proof")
}

fn assert_cluster_proof_build_succeeds() {
    let output = Command::new(meshc_bin())
        .current_dir(repo_root())
        .args(["build", "cluster-proof"])
        .output()
        .expect("failed to invoke meshc build cluster-proof");

    assert_command_success(&output, "meshc build cluster-proof");
}

fn assert_cluster_proof_tests_pass() {
    let output = Command::new(meshc_bin())
        .current_dir(repo_root())
        .args(["test", "cluster-proof/tests"])
        .output()
        .expect("failed to invoke meshc test cluster-proof/tests");

    assert_command_success(&output, "meshc test cluster-proof/tests");
}

fn assert_command_success(output: &Output, description: &str) {
    assert!(
        output.status.success(),
        "{description} failed:\nstdout: {}\nstderr: {}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

fn dual_stack_cluster_port() -> u16 {
    assert_dual_stack_loopback_available();

    for _ in 0..64 {
        let listener = TcpListener::bind((LOOPBACK_V4, 0))
            .expect("failed to bind IPv4 loopback for ephemeral cluster port");
        let port = listener
            .local_addr()
            .expect("failed to read IPv4 ephemeral port")
            .port();
        drop(listener);

        if TcpListener::bind((LOOPBACK_V4, port)).is_ok()
            && TcpListener::bind((LOOPBACK_V6, port)).is_ok()
        {
            return port;
        }
    }

    panic!("failed to find a cluster port that is free on both 127.0.0.1 and ::1");
}

fn assert_dual_stack_loopback_available() {
    TcpListener::bind((LOOPBACK_V4, 0))
        .expect("local proof requires IPv4 loopback binding on 127.0.0.1");
    TcpListener::bind((LOOPBACK_V6, 0)).expect("local proof requires IPv6 loopback binding on ::1");
}

fn unused_http_port() -> u16 {
    TcpListener::bind((LOOPBACK_V4, 0))
        .expect("failed to bind IPv4 loopback for ephemeral HTTP port")
        .local_addr()
        .expect("failed to read IPv4 ephemeral HTTP port")
        .port()
}

fn proof_logs_dir(test_name: &str) -> PathBuf {
    let stamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("system clock before unix epoch")
        .as_nanos();
    let dir = repo_root()
        .join(".tmp")
        .join("m039-s01")
        .join(format!("{test_name}-{stamp}"));
    fs::create_dir_all(&dir)
        .unwrap_or_else(|e| panic!("failed to create {}: {}", dir.display(), e));
    dir
}

fn node_log_paths(log_dir: &Path, node_basename: &str) -> (PathBuf, PathBuf) {
    let stdout_path = log_dir.join(format!("{node_basename}.stdout.log"));
    let stderr_path = log_dir.join(format!("{node_basename}.stderr.log"));
    (stdout_path, stderr_path)
}

fn spawn_cluster_proof(config: ClusterProofConfig, log_dir: &Path) -> SpawnedClusterProof {
    let binary = cluster_proof_binary();
    assert!(
        binary.exists(),
        "cluster-proof binary not found at {}. Run `meshc build cluster-proof` first.",
        binary.display()
    );

    let (stdout_path, stderr_path) = node_log_paths(log_dir, &config.node_basename);
    let stdout_file = File::create(&stdout_path)
        .unwrap_or_else(|e| panic!("failed to create {}: {}", stdout_path.display(), e));
    let stderr_file = File::create(&stderr_path)
        .unwrap_or_else(|e| panic!("failed to create {}: {}", stderr_path.display(), e));

    let child = Command::new(&binary)
        .current_dir(repo_root().join("cluster-proof"))
        .env("PORT", config.http_port.to_string())
        .env("MESH_CLUSTER_PORT", config.cluster_port.to_string())
        .env("CLUSTER_PROOF_COOKIE", SHARED_COOKIE)
        .env("MESH_DISCOVERY_SEED", DISCOVERY_SEED)
        .env("CLUSTER_PROOF_NODE_BASENAME", &config.node_basename)
        .env("CLUSTER_PROOF_ADVERTISE_HOST", &config.advertise_host)
        .stdout(Stdio::from(stdout_file))
        .stderr(Stdio::from(stderr_file))
        .spawn()
        .unwrap_or_else(|e| panic!("failed to spawn {}: {}", binary.display(), e));

    SpawnedClusterProof {
        config,
        child,
        stdout_path,
        stderr_path,
    }
}

fn collect_stopped_cluster_proof(
    mut child: Child,
    stdout_path: PathBuf,
    stderr_path: PathBuf,
) -> StoppedClusterProof {
    child
        .wait()
        .expect("failed to collect cluster-proof exit status");

    let stdout = fs::read_to_string(&stdout_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", stdout_path.display(), e));
    let stderr = fs::read_to_string(&stderr_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", stderr_path.display(), e));
    let combined = format!("{stdout}{stderr}");

    StoppedClusterProof {
        stdout,
        stderr,
        combined,
        stdout_path,
        stderr_path,
    }
}

fn stop_cluster_proof(spawned: SpawnedClusterProof) -> StoppedClusterProof {
    let SpawnedClusterProof {
        mut child,
        stdout_path,
        stderr_path,
        ..
    } = spawned;

    let _ = Command::new("kill")
        .args(["-TERM", &child.id().to_string()])
        .status();
    std::thread::sleep(Duration::from_millis(250));
    if child
        .try_wait()
        .expect("failed to probe cluster-proof exit status")
        .is_none()
    {
        let _ = child.kill();
    }

    collect_stopped_cluster_proof(child, stdout_path, stderr_path)
}

fn kill_cluster_proof(spawned: SpawnedClusterProof) -> StoppedClusterProof {
    let SpawnedClusterProof {
        mut child,
        stdout_path,
        stderr_path,
        ..
    } = spawned;

    let _ = child.kill();

    collect_stopped_cluster_proof(child, stdout_path, stderr_path)
}

fn assert_cluster_proof_running(spawned: &mut SpawnedClusterProof, context: &str) {
    if let Some(status) = spawned.child.try_wait().unwrap_or_else(|e| {
        panic!(
            "failed to probe {} exit status: {}",
            spawned.config.node_basename, e
        )
    }) {
        panic!(
            "cluster-proof node {} exited early while {}: status={:?}; stdout_log={}; stderr_log={}",
            spawned.config.node_basename,
            context,
            status,
            spawned.stdout_path.display(),
            spawned.stderr_path.display()
        );
    }
}

fn send_http_request(port: u16, path: &str) -> std::io::Result<HttpResponse> {
    let mut stream = TcpStream::connect((LOOPBACK_V4, port))?;
    stream.set_read_timeout(Some(Duration::from_secs(5)))?;

    let request = format!("GET {path} HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n");
    stream.write_all(request.as_bytes())?;

    let mut raw = String::new();
    stream.read_to_string(&mut raw)?;
    let mut parts = raw.splitn(2, "\r\n\r\n");
    let headers = parts.next().unwrap_or("");
    let body = parts.next().unwrap_or("").to_string();
    let status_code = headers
        .lines()
        .next()
        .and_then(|line| line.split_whitespace().nth(1))
        .and_then(|code| code.parse::<u16>().ok())
        .unwrap_or(0);

    Ok(HttpResponse {
        status_code,
        body,
        raw,
    })
}

fn parse_membership_snapshot(response: HttpResponse, description: &str) -> MembershipSnapshot {
    assert!(
        response.status_code == 200,
        "expected HTTP 200 for {description}, got raw response:\n{}",
        response.raw
    );

    let json: Value = serde_json::from_str(&response.body).unwrap_or_else(|e| {
        panic!(
            "expected JSON body for {description}, got parse error {e}: {}",
            response.body
        )
    });

    let mode = required_str_field(&json, &response.body, "mode");
    let self_name = required_str_field(&json, &response.body, "self");
    let peers = required_string_list(&json, &response.body, "peers");
    let membership = required_string_list(&json, &response.body, "membership");
    let discovery_provider = required_str_field(&json, &response.body, "discovery_provider");
    let discovery_seed = required_str_field(&json, &response.body, "discovery_seed");
    let cluster_port = required_port_field(&json, &response.body, "cluster_port");
    let http_port = required_port_field(&json, &response.body, "http_port");

    for node_name in membership
        .iter()
        .chain(peers.iter())
        .chain(std::iter::once(&self_name))
    {
        if !node_name.is_empty() {
            assert!(
                node_name.contains('@'),
                "membership response contained malformed node identity {:?}: {}",
                node_name,
                response.body
            );
        }
    }

    MembershipSnapshot {
        mode,
        self_name,
        peers,
        membership,
        discovery_provider,
        discovery_seed,
        cluster_port,
        http_port,
        raw_body: response.body,
    }
}

fn required_str_field(json: &Value, raw_body: &str, field: &str) -> String {
    json[field]
        .as_str()
        .unwrap_or_else(|| {
            panic!(
                "membership response missing string field `{field}`: {}",
                raw_body
            )
        })
        .to_string()
}

fn required_port_field(json: &Value, raw_body: &str, field: &str) -> u16 {
    match &json[field] {
        Value::Number(value) => {
            let raw = value.as_u64().unwrap_or_else(|| {
                panic!(
                    "membership response field `{field}` must be a non-negative integer: {}",
                    raw_body
                )
            });
            u16::try_from(raw).unwrap_or_else(|_| {
                panic!(
                    "membership response field `{field}` overflowed u16: {}",
                    raw_body
                )
            })
        }
        Value::String(value) => value.parse::<u16>().unwrap_or_else(|_| {
            panic!(
                "membership response field `{field}` must be a u16 string or integer: {}",
                raw_body
            )
        }),
        _ => panic!(
            "membership response missing integer-or-string field `{field}`: {}",
            raw_body
        ),
    }
}

fn required_string_list(json: &Value, raw_body: &str, field: &str) -> Vec<String> {
    let values = json[field].as_array().unwrap_or_else(|| {
        panic!(
            "membership response missing array field `{field}`: {}",
            raw_body
        )
    });

    values
        .iter()
        .map(|value| {
            value
                .as_str()
                .unwrap_or_else(|| {
                    panic!(
                        "membership response field `{field}` must contain only strings: {}",
                        raw_body
                    )
                })
                .to_string()
        })
        .collect()
}

fn sorted(values: &[String]) -> Vec<String> {
    let mut copy = values.to_vec();
    copy.sort();
    copy
}

fn expected_node_name(config: &ClusterProofConfig) -> String {
    let normalized_host = if config.advertise_host.contains(':') {
        format!("[{}]", config.advertise_host)
    } else {
        config.advertise_host.clone()
    };
    format!(
        "{}@{}:{}",
        config.node_basename, normalized_host, config.cluster_port
    )
}

fn wait_for_membership(
    config: &ClusterProofConfig,
    watched_nodes: &mut [&mut SpawnedClusterProof],
    expected_mode: &str,
    expected_self: &str,
    expected_membership: &[String],
    expected_peers: &[String],
) -> MembershipSnapshot {
    let deadline = Instant::now() + Duration::from_secs(12);
    let mut last_snapshot: Option<MembershipSnapshot> = None;
    let mut last_issue = String::new();

    while Instant::now() < deadline {
        for spawned in watched_nodes.iter_mut() {
            assert_cluster_proof_running(
                spawned,
                &format!("waiting for /membership on :{}", config.http_port),
            );
        }

        match send_http_request(config.http_port, "/membership") {
            Ok(response) if response.status_code == 200 => {
                let snapshot = parse_membership_snapshot(
                    response,
                    &format!("/membership on :{}", config.http_port),
                );

                last_issue = format!(
                    "last snapshot mode={} self={} peers={:?} membership={:?}",
                    snapshot.mode, snapshot.self_name, snapshot.peers, snapshot.membership
                );

                if snapshot.mode == expected_mode
                    && snapshot.self_name == expected_self
                    && sorted(&snapshot.membership) == sorted(expected_membership)
                    && sorted(&snapshot.peers) == sorted(expected_peers)
                    && snapshot.discovery_provider == "dns"
                    && snapshot.discovery_seed == DISCOVERY_SEED
                    && snapshot.cluster_port == config.cluster_port
                    && snapshot.http_port == config.http_port
                {
                    return snapshot;
                }

                last_snapshot = Some(snapshot);
            }
            Ok(response) => {
                last_issue = format!(
                    "unexpected HTTP {} from /membership on :{}: {}",
                    response.status_code, config.http_port, response.raw
                );
            }
            Err(error) => {
                last_issue = format!("GET /membership failed on :{}: {}", config.http_port, error);
            }
        }

        std::thread::sleep(Duration::from_millis(100));
    }

    panic!(
        "membership did not converge for {} on :{} within timeout; {} ; last_snapshot={:?}",
        config.node_basename, config.http_port, last_issue, last_snapshot
    );
}

fn assert_startup_logs(
    logs: &StoppedClusterProof,
    config: &ClusterProofConfig,
    expected_node_name: &str,
) {
    assert!(
        logs.combined.contains(&format!(
            "[cluster-proof] Config loaded mode=cluster node={} http_port={} cluster_port={} discovery_provider=dns discovery_seed={}",
            expected_node_name, config.http_port, config.cluster_port, DISCOVERY_SEED
        )),
        "expected config-loaded log line in {} / {}\nstdout:\n{}\nstderr:\n{}",
        logs.stdout_path.display(),
        logs.stderr_path.display(),
        logs.stdout,
        logs.stderr
    );
    assert!(
        logs.combined.contains(&format!(
            "[cluster-proof] Node started: {}",
            expected_node_name
        )),
        "expected node-started log line in {} / {}\nstdout:\n{}\nstderr:\n{}",
        logs.stdout_path.display(),
        logs.stderr_path.display(),
        logs.stdout,
        logs.stderr
    );
    assert!(
        logs.combined.contains(&format!(
            "[cluster-proof] HTTP server starting on :{}",
            config.http_port
        )),
        "expected HTTP-bind log line in {} / {}\nstdout:\n{}\nstderr:\n{}",
        logs.stdout_path.display(),
        logs.stderr_path.display(),
        logs.stdout,
        logs.stderr
    );
    assert!(
        !logs.combined.contains(SHARED_COOKIE),
        "cluster-proof logs must not echo the shared cookie\nstdout:\n{}\nstderr:\n{}",
        logs.stdout,
        logs.stderr
    );
}

fn panic_payload_to_string(payload: Box<dyn Any + Send>) -> String {
    if let Some(message) = payload.downcast_ref::<&str>() {
        (*message).to_string()
    } else if let Some(message) = payload.downcast_ref::<String>() {
        message.clone()
    } else {
        "non-string panic payload".to_string()
    }
}

#[test]
fn e2e_m039_s01_converges_without_manual_peers() {
    assert_cluster_proof_tests_pass();
    assert_cluster_proof_build_succeeds();

    let cluster_port = dual_stack_cluster_port();
    let config_a = ClusterProofConfig {
        node_basename: "node-a".to_string(),
        advertise_host: LOOPBACK_V4.to_string(),
        cluster_port,
        http_port: unused_http_port(),
    };
    let config_b = ClusterProofConfig {
        node_basename: "node-b".to_string(),
        advertise_host: LOOPBACK_V6.to_string(),
        cluster_port,
        http_port: unused_http_port(),
    };

    let expected_a = expected_node_name(&config_a);
    let expected_b = expected_node_name(&config_b);
    let log_dir = proof_logs_dir("e2e-m039-s01-converges");
    let mut spawned_a = spawn_cluster_proof(config_a.clone(), &log_dir);
    let mut spawned_b = spawn_cluster_proof(config_b.clone(), &log_dir);

    let run_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
        let snapshot_a = {
            let mut watched = [&mut spawned_a, &mut spawned_b];
            wait_for_membership(
                &config_a,
                &mut watched,
                "cluster",
                &expected_a,
                &[expected_a.clone(), expected_b.clone()],
                std::slice::from_ref(&expected_b),
            )
        };
        let snapshot_b = {
            let mut watched = [&mut spawned_a, &mut spawned_b];
            wait_for_membership(
                &config_b,
                &mut watched,
                "cluster",
                &expected_b,
                &[expected_a.clone(), expected_b.clone()],
                std::slice::from_ref(&expected_a),
            )
        };

        assert!(
            !snapshot_a.membership.is_empty() && !snapshot_b.membership.is_empty(),
            "cluster membership must never be empty once convergence succeeds"
        );
        assert!(
            snapshot_a.membership.contains(&expected_a)
                && snapshot_b.membership.contains(&expected_b),
            "membership must explicitly include self even though Node.list() is peer-only"
        );
        assert!(
            !snapshot_a.peers.contains(&expected_a) && !snapshot_b.peers.contains(&expected_b),
            "peers must remain peer-only; response_a={} response_b={}",
            snapshot_a.raw_body,
            snapshot_b.raw_body
        );
    }));

    let logs_b = stop_cluster_proof(spawned_b);
    let logs_a = stop_cluster_proof(spawned_a);

    match run_result {
        Ok(()) => {
            assert_startup_logs(&logs_a, &config_a, &expected_a);
            assert_startup_logs(&logs_b, &config_b, &expected_b);
        }
        Err(payload) => {
            panic!(
                "cluster-proof convergence assertions failed: {}\nnode-a stdout ({}):\n{}\nnode-a stderr ({}):\n{}\nnode-b stdout ({}):\n{}\nnode-b stderr ({}):\n{}",
                panic_payload_to_string(payload),
                logs_a.stdout_path.display(),
                logs_a.stdout,
                logs_a.stderr_path.display(),
                logs_a.stderr,
                logs_b.stdout_path.display(),
                logs_b.stdout,
                logs_b.stderr_path.display(),
                logs_b.stderr
            );
        }
    }
}

#[test]
fn e2e_m039_s01_membership_updates_after_node_loss() {
    assert_cluster_proof_tests_pass();
    assert_cluster_proof_build_succeeds();

    let cluster_port = dual_stack_cluster_port();
    let config_a = ClusterProofConfig {
        node_basename: "node-a".to_string(),
        advertise_host: LOOPBACK_V4.to_string(),
        cluster_port,
        http_port: unused_http_port(),
    };
    let config_b = ClusterProofConfig {
        node_basename: "node-b".to_string(),
        advertise_host: LOOPBACK_V6.to_string(),
        cluster_port,
        http_port: unused_http_port(),
    };

    let expected_a = expected_node_name(&config_a);
    let expected_b = expected_node_name(&config_b);
    let log_dir = proof_logs_dir("e2e-m039-s01-node-loss");
    let mut spawned_a = Some(spawn_cluster_proof(config_a.clone(), &log_dir));
    let mut spawned_b = Some(spawn_cluster_proof(config_b.clone(), &log_dir));
    let mut killed_b_logs: Option<StoppedClusterProof> = None;

    let run_result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
        {
            let a = spawned_a
                .as_mut()
                .expect("node-a process missing before convergence");
            let b = spawned_b
                .as_mut()
                .expect("node-b process missing before convergence");
            let mut watched = [a, b];
            let _ = wait_for_membership(
                &config_a,
                &mut watched,
                "cluster",
                &expected_a,
                &[expected_a.clone(), expected_b.clone()],
                std::slice::from_ref(&expected_b),
            );
        }
        {
            let a = spawned_a
                .as_mut()
                .expect("node-a process missing before convergence");
            let b = spawned_b
                .as_mut()
                .expect("node-b process missing before convergence");
            let mut watched = [a, b];
            let _ = wait_for_membership(
                &config_b,
                &mut watched,
                "cluster",
                &expected_b,
                &[expected_a.clone(), expected_b.clone()],
                std::slice::from_ref(&expected_a),
            );
        }

        let stopped_b = kill_cluster_proof(
            spawned_b
                .take()
                .expect("node-b process missing before loss injection"),
        );
        killed_b_logs = Some(stopped_b);

        let survivor_snapshot = {
            let a = spawned_a
                .as_mut()
                .expect("node-a process missing after node-b kill");
            let mut watched = [a];
            wait_for_membership(
                &config_a,
                &mut watched,
                "cluster",
                &expected_a,
                std::slice::from_ref(&expected_a),
                &[],
            )
        };

        assert_eq!(
            survivor_snapshot.membership,
            vec![expected_a.clone()],
            "surviving node must shrink membership to self only after peer loss; response={}",
            survivor_snapshot.raw_body
        );
        assert!(
            survivor_snapshot.peers.is_empty(),
            "surviving node must report zero peers after loss; response={}",
            survivor_snapshot.raw_body
        );
        assert!(
            survivor_snapshot.membership.contains(&expected_a),
            "loss detection must not drop self from membership; response={}",
            survivor_snapshot.raw_body
        );
    }));

    let logs_a = stop_cluster_proof(
        spawned_a
            .take()
            .expect("node-a process missing during cleanup"),
    );
    let logs_b = match killed_b_logs {
        Some(logs) => logs,
        None => stop_cluster_proof(
            spawned_b
                .take()
                .expect("node-b process missing during cleanup"),
        ),
    };

    match run_result {
        Ok(()) => {
            assert_startup_logs(&logs_a, &config_a, &expected_a);
            assert_startup_logs(&logs_b, &config_b, &expected_b);
        }
        Err(payload) => {
            panic!(
                "cluster-proof node-loss assertions failed: {}\nnode-a stdout ({}):\n{}\nnode-a stderr ({}):\n{}\nnode-b stdout ({}):\n{}\nnode-b stderr ({}):\n{}",
                panic_payload_to_string(payload),
                logs_a.stdout_path.display(),
                logs_a.stdout,
                logs_a.stderr_path.display(),
                logs_a.stderr,
                logs_b.stdout_path.display(),
                logs_b.stdout,
                logs_b.stderr_path.display(),
                logs_b.stderr
            );
        }
    }
}

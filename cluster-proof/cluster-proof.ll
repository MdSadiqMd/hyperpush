; ModuleID = 'mesh_module'
source_filename = "mesh_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.3.0"

%MembershipPayload.2 = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%MembershipSnapshot.1 = type { ptr, ptr, ptr }
%WorkSubmitBody.4 = type { ptr, ptr }
%WorkStatusPayload.6 = type { i1, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i1, i1, ptr, ptr }
%TargetSelection.3 = type { ptr, i64, i64, i1, i1 }
%WorkRequestRecord.5 = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i1, i1, ptr }
%RequestRegistryState.8 = type { i64, ptr }
%SubmitMutation.7 = type { ptr, %WorkRequestRecord.5, ptr }

@.str = unnamed_addr constant [4 x i8] c"mode"
@.str.1 = unnamed_addr constant [4 x i8] c"node"
@.str.2 = unnamed_addr constant [5 x i8] c"peers"
@.str.3 = unnamed_addr constant [10 x i8] c"membership"
@.str.4 = unnamed_addr constant [9 x i8] c"http_port"
@.str.5 = unnamed_addr constant [12 x i8] c"cluster_port"
@.str.6 = unnamed_addr constant [18 x i8] c"discovery_provider"
@.str.7 = unnamed_addr constant [14 x i8] c"discovery_seed"
@.str.8 = unnamed_addr constant [7 x i8] c"cluster"
@.str.9 = unnamed_addr constant [10 x i8] c"standalone"
@.str.10 = unnamed_addr constant [4 x i8] c"PORT"
@.str.11 = unnamed_addr constant [4 x i8] c"8080"
@.str.12 = unnamed_addr constant [17 x i8] c"MESH_CLUSTER_PORT"
@.str.13 = unnamed_addr constant [4 x i8] c"4370"
@.str.14 = unnamed_addr constant [3 x i8] c"dns"
@.str.15 = unnamed_addr constant [4 x i8] c"none"
@.str.16 = unnamed_addr constant [7 x i8] c"\22node\22:"
@.str.17 = unnamed_addr constant [7 x i8] c"\22self\22:"
@.str.18 = unnamed_addr constant [4 x i8] c"PORT"
@.str.19 = unnamed_addr constant [17 x i8] c"MESH_CLUSTER_PORT"
@.str.20 = unnamed_addr constant [20 x i8] c"CLUSTER_PROOF_COOKIE"
@.str.21 = unnamed_addr constant [19 x i8] c"MESH_DISCOVERY_SEED"
@.str.22 = unnamed_addr constant [27 x i8] c"CLUSTER_PROOF_NODE_BASENAME"
@.str.23 = unnamed_addr constant [28 x i8] c"CLUSTER_PROOF_ADVERTISE_HOST"
@.str.24 = unnamed_addr constant [38 x i8] c"Missing required environment variable "
@.str.25 = unnamed_addr constant [8 x i8] c"Invalid "
@.str.26 = unnamed_addr constant [29 x i8] c": expected a positive integer"
@.str.27 = unnamed_addr constant [50 x i8] c" is required when discovery or identity env is set"
@.str.28 = unnamed_addr constant [5 x i8] c" and "
@.str.29 = unnamed_addr constant [21 x i8] c" must be set together"
@.str.30 = unnamed_addr constant [90 x i8] c"Fly cluster identity requires FLY_APP_NAME, FLY_REGION, FLY_MACHINE_ID, and FLY_PRIVATE_IP"
@.str.31 = unnamed_addr constant [22 x i8] c"cluster mode requires "
@.str.32 = unnamed_addr constant [3 x i8] c" + "
@.str.33 = unnamed_addr constant [20 x i8] c" or Fly identity env"
@.str.34 = unnamed_addr constant [26 x i8] c"Invalid cluster identity: "
@.str.35 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.36 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.37 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.38 = unnamed_addr constant [1 x i8] c"@"
@.str.39 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.40 = unnamed_addr constant [1 x i8] c"["
@.str.41 = unnamed_addr constant [1 x i8] c"]"
@.str.42 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.43 = unnamed_addr constant [1 x i8] c"]"
@.str.44 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.45 = unnamed_addr constant [1 x i8] c":"
@.str.46 = unnamed_addr constant [1 x i8] c"["
@.str.47 = unnamed_addr constant [1 x i8] c"]"
@.str.48 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.49 = unnamed_addr constant [1 x i8] c"@"
@.str.50 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.51 = unnamed_addr constant [31 x i8] c"advertised host cannot be blank"
@.str.52 = unnamed_addr constant [1 x i8] c"@"
@.str.53 = unnamed_addr constant [32 x i8] c"advertised host cannot contain @"
@.str.54 = unnamed_addr constant [1 x i8] c"["
@.str.55 = unnamed_addr constant [1 x i8] c"]"
@.str.56 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.57 = unnamed_addr constant [56 x i8] c"advertised host has an opening '[' without a closing ']'"
@.str.58 = unnamed_addr constant [1 x i8] c"]"
@.str.59 = unnamed_addr constant [56 x i8] c"advertised host has a closing ']' without an opening '['"
@.str.60 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.61 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.62 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.63 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.64 = unnamed_addr constant [10 x i8] c"standalone"
@.str.65 = unnamed_addr constant [7 x i8] c"cluster"
@.str.66 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.67 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.68 = unnamed_addr constant [12 x i8] c"FLY_APP_NAME"
@.str.69 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.70 = unnamed_addr constant [10 x i8] c"FLY_REGION"
@.str.71 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.72 = unnamed_addr constant [14 x i8] c"FLY_MACHINE_ID"
@.str.73 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.74 = unnamed_addr constant [14 x i8] c"FLY_PRIVATE_IP"
@.str.75 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.76 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.77 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.78 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.79 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.80 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.81 = unnamed_addr constant [12 x i8] c"FLY_APP_NAME"
@.str.82 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.83 = unnamed_addr constant [10 x i8] c"FLY_REGION"
@.str.84 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.85 = unnamed_addr constant [14 x i8] c"FLY_MACHINE_ID"
@.str.86 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.87 = unnamed_addr constant [14 x i8] c"FLY_PRIVATE_IP"
@.str.88 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.89 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.90 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.91 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.92 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.93 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.94 = unnamed_addr constant [1 x i8] c"@"
@.str.95 = unnamed_addr constant [1 x i8] c":"
@.str.96 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.97 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.98 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.99 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.100 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.101 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.102 = unnamed_addr constant [1 x i8] c"-"
@.str.103 = unnamed_addr constant [1 x i8] c"-"
@.str.104 = unnamed_addr constant [1 x i8] c"@"
@.str.105 = unnamed_addr constant [1 x i8] c":"
@.str.106 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.107 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.108 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.109 = unnamed_addr constant [12 x i8] c"FLY_APP_NAME"
@.str.110 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.111 = unnamed_addr constant [10 x i8] c"FLY_REGION"
@.str.112 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.113 = unnamed_addr constant [14 x i8] c"FLY_MACHINE_ID"
@.str.114 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.115 = unnamed_addr constant [14 x i8] c"FLY_PRIVATE_IP"
@.str.116 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.117 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.118 = unnamed_addr constant [30 x i8] c"node basename cannot contain @"
@.str.119 = unnamed_addr constant [11 x i8] c"request_key"
@.str.120 = unnamed_addr constant [7 x i8] c"payload"
@.str.121 = unnamed_addr constant [2 x i8] c"ok"
@.str.122 = unnamed_addr constant [11 x i8] c"request_key"
@.str.123 = unnamed_addr constant [10 x i8] c"attempt_id"
@.str.124 = unnamed_addr constant [5 x i8] c"phase"
@.str.125 = unnamed_addr constant [6 x i8] c"result"
@.str.126 = unnamed_addr constant [12 x i8] c"ingress_node"
@.str.127 = unnamed_addr constant [10 x i8] c"owner_node"
@.str.128 = unnamed_addr constant [12 x i8] c"replica_node"
@.str.129 = unnamed_addr constant [14 x i8] c"replica_status"
@.str.130 = unnamed_addr constant [14 x i8] c"execution_node"
@.str.131 = unnamed_addr constant [15 x i8] c"routed_remotely"
@.str.132 = unnamed_addr constant [17 x i8] c"fell_back_locally"
@.str.133 = unnamed_addr constant [5 x i8] c"error"
@.str.134 = unnamed_addr constant [15 x i8] c"conflict_reason"
@.str.135 = unnamed_addr constant [9 x i8] c"submitted"
@.str.136 = unnamed_addr constant [7 x i8] c"pending"
@.str.137 = unnamed_addr constant [9 x i8] c"completed"
@.str.138 = unnamed_addr constant [9 x i8] c"succeeded"
@.str.139 = unnamed_addr constant [7 x i8] c"missing"
@.str.140 = unnamed_addr constant [7 x i8] c"unknown"
@.str.141 = unnamed_addr constant [7 x i8] c"invalid"
@.str.142 = unnamed_addr constant [8 x i8] c"rejected"
@.str.143 = unnamed_addr constant [10 x i8] c"unassigned"
@.str.144 = unnamed_addr constant [8 x i8] c"assigned"
@.str.145 = unnamed_addr constant [8 x i8] c"attempt-"
@.str.146 = unnamed_addr constant [28 x i8] c"cluster_proof_work_requests@"
@.str.147 = unnamed_addr constant [27 x i8] c"cluster_proof_work_requests"
@.str.148 = unnamed_addr constant [16 x i8] c"standalone@local"
@.str.149 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.150 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.151 = unnamed_addr constant [23 x i8] c"request_key is required"
@.str.152 = unnamed_addr constant [37 x i8] c"request_key must be 1..128 characters"
@.str.153 = unnamed_addr constant [19 x i8] c"payload is required"
@.panic_msg = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file = constant [9 x i8] c"<unknown>"
@.panic_msg.154 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.155 = constant [9 x i8] c"<unknown>"
@.str.156 = unnamed_addr constant [12 x i8] c"invalid json"
@.panic_msg.157 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.158 = constant [9 x i8] c"<unknown>"
@.str.159 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.160 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.161 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.162 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.163 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.164 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.165 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.166 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.167 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.168 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.169 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.170 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.171 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.172 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.173 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.174 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.175 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.176 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.177 = unnamed_addr constant [9 x i8] c"duplicate"
@.str.178 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.179 = unnamed_addr constant [8 x i8] c"conflict"
@.str.180 = unnamed_addr constant [20 x i8] c"request_key_conflict"
@.str.181 = unnamed_addr constant [7 x i8] c"created"
@.str.182 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.183 = unnamed_addr constant [7 x i8] c"created"
@.str.184 = unnamed_addr constant [21 x i8] c"request_key_not_found"
@.str.185 = unnamed_addr constant [19 x i8] c"attempt_id_mismatch"
@.str.186 = unnamed_addr constant [22 x i8] c"execution_node_missing"
@.str.187 = unnamed_addr constant [37 x i8] c"transition_rejected:already_completed"
@.str.188 = unnamed_addr constant [25 x i8] c"transition_rejected:phase"
@.str.189 = unnamed_addr constant [0 x i8] zeroinitializer
@.panic_msg.190 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.191 = constant [9 x i8] c"<unknown>"
@.panic_msg.192 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.193 = constant [9 x i8] c"<unknown>"
@.str.194 = unnamed_addr constant [40 x i8] c"[cluster-proof] work submit request_key="
@.str.195 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.196 = unnamed_addr constant [9 x i8] c" ingress="
@.str.197 = unnamed_addr constant [7 x i8] c" owner="
@.str.198 = unnamed_addr constant [9 x i8] c" replica="
@.str.199 = unnamed_addr constant [16 x i8] c" replica_status="
@.str.200 = unnamed_addr constant [17 x i8] c" routed_remotely="
@.str.201 = unnamed_addr constant [7 x i8] c" phase="
@.str.202 = unnamed_addr constant [40 x i8] c"[cluster-proof] work dedupe request_key="
@.str.203 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.204 = unnamed_addr constant [7 x i8] c" phase="
@.str.205 = unnamed_addr constant [8 x i8] c" result="
@.str.206 = unnamed_addr constant [7 x i8] c" owner="
@.str.207 = unnamed_addr constant [9 x i8] c" replica="
@.str.208 = unnamed_addr constant [42 x i8] c"[cluster-proof] work conflict request_key="
@.str.209 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.210 = unnamed_addr constant [14 x i8] c" stored_phase="
@.str.211 = unnamed_addr constant [15 x i8] c" stored_result="
@.str.212 = unnamed_addr constant [8 x i8] c" reason="
@.str.213 = unnamed_addr constant [40 x i8] c"[cluster-proof] work status request_key="
@.str.214 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.215 = unnamed_addr constant [7 x i8] c" phase="
@.str.216 = unnamed_addr constant [8 x i8] c" result="
@.str.217 = unnamed_addr constant [9 x i8] c" ingress="
@.str.218 = unnamed_addr constant [7 x i8] c" owner="
@.str.219 = unnamed_addr constant [9 x i8] c" replica="
@.str.220 = unnamed_addr constant [48 x i8] c"[cluster-proof] work status missing request_key="
@.str.221 = unnamed_addr constant [29 x i8] c" reason=request_key_not_found"
@.str.222 = unnamed_addr constant [51 x i8] c"[cluster-proof] work status transition request_key="
@.str.223 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.224 = unnamed_addr constant [7 x i8] c" phase="
@.str.225 = unnamed_addr constant [8 x i8] c" result="
@.str.226 = unnamed_addr constant [11 x i8] c" execution="
@.str.227 = unnamed_addr constant [60 x i8] c"[cluster-proof] work status transition rejected request_key="
@.str.228 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.229 = unnamed_addr constant [8 x i8] c" reason="
@.str.230 = unnamed_addr constant [49 x i8] c"[cluster-proof] work submit rejected request_key="
@.str.231 = unnamed_addr constant [9 x i8] c" ingress="
@.str.232 = unnamed_addr constant [7 x i8] c" owner="
@.str.233 = unnamed_addr constant [17 x i8] c" routed_remotely="
@.str.234 = unnamed_addr constant [8 x i8] c" reason="
@.str.235 = unnamed_addr constant [1 x i8] c"\0A"
@.str.236 = unnamed_addr constant [1 x i8] c"\0A"
@.str.237 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.238 = unnamed_addr constant [1 x i8] c"\0A"
@.str.239 = unnamed_addr constant [2 x i8] c"{}"
@.str.240 = unnamed_addr constant [5 x i8] c"found"
@.str.241 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.242 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.243 = unnamed_addr constant [7 x i8] c"missing"
@.panic_msg.244 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.245 = constant [9 x i8] c"<unknown>"
@.str.246 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.247 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.248 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.249 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.250 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.251 = unnamed_addr constant [7 x i8] c"created"
@.str.252 = unnamed_addr constant [9 x i8] c"duplicate"
@.panic_msg.253 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.254 = constant [9 x i8] c"<unknown>"
@.panic_msg.255 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.256 = constant [9 x i8] c"<unknown>"
@.str.257 = unnamed_addr constant [27 x i8] c"cluster_proof_work_requests"
@.str.258 = unnamed_addr constant [46 x i8] c"[cluster-proof] work registry registered name="
@.str.259 = unnamed_addr constant [42 x i8] c"[cluster-proof] work executed request_key="
@.str.260 = unnamed_addr constant [12 x i8] c" attempt_id="
@.str.261 = unnamed_addr constant [11 x i8] c" execution="
@spawn_fn_name = private unnamed_addr constant [13 x i8] c"execute_work\00", align 1
@.str.262 = unnamed_addr constant [53 x i8] c"[cluster-proof] work services ready request_registry="
@.str.263 = unnamed_addr constant [6 x i8] c" node="
@.str.264 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.265 = unnamed_addr constant [24 x i8] c"invalid_target_selection"
@.str.266 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.267 = unnamed_addr constant [24 x i8] c"invalid_target_selection"
@.str.268 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.269 = unnamed_addr constant [7 x i8] c"created"
@.str.270 = unnamed_addr constant [10 x i8] c"attempt_id"
@.str.271 = unnamed_addr constant [9 x i8] c"duplicate"
@.str.272 = unnamed_addr constant [7 x i8] c"missing"
@.str.273 = unnamed_addr constant [0 x i8] zeroinitializer
@.panic_msg.274 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.275 = constant [9 x i8] c"<unknown>"
@.str.276 = unnamed_addr constant [11 x i8] c"request_key"
@.str.277 = unnamed_addr constant [0 x i8] zeroinitializer
@.panic_msg.278 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.279 = constant [9 x i8] c"<unknown>"
@.str.280 = unnamed_addr constant [0 x i8] zeroinitializer
@.panic_msg.281 = constant [30 x i8] c"non-exhaustive match in switch"
@.panic_file.282 = constant [9 x i8] c"<unknown>"
@.str.283 = unnamed_addr constant [30 x i8] c"[cluster-proof] Config error: "
@.str.284 = unnamed_addr constant [20 x i8] c"CLUSTER_PROOF_COOKIE"
@.str.285 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.286 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.287 = unnamed_addr constant [10 x i8] c"standalone"
@.str.288 = unnamed_addr constant [7 x i8] c"cluster"
@.str.289 = unnamed_addr constant [4 x i8] c"PORT"
@.str.290 = unnamed_addr constant [17 x i8] c"MESH_CLUSTER_PORT"
@.str.291 = unnamed_addr constant [19 x i8] c"MESH_DISCOVERY_SEED"
@.str.292 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.293 = unnamed_addr constant [11 x i8] c"/membership"
@.str.294 = unnamed_addr constant [5 x i8] c"/work"
@.str.295 = unnamed_addr constant [18 x i8] c"/work/:request_key"
@.str.296 = unnamed_addr constant [41 x i8] c"[cluster-proof] HTTP server starting on :"
@.str.297 = unnamed_addr constant [56 x i8] c"[cluster-proof] Config loaded mode=standalone http_port="
@.str.298 = unnamed_addr constant [14 x i8] c" cluster_port="
@.str.299 = unnamed_addr constant [40 x i8] c" discovery_provider=none discovery_seed="
@.str.300 = unnamed_addr constant [48 x i8] c"[cluster-proof] Config loaded mode=cluster node="
@.str.301 = unnamed_addr constant [11 x i8] c" http_port="
@.str.302 = unnamed_addr constant [14 x i8] c" cluster_port="
@.str.303 = unnamed_addr constant [39 x i8] c" discovery_provider=dns discovery_seed="
@.str.304 = unnamed_addr constant [30 x i8] c"[cluster-proof] Node started: "
@.str.305 = unnamed_addr constant [39 x i8] c"[cluster-proof] Node start failed node="
@.str.306 = unnamed_addr constant [6 x i8] c" code="
@.str.307 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.308 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.309 = unnamed_addr constant [0 x i8] zeroinitializer
@.str.310 = unnamed_addr constant [10 x i8] c"standalone"
@fn_reg_ToJson__to_json__MembershipPayload = private unnamed_addr constant [35 x i8] c"ToJson__to_json__MembershipPayload\00", align 1
@fn_reg_membership_snapshot = private unnamed_addr constant [20 x i8] c"membership_snapshot\00", align 1
@fn_reg_current_self_name = private unnamed_addr constant [18 x i8] c"current_self_name\00", align 1
@fn_reg_current_membership = private unnamed_addr constant [19 x i8] c"current_membership\00", align 1
@fn_reg_membership_payload = private unnamed_addr constant [19 x i8] c"membership_payload\00", align 1
@fn_reg_http_port_key = private unnamed_addr constant [14 x i8] c"http_port_key\00", align 1
@fn_reg_cluster_port_key = private unnamed_addr constant [17 x i8] c"cluster_port_key\00", align 1
@fn_reg_cookie_key = private unnamed_addr constant [11 x i8] c"cookie_key\00", align 1
@fn_reg_discovery_seed_key = private unnamed_addr constant [19 x i8] c"discovery_seed_key\00", align 1
@fn_reg_node_basename_key = private unnamed_addr constant [18 x i8] c"node_basename_key\00", align 1
@fn_reg_advertise_host_key = private unnamed_addr constant [19 x i8] c"advertise_host_key\00", align 1
@fn_reg_missing_required_env = private unnamed_addr constant [21 x i8] c"missing_required_env\00", align 1
@fn_reg_invalid_positive_int = private unnamed_addr constant [21 x i8] c"invalid_positive_int\00", align 1
@fn_reg_cluster_cookie_required = private unnamed_addr constant [24 x i8] c"cluster_cookie_required\00", align 1
@fn_reg_explicit_identity_required = private unnamed_addr constant [27 x i8] c"explicit_identity_required\00", align 1
@fn_reg_fly_identity_required = private unnamed_addr constant [22 x i8] c"fly_identity_required\00", align 1
@fn_reg_missing_identity_source = private unnamed_addr constant [24 x i8] c"missing_identity_source\00", align 1
@fn_reg_Config__invalid_cluster_identity = private unnamed_addr constant [33 x i8] c"Config__invalid_cluster_identity\00", align 1
@fn_reg_Config__any_fly_identity_set = private unnamed_addr constant [29 x i8] c"Config__any_fly_identity_set\00", align 1
@fn_reg_Config__has_cluster_hint = private unnamed_addr constant [25 x i8] c"Config__has_cluster_hint\00", align 1
@fn_reg_Config__positive_env_int = private unnamed_addr constant [25 x i8] c"Config__positive_env_int\00", align 1
@fn_reg_Config__normalized_host_or_empty = private unnamed_addr constant [33 x i8] c"Config__normalized_host_or_empty\00", align 1
@fn_reg_Config__validated_basename_or_empty = private unnamed_addr constant [36 x i8] c"Config__validated_basename_or_empty\00", align 1
@fn_reg_Config__host_validation_error = private unnamed_addr constant [30 x i8] c"Config__host_validation_error\00", align 1
@fn_reg_http_port = private unnamed_addr constant [10 x i8] c"http_port\00", align 1
@fn_reg_cluster_port = private unnamed_addr constant [13 x i8] c"cluster_port\00", align 1
@fn_reg_cookie = private unnamed_addr constant [7 x i8] c"cookie\00", align 1
@fn_reg_discovery_seed = private unnamed_addr constant [15 x i8] c"discovery_seed\00", align 1
@fn_reg_mode = private unnamed_addr constant [5 x i8] c"mode\00", align 1
@fn_reg_mode_error = private unnamed_addr constant [11 x i8] c"mode_error\00", align 1
@fn_reg_node_name = private unnamed_addr constant [10 x i8] c"node_name\00", align 1
@fn_reg_node_name_error = private unnamed_addr constant [16 x i8] c"node_name_error\00", align 1
@fn_reg_FromJson__from_json__WorkSubmitBody = private unnamed_addr constant [36 x i8] c"FromJson__from_json__WorkSubmitBody\00", align 1
@fn_reg_ToJson__to_json__WorkStatusPayload = private unnamed_addr constant [35 x i8] c"ToJson__to_json__WorkStatusPayload\00", align 1
@fn_reg_Work__build_membership = private unnamed_addr constant [23 x i8] c"Work__build_membership\00", align 1
@fn_reg_Work__find_index = private unnamed_addr constant [17 x i8] c"Work__find_index\00", align 1
@fn_reg_Work__find_first_peer_index = private unnamed_addr constant [28 x i8] c"Work__find_first_peer_index\00", align 1
@fn_reg_Work__max_request_key_length = private unnamed_addr constant [29 x i8] c"Work__max_request_key_length\00", align 1
@fn_reg_Work__pending_phase = private unnamed_addr constant [20 x i8] c"Work__pending_phase\00", align 1
@fn_reg_Work__pending_result = private unnamed_addr constant [21 x i8] c"Work__pending_result\00", align 1
@fn_reg_Work__completed_phase = private unnamed_addr constant [22 x i8] c"Work__completed_phase\00", align 1
@fn_reg_Work__succeeded_result = private unnamed_addr constant [23 x i8] c"Work__succeeded_result\00", align 1
@fn_reg_Work__missing_phase = private unnamed_addr constant [20 x i8] c"Work__missing_phase\00", align 1
@fn_reg_Work__unknown_result = private unnamed_addr constant [21 x i8] c"Work__unknown_result\00", align 1
@fn_reg_Work__invalid_phase = private unnamed_addr constant [20 x i8] c"Work__invalid_phase\00", align 1
@fn_reg_Work__rejected_result = private unnamed_addr constant [22 x i8] c"Work__rejected_result\00", align 1
@fn_reg_Work__unassigned_replica_status = private unnamed_addr constant [32 x i8] c"Work__unassigned_replica_status\00", align 1
@fn_reg_Work__assigned_replica_status = private unnamed_addr constant [30 x i8] c"Work__assigned_replica_status\00", align 1
@fn_reg_Work__payload_hash = private unnamed_addr constant [19 x i8] c"Work__payload_hash\00", align 1
@fn_reg_attempt_id_from_token = private unnamed_addr constant [22 x i8] c"attempt_id_from_token\00", align 1
@fn_reg_request_registry_name_for_node = private unnamed_addr constant [31 x i8] c"request_registry_name_for_node\00", align 1
@fn_reg_Work__standalone_work_node_name = private unnamed_addr constant [32 x i8] c"Work__standalone_work_node_name\00", align 1
@fn_reg_Work__effective_work_node_name = private unnamed_addr constant [31 x i8] c"Work__effective_work_node_name\00", align 1
@fn_reg_resolve_member_at = private unnamed_addr constant [18 x i8] c"resolve_member_at\00", align 1
@fn_reg_route_selection = private unnamed_addr constant [16 x i8] c"route_selection\00", align 1
@fn_reg_selection_membership = private unnamed_addr constant [21 x i8] c"selection_membership\00", align 1
@fn_reg_selection_ingress_index = private unnamed_addr constant [24 x i8] c"selection_ingress_index\00", align 1
@fn_reg_selection_target_index = private unnamed_addr constant [23 x i8] c"selection_target_index\00", align 1
@fn_reg_selection_routed_remotely = private unnamed_addr constant [26 x i8] c"selection_routed_remotely\00", align 1
@fn_reg_selection_fell_back_locally = private unnamed_addr constant [28 x i8] c"selection_fell_back_locally\00", align 1
@fn_reg_validate_request_key = private unnamed_addr constant [21 x i8] c"validate_request_key\00", align 1
@fn_reg_Work__validate_payload = private unnamed_addr constant [23 x i8] c"Work__validate_payload\00", align 1
@fn_reg_Work__normalize_submit_body = private unnamed_addr constant [28 x i8] c"Work__normalize_submit_body\00", align 1
@fn_reg_parse_submit_body = private unnamed_addr constant [18 x i8] c"parse_submit_body\00", align 1
@fn_reg_Work__status_payload_from_fields = private unnamed_addr constant [33 x i8] c"Work__status_payload_from_fields\00", align 1
@fn_reg_Work__status_payload_from_record = private unnamed_addr constant [33 x i8] c"Work__status_payload_from_record\00", align 1
@fn_reg_status_payload_json = private unnamed_addr constant [20 x i8] c"status_payload_json\00", align 1
@fn_reg_Work__missing_status_payload_json = private unnamed_addr constant [34 x i8] c"Work__missing_status_payload_json\00", align 1
@fn_reg_Work__invalid_request_payload_json = private unnamed_addr constant [35 x i8] c"Work__invalid_request_payload_json\00", align 1
@fn_reg_Work__invalid_selection_payload_json = private unnamed_addr constant [37 x i8] c"Work__invalid_selection_payload_json\00", align 1
@fn_reg_initial_request_registry_state = private unnamed_addr constant [31 x i8] c"initial_request_registry_state\00", align 1
@fn_reg_Work__make_request_record = private unnamed_addr constant [26 x i8] c"Work__make_request_record\00", align 1
@fn_reg_Work__submit_decision = private unnamed_addr constant [22 x i8] c"Work__submit_decision\00", align 1
@fn_reg_Work__submit_next_state = private unnamed_addr constant [24 x i8] c"Work__submit_next_state\00", align 1
@fn_reg_lookup_request = private unnamed_addr constant [15 x i8] c"lookup_request\00", align 1
@fn_reg_Work__transition_completed_record = private unnamed_addr constant [34 x i8] c"Work__transition_completed_record\00", align 1
@fn_reg_Work__apply_completion_from_record = private unnamed_addr constant [35 x i8] c"Work__apply_completion_from_record\00", align 1
@fn_reg_apply_completion = private unnamed_addr constant [17 x i8] c"apply_completion\00", align 1
@fn_reg_Work__log_submit = private unnamed_addr constant [17 x i8] c"Work__log_submit\00", align 1
@fn_reg_Work__log_dedupe = private unnamed_addr constant [17 x i8] c"Work__log_dedupe\00", align 1
@fn_reg_Work__log_conflict = private unnamed_addr constant [19 x i8] c"Work__log_conflict\00", align 1
@fn_reg_Work__log_status = private unnamed_addr constant [17 x i8] c"Work__log_status\00", align 1
@fn_reg_Work__log_status_missing = private unnamed_addr constant [25 x i8] c"Work__log_status_missing\00", align 1
@fn_reg_Work__log_status_transition = private unnamed_addr constant [28 x i8] c"Work__log_status_transition\00", align 1
@fn_reg_Work__log_status_transition_rejected = private unnamed_addr constant [37 x i8] c"Work__log_status_transition_rejected\00", align 1
@fn_reg_Work__log_invalid_selection = private unnamed_addr constant [28 x i8] c"Work__log_invalid_selection\00", align 1
@fn_reg_Work__registry_message = private unnamed_addr constant [23 x i8] c"Work__registry_message\00", align 1
@fn_reg_Work__registry_message_kind = private unnamed_addr constant [28 x i8] c"Work__registry_message_kind\00", align 1
@fn_reg_Work__registry_message_json = private unnamed_addr constant [28 x i8] c"Work__registry_message_json\00", align 1
@fn_reg_Work__status_found_response = private unnamed_addr constant [28 x i8] c"Work__status_found_response\00", align 1
@fn_reg_Work__status_missing_response = private unnamed_addr constant [30 x i8] c"Work__status_missing_response\00", align 1
@fn_reg_Work__log_status_transition_and_continue = private unnamed_addr constant [41 x i8] c"Work__log_status_transition_and_continue\00", align 1
@fn_reg_Work__mark_completed_success = private unnamed_addr constant [29 x i8] c"Work__mark_completed_success\00", align 1
@fn_reg_Work__mark_completed_error = private unnamed_addr constant [27 x i8] c"Work__mark_completed_error\00", align 1
@fn_reg_Work__submit_created_response = private unnamed_addr constant [30 x i8] c"Work__submit_created_response\00", align 1
@fn_reg_Work__submit_duplicate_response = private unnamed_addr constant [32 x i8] c"Work__submit_duplicate_response\00", align 1
@fn_reg_Work__submit_conflict_response = private unnamed_addr constant [31 x i8] c"Work__submit_conflict_response\00", align 1
@fn_reg_Work__submit_registry_response = private unnamed_addr constant [31 x i8] c"Work__submit_registry_response\00", align 1
@fn_reg_Work__get_status_registry_response = private unnamed_addr constant [35 x i8] c"Work__get_status_registry_response\00", align 1
@fn_reg_Work__mark_completed_registry_state = private unnamed_addr constant [36 x i8] c"Work__mark_completed_registry_state\00", align 1
@fn_reg_Work__local_request_registry_name = private unnamed_addr constant [34 x i8] c"Work__local_request_registry_name\00", align 1
@fn_reg_Work__local_request_registry_pid = private unnamed_addr constant [33 x i8] c"Work__local_request_registry_pid\00", align 1
@fn_reg_Work__request_registry_pid_for_node = private unnamed_addr constant [36 x i8] c"Work__request_registry_pid_for_node\00", align 1
@fn_reg_Work__register_global_request_registry = private unnamed_addr constant [39 x i8] c"Work__register_global_request_registry\00", align 1
@fn_reg_Work__current_target_selection = private unnamed_addr constant [31 x i8] c"Work__current_target_selection\00", align 1
@fn_reg_execute_work = private unnamed_addr constant [13 x i8] c"execute_work\00", align 1
@fn_reg_Work__dispatch_work = private unnamed_addr constant [20 x i8] c"Work__dispatch_work\00", align 1
@fn_reg_start_work_services = private unnamed_addr constant [20 x i8] c"start_work_services\00", align 1
@fn_reg_Work__handle_valid_submit = private unnamed_addr constant [26 x i8] c"Work__handle_valid_submit\00", align 1
@fn_reg_Work__handle_valid_status = private unnamed_addr constant [26 x i8] c"Work__handle_valid_status\00", align 1
@fn_reg_handle_work_submit = private unnamed_addr constant [19 x i8] c"handle_work_submit\00", align 1
@fn_reg_handle_work_status = private unnamed_addr constant [19 x i8] c"handle_work_status\00", align 1
@fn_reg_Main__log_config_error = private unnamed_addr constant [23 x i8] c"Main__log_config_error\00", align 1
@fn_reg_Main__current_mode = private unnamed_addr constant [19 x i8] c"Main__current_mode\00", align 1
@fn_reg_Main__current_http_port = private unnamed_addr constant [24 x i8] c"Main__current_http_port\00", align 1
@fn_reg_Main__current_cluster_port = private unnamed_addr constant [27 x i8] c"Main__current_cluster_port\00", align 1
@fn_reg_Main__current_discovery_seed = private unnamed_addr constant [29 x i8] c"Main__current_discovery_seed\00", align 1
@fn_reg_Main__handle_membership = private unnamed_addr constant [24 x i8] c"Main__handle_membership\00", align 1
@fn_reg_Main__start_http_server = private unnamed_addr constant [24 x i8] c"Main__start_http_server\00", align 1
@fn_reg_Main__start_standalone = private unnamed_addr constant [23 x i8] c"Main__start_standalone\00", align 1
@fn_reg_Main__start_cluster = private unnamed_addr constant [20 x i8] c"Main__start_cluster\00", align 1
@fn_reg_Main__maybe_start_cluster = private unnamed_addr constant [26 x i8] c"Main__maybe_start_cluster\00", align 1
@fn_reg_Main__maybe_start_with_mode = private unnamed_addr constant [28 x i8] c"Main__maybe_start_with_mode\00", align 1
@fn_reg_mesh_main = private unnamed_addr constant [10 x i8] c"mesh_main\00", align 1

declare void @mesh_rt_init()

declare ptr @mesh_gc_alloc_actor(i64, i64)

declare ptr @mesh_string_new(ptr, i64)

declare ptr @mesh_string_concat(ptr, ptr)

declare ptr @mesh_int_to_string(i64)

declare ptr @mesh_float_to_string(double)

declare ptr @mesh_bool_to_string(i8)

declare void @mesh_print(ptr)

declare void @mesh_println(ptr)

declare void @mesh_rt_init_actor(i32)

declare i64 @mesh_actor_spawn(ptr, ptr, i64, i8)

declare void @mesh_actor_send(i64, ptr, i64)

declare ptr @mesh_actor_receive(i64)

declare i64 @mesh_actor_self()

declare void @mesh_actor_link(i64)

declare void @mesh_reduction_check()

declare void @mesh_actor_set_terminate(i64, ptr)

declare void @mesh_rt_run_scheduler()

declare i64 @mesh_supervisor_start(ptr, i64)

declare i64 @mesh_supervisor_start_child(i64, ptr, i64)

declare i64 @mesh_supervisor_terminate_child(i64, i64)

declare i64 @mesh_supervisor_count_children(i64)

declare void @mesh_actor_trap_exit()

declare void @mesh_actor_exit(i64, i8)

declare i64 @mesh_string_length(ptr)

declare ptr @mesh_string_slice(ptr, i64, i64)

declare i8 @mesh_string_contains(ptr, ptr)

declare i8 @mesh_string_starts_with(ptr, ptr)

declare i8 @mesh_string_ends_with(ptr, ptr)

declare ptr @mesh_string_trim(ptr)

declare ptr @mesh_string_to_upper(ptr)

declare ptr @mesh_string_to_lower(ptr)

declare ptr @mesh_string_replace(ptr, ptr, ptr)

declare i8 @mesh_string_eq(ptr, ptr)

declare ptr @mesh_string_split(ptr, ptr)

declare ptr @mesh_string_join(ptr, ptr)

declare ptr @mesh_string_to_int(ptr)

declare ptr @mesh_string_to_float(ptr)

declare ptr @mesh_file_read(ptr)

declare ptr @mesh_file_write(ptr, ptr)

declare ptr @mesh_file_append(ptr, ptr)

declare i8 @mesh_file_exists(ptr)

declare ptr @mesh_file_delete(ptr)

declare ptr @mesh_io_read_line()

declare void @mesh_io_eprintln(ptr)

declare ptr @mesh_env_get(ptr)

declare ptr @mesh_env_args()

declare ptr @mesh_env_get_with_default(ptr, ptr)

declare i64 @mesh_env_get_int(ptr, i64)

declare ptr @mesh_regex_from_literal(ptr, i64)

declare ptr @mesh_regex_compile(ptr)

declare i8 @mesh_regex_match(ptr, ptr)

declare ptr @mesh_regex_captures(ptr, ptr)

declare ptr @mesh_regex_replace(ptr, ptr, ptr)

declare ptr @mesh_regex_split(ptr, ptr)

declare ptr @mesh_crypto_sha256(ptr)

declare ptr @mesh_crypto_sha512(ptr)

declare ptr @mesh_crypto_hmac_sha256(ptr, ptr)

declare ptr @mesh_crypto_hmac_sha512(ptr, ptr)

declare i8 @mesh_crypto_secure_compare(ptr, ptr)

declare ptr @mesh_crypto_uuid4()

declare ptr @mesh_base64_encode(ptr)

declare ptr @mesh_base64_decode(ptr)

declare ptr @mesh_base64_encode_url(ptr)

declare ptr @mesh_base64_decode_url(ptr)

declare ptr @mesh_hex_encode(ptr)

declare ptr @mesh_hex_decode(ptr)

declare i64 @mesh_datetime_utc_now()

declare ptr @mesh_datetime_from_iso8601(ptr)

declare ptr @mesh_datetime_to_iso8601(i64)

declare ptr @mesh_datetime_from_unix_ms(i64)

declare i64 @mesh_datetime_to_unix_ms(i64)

declare ptr @mesh_datetime_from_unix_secs(i64)

declare i64 @mesh_datetime_to_unix_secs(i64)

declare i64 @mesh_datetime_add(i64, i64, ptr)

declare double @mesh_datetime_diff(i64, i64, ptr)

declare i8 @mesh_datetime_before(i64, i64)

declare i8 @mesh_datetime_after(i64, i64)

declare i64 @mesh_http_build(ptr, ptr)

declare i64 @mesh_http_header(i64, ptr, ptr)

declare i64 @mesh_http_body(i64, ptr)

declare i64 @mesh_http_timeout(i64, i64)

declare i64 @mesh_http_query(i64, ptr, ptr)

declare i64 @mesh_http_json(i64, ptr)

declare ptr @mesh_http_send(i64)

declare i64 @mesh_http_stream(i64, ptr, ptr)

declare i64 @mesh_http_stream_bytes(i64, ptr, ptr)

declare void @mesh_http_cancel(i64)

declare i64 @mesh_http_client()

declare ptr @mesh_http_send_with(i64, i64)

declare void @mesh_http_client_close(i64)

declare void @mesh_test_begin(ptr)

declare void @mesh_test_pass()

declare void @mesh_test_fail_msg(ptr)

declare void @mesh_test_assert(i8, ptr, ptr, i64, i64)

declare void @mesh_test_assert_eq(ptr, ptr, ptr, ptr, i64, i64)

declare void @mesh_test_assert_ne(ptr, ptr, ptr, ptr, i64, i64)

declare void @mesh_test_assert_raises(ptr, ptr, ptr, i64, i64)

declare void @mesh_test_summary(i64, i64, i64)

declare void @mesh_test_cleanup_actors()

declare void @mesh_test_run_body(ptr, ptr)

declare i64 @mesh_test_mock_actor(ptr, ptr)

declare i64 @mesh_test_pass_count()

declare i64 @mesh_test_fail_count()

declare ptr @mesh_list_new()

declare i64 @mesh_list_length(ptr)

declare ptr @mesh_list_append(ptr, i64)

declare i64 @mesh_list_head(ptr)

declare ptr @mesh_list_tail(ptr)

declare i64 @mesh_list_get(ptr, i64)

declare ptr @mesh_list_concat(ptr, ptr)

declare ptr @mesh_list_reverse(ptr)

declare ptr @mesh_list_map(ptr, ptr, ptr)

declare ptr @mesh_list_filter(ptr, ptr, ptr)

declare i64 @mesh_list_reduce(ptr, i64, ptr, ptr)

declare ptr @mesh_list_from_array(ptr, i64)

declare ptr @mesh_list_builder_new(i64)

declare void @mesh_list_builder_push(ptr, i64)

declare ptr @mesh_list_sort(ptr, ptr, ptr)

declare ptr @mesh_list_find(ptr, ptr, ptr)

declare i8 @mesh_list_any(ptr, ptr, ptr)

declare i8 @mesh_list_all(ptr, ptr, ptr)

declare i8 @mesh_list_contains(ptr, i64)

declare i8 @mesh_list_contains_str(ptr, ptr)

declare ptr @mesh_list_zip(ptr, ptr)

declare ptr @mesh_list_flat_map(ptr, ptr, ptr)

declare ptr @mesh_list_flatten(ptr)

declare ptr @mesh_list_enumerate(ptr)

declare ptr @mesh_list_take(ptr, i64)

declare ptr @mesh_list_drop(ptr, i64)

declare i64 @mesh_list_last(ptr)

declare i64 @mesh_list_nth(ptr, i64)

declare ptr @mesh_map_new()

declare ptr @mesh_map_new_typed(i64)

declare ptr @mesh_map_tag_string(ptr)

declare ptr @mesh_map_put(ptr, i64, i64)

declare i64 @mesh_map_get(ptr, i64)

declare i8 @mesh_map_has_key(ptr, i64)

declare ptr @mesh_map_delete(ptr, i64)

declare i64 @mesh_map_size(ptr)

declare ptr @mesh_map_keys(ptr)

declare ptr @mesh_map_values(ptr)

declare ptr @mesh_map_merge(ptr, ptr)

declare ptr @mesh_map_to_list(ptr)

declare ptr @mesh_map_from_list(ptr)

declare i64 @mesh_map_entry_key(ptr, i64)

declare i64 @mesh_map_entry_value(ptr, i64)

declare ptr @mesh_set_new()

declare ptr @mesh_set_add(ptr, i64)

declare ptr @mesh_set_remove(ptr, i64)

declare i8 @mesh_set_contains(ptr, i64)

declare i64 @mesh_set_size(ptr)

declare ptr @mesh_set_union(ptr, ptr)

declare ptr @mesh_set_intersection(ptr, ptr)

declare i64 @mesh_set_element_at(ptr, i64)

declare ptr @mesh_set_difference(ptr, ptr)

declare ptr @mesh_set_to_list(ptr)

declare ptr @mesh_set_from_list(ptr)

declare i64 @mesh_tuple_nth(ptr, i64)

declare i64 @mesh_tuple_first(ptr)

declare i64 @mesh_tuple_second(ptr)

declare i64 @mesh_tuple_size(ptr)

declare ptr @mesh_range_new(i64, i64)

declare ptr @mesh_range_to_list(ptr)

declare ptr @mesh_range_map(ptr, ptr, ptr)

declare ptr @mesh_range_filter(ptr, ptr, ptr)

declare i64 @mesh_range_length(ptr)

declare ptr @mesh_queue_new()

declare ptr @mesh_queue_push(ptr, i64)

declare ptr @mesh_queue_pop(ptr)

declare i64 @mesh_queue_peek(ptr)

declare i64 @mesh_queue_size(ptr)

declare i8 @mesh_queue_is_empty(ptr)

declare ptr @mesh_json_parse(ptr)

declare ptr @mesh_json_parse_raw(ptr)

declare ptr @mesh_json_encode(ptr)

declare ptr @mesh_json_encode_string(ptr)

declare ptr @mesh_json_encode_int(i64)

declare ptr @mesh_json_encode_bool(i8)

declare ptr @mesh_json_encode_map(ptr)

declare ptr @mesh_json_encode_list(ptr)

declare ptr @mesh_json_from_int(i64)

declare ptr @mesh_json_from_float(double)

declare ptr @mesh_json_from_bool(i8)

declare ptr @mesh_json_from_string(ptr)

declare ptr @mesh_json_get(ptr, ptr)

declare ptr @mesh_json_get_nested(ptr, ptr, ptr)

declare ptr @mesh_json_object_new()

declare ptr @mesh_json_object_put(ptr, ptr, ptr)

declare ptr @mesh_json_object_get(ptr, ptr)

declare ptr @mesh_json_array_new()

declare ptr @mesh_json_array_push(ptr, ptr)

declare ptr @mesh_json_array_get(ptr, i64)

declare ptr @mesh_json_as_int(ptr)

declare ptr @mesh_json_as_float(ptr)

declare ptr @mesh_json_as_string(ptr)

declare ptr @mesh_json_as_bool(ptr)

declare ptr @mesh_json_null()

declare ptr @mesh_json_from_list(ptr, ptr)

declare ptr @mesh_json_from_map(ptr, ptr)

declare ptr @mesh_json_to_list(ptr, ptr)

declare ptr @mesh_json_to_map(ptr, ptr)

declare ptr @mesh_alloc_result(i64, ptr)

declare i64 @mesh_result_is_ok(ptr)

declare ptr @mesh_result_unwrap(ptr)

declare ptr @mesh_http_router()

declare ptr @mesh_http_route(ptr, ptr, ptr)

declare void @mesh_http_serve(ptr, i64)

declare void @mesh_http_serve_tls(ptr, i64, ptr, ptr)

declare void @mesh_ws_serve(ptr, ptr, ptr, ptr, ptr, ptr, i64)

declare i64 @mesh_ws_send(ptr, ptr)

declare i64 @mesh_ws_send_binary(ptr, ptr, i64)

declare void @mesh_ws_serve_tls(ptr, ptr, ptr, ptr, ptr, ptr, i64, ptr, ptr)

declare i64 @mesh_ws_join(ptr, ptr)

declare i64 @mesh_ws_leave(ptr, ptr)

declare i64 @mesh_ws_broadcast(ptr, ptr)

declare i64 @mesh_ws_broadcast_except(ptr, ptr, ptr)

declare ptr @mesh_http_response_new(i64, ptr)

declare ptr @mesh_http_response_with_headers(i64, ptr, ptr)

declare ptr @mesh_http_get(ptr)

declare ptr @mesh_http_post(ptr, ptr)

declare ptr @mesh_http_request_method(ptr)

declare ptr @mesh_http_request_path(ptr)

declare ptr @mesh_http_request_body(ptr)

declare ptr @mesh_http_request_header(ptr, ptr)

declare ptr @mesh_http_request_query(ptr, ptr)

declare ptr @mesh_http_route_get(ptr, ptr, ptr)

declare ptr @mesh_http_route_post(ptr, ptr, ptr)

declare ptr @mesh_http_route_put(ptr, ptr, ptr)

declare ptr @mesh_http_route_delete(ptr, ptr, ptr)

declare ptr @mesh_http_request_param(ptr, ptr)

declare ptr @mesh_http_use_middleware(ptr, ptr)

declare ptr @mesh_sqlite_open(ptr)

declare void @mesh_sqlite_close(i64)

declare ptr @mesh_sqlite_execute(i64, ptr, ptr)

declare ptr @mesh_sqlite_query(i64, ptr, ptr)

declare ptr @mesh_pg_connect(ptr)

declare void @mesh_pg_close(i64)

declare ptr @mesh_pg_execute(i64, ptr, ptr)

declare ptr @mesh_pg_query(i64, ptr, ptr)

declare ptr @mesh_pg_begin(i64)

declare ptr @mesh_pg_commit(i64)

declare ptr @mesh_pg_rollback(i64)

declare ptr @mesh_pg_transaction(i64, ptr, ptr)

declare ptr @mesh_pg_cast(ptr, ptr)

declare ptr @mesh_pg_jsonb(ptr)

declare ptr @mesh_pg_int(ptr)

declare ptr @mesh_pg_text(ptr)

declare ptr @mesh_pg_uuid(ptr)

declare ptr @mesh_pg_timestamptz(ptr)

declare ptr @mesh_pg_gen_salt(ptr, i64)

declare ptr @mesh_pg_crypt(ptr, ptr)

declare ptr @mesh_pg_ts_rank(ptr, ptr)

declare ptr @mesh_pg_tsvector_matches(ptr, ptr)

declare ptr @mesh_pg_jsonb_contains(ptr, ptr)

declare ptr @mesh_pg_to_tsvector(ptr, ptr)

declare ptr @mesh_pg_plainto_tsquery(ptr, ptr)

declare ptr @mesh_pg_create_extension(i64, ptr)

declare ptr @mesh_pg_create_range_partitioned_table(i64, ptr, ptr, ptr)

declare ptr @mesh_pg_create_gin_index(i64, ptr, ptr, ptr, ptr)

declare ptr @mesh_pg_create_daily_partitions_ahead(i64, ptr, i64)

declare ptr @mesh_pg_list_daily_partitions_before(i64, ptr, i64)

declare ptr @mesh_pg_drop_partition(i64, ptr)

declare ptr @mesh_sqlite_begin(i64)

declare ptr @mesh_sqlite_commit(i64)

declare ptr @mesh_sqlite_rollback(i64)

declare ptr @mesh_pool_open(ptr, i64, i64, i64)

declare void @mesh_pool_close(i64)

declare ptr @mesh_pool_checkout(i64)

declare void @mesh_pool_checkin(i64, i64)

declare ptr @mesh_pool_query(i64, ptr, ptr)

declare ptr @mesh_pool_execute(i64, ptr, ptr)

declare ptr @mesh_row_from_row_get(ptr, ptr)

declare ptr @mesh_row_parse_int(ptr)

declare ptr @mesh_row_parse_float(ptr)

declare ptr @mesh_row_parse_bool(ptr)

declare ptr @mesh_pg_query_as(i64, ptr, ptr, ptr)

declare ptr @mesh_pool_query_as(i64, ptr, ptr, ptr)

declare i64 @mesh_hash_int(i64)

declare i64 @mesh_hash_float(double)

declare i64 @mesh_hash_bool(i8)

declare i64 @mesh_hash_string(ptr)

declare i64 @mesh_hash_combine(i64, i64)

declare ptr @mesh_list_to_string(ptr, ptr)

declare ptr @mesh_map_to_string(ptr, ptr, ptr)

declare ptr @mesh_set_to_string(ptr, ptr)

declare ptr @mesh_string_to_string(i64)

declare i8 @mesh_list_eq(ptr, ptr, ptr)

declare i64 @mesh_list_compare(ptr, ptr, ptr)

declare ptr @mesh_service_call(i64, i64, ptr, i64)

declare void @mesh_service_reply(i64, ptr, i64)

declare i64 @mesh_job_async(ptr, ptr)

declare ptr @mesh_job_await(i64)

declare ptr @mesh_job_await_timeout(i64, i64)

declare ptr @mesh_job_map(ptr, ptr, ptr)

declare void @mesh_timer_sleep(i64)

declare void @mesh_timer_send_after(i64, i64, ptr, i64)

; Function Attrs: noreturn
declare void @mesh_panic(ptr, i64, ptr, i64, i32) #0

declare i64 @mesh_node_start(ptr, i64, ptr, i64)

declare i64 @mesh_node_connect(ptr, i64)

declare ptr @mesh_node_self()

declare ptr @mesh_node_list()

declare i64 @mesh_node_monitor(ptr, i64)

declare i64 @mesh_node_spawn(ptr, i64, ptr, i64, ptr, i64, i8)

declare void @mesh_register_function(ptr, i64, ptr)

declare i64 @mesh_process_monitor(i64)

declare i64 @mesh_process_demonitor(i64)

declare i64 @mesh_process_register(ptr, i64)

declare i64 @mesh_process_whereis(ptr)

declare void @mesh_actor_send_named(ptr, i64, ptr, i64, ptr, i64)

declare ptr @mesh_list_iter_new(ptr)

declare ptr @mesh_list_iter_next(ptr)

declare ptr @mesh_map_iter_new(ptr)

declare ptr @mesh_map_iter_next(ptr)

declare ptr @mesh_set_iter_new(ptr)

declare ptr @mesh_set_iter_next(ptr)

declare ptr @mesh_range_iter_new(i64, i64)

declare ptr @mesh_range_iter_next(ptr)

declare ptr @mesh_iter_from(ptr)

declare ptr @mesh_iter_map(ptr, ptr, ptr)

declare ptr @mesh_iter_filter(ptr, ptr, ptr)

declare ptr @mesh_iter_take(ptr, i64)

declare ptr @mesh_iter_skip(ptr, i64)

declare ptr @mesh_iter_enumerate(ptr)

declare ptr @mesh_iter_zip(ptr, ptr)

declare i64 @mesh_iter_count(ptr)

declare i64 @mesh_iter_sum(ptr)

declare i8 @mesh_iter_any(ptr, ptr, ptr)

declare i8 @mesh_iter_all(ptr, ptr, ptr)

declare ptr @mesh_iter_find(ptr, ptr, ptr)

declare i64 @mesh_iter_reduce(ptr, i64, ptr, ptr)

declare ptr @mesh_iter_generic_next(ptr)

declare ptr @mesh_iter_map_next(ptr)

declare ptr @mesh_iter_filter_next(ptr)

declare ptr @mesh_iter_take_next(ptr)

declare ptr @mesh_iter_skip_next(ptr)

declare ptr @mesh_iter_enumerate_next(ptr)

declare ptr @mesh_iter_zip_next(ptr)

declare ptr @mesh_list_collect(ptr)

declare ptr @mesh_map_collect(ptr)

declare ptr @mesh_map_collect_string_keys(ptr)

declare ptr @mesh_set_collect(ptr)

declare ptr @mesh_string_collect(ptr)

declare ptr @mesh_orm_build_select(ptr, ptr, ptr, ptr, i64, i64)

declare ptr @mesh_orm_build_insert(ptr, ptr, ptr)

declare ptr @mesh_orm_build_update(ptr, ptr, ptr, ptr)

declare ptr @mesh_orm_build_delete(ptr, ptr, ptr)

declare ptr @mesh_expr_column(ptr)

declare ptr @mesh_expr_value(ptr)

declare ptr @mesh_expr_null()

declare ptr @mesh_expr_call(ptr, ptr)

declare ptr @mesh_expr_add(ptr, ptr)

declare ptr @mesh_expr_sub(ptr, ptr)

declare ptr @mesh_expr_mul(ptr, ptr)

declare ptr @mesh_expr_div(ptr, ptr)

declare ptr @mesh_expr_eq(ptr, ptr)

declare ptr @mesh_expr_neq(ptr, ptr)

declare ptr @mesh_expr_lt(ptr, ptr)

declare ptr @mesh_expr_lte(ptr, ptr)

declare ptr @mesh_expr_gt(ptr, ptr)

declare ptr @mesh_expr_gte(ptr, ptr)

declare ptr @mesh_expr_case(ptr, ptr, ptr)

declare ptr @mesh_expr_coalesce(ptr)

declare ptr @mesh_expr_excluded(ptr)

declare ptr @mesh_expr_alias(ptr, ptr)

declare ptr @mesh_query_from(ptr)

declare ptr @mesh_query_where(ptr, ptr, ptr)

declare ptr @mesh_query_where_op(ptr, ptr, ptr, ptr)

declare ptr @mesh_query_where_in(ptr, ptr, ptr)

declare ptr @mesh_query_where_null(ptr, ptr)

declare ptr @mesh_query_where_not_null(ptr, ptr)

declare ptr @mesh_query_where_not_in(ptr, ptr, ptr)

declare ptr @mesh_query_where_between(ptr, ptr, ptr, ptr)

declare ptr @mesh_query_where_or(ptr, ptr, ptr)

declare ptr @mesh_query_where_expr(ptr, ptr)

declare ptr @mesh_query_select(ptr, ptr)

declare ptr @mesh_query_select_expr(ptr, ptr)

declare ptr @mesh_query_select_exprs(ptr, ptr)

declare ptr @mesh_query_order_by(ptr, ptr, ptr)

declare ptr @mesh_query_limit(ptr, i64)

declare ptr @mesh_query_offset(ptr, i64)

declare ptr @mesh_query_join(ptr, ptr, ptr, ptr)

declare ptr @mesh_query_join_as(ptr, ptr, ptr, ptr, ptr)

declare ptr @mesh_query_group_by(ptr, ptr)

declare ptr @mesh_query_having(ptr, ptr, ptr)

declare ptr @mesh_query_select_count(ptr)

declare ptr @mesh_query_select_count_field(ptr, ptr)

declare ptr @mesh_query_select_sum(ptr, ptr)

declare ptr @mesh_query_select_avg(ptr, ptr)

declare ptr @mesh_query_select_min(ptr, ptr)

declare ptr @mesh_query_select_max(ptr, ptr)

declare ptr @mesh_query_fragment(ptr, ptr, ptr)

declare ptr @mesh_query_select_raw(ptr, ptr)

declare ptr @mesh_query_where_raw(ptr, ptr, ptr)

declare ptr @mesh_query_order_by_raw(ptr, ptr)

declare ptr @mesh_query_group_by_raw(ptr, ptr)

declare ptr @mesh_query_where_sub(ptr, ptr, ptr)

declare ptr @mesh_repo_all(i64, ptr)

declare ptr @mesh_repo_one(i64, ptr)

declare ptr @mesh_repo_get(i64, ptr, ptr)

declare ptr @mesh_repo_get_by(i64, ptr, ptr, ptr)

declare ptr @mesh_repo_count(i64, ptr)

declare ptr @mesh_repo_exists(i64, ptr)

declare ptr @mesh_repo_insert(i64, ptr, ptr)

declare ptr @mesh_repo_insert_expr(i64, ptr, ptr)

declare ptr @mesh_repo_update(i64, ptr, ptr, ptr)

declare ptr @mesh_repo_delete(i64, ptr, ptr)

declare ptr @mesh_repo_transaction(i64, ptr, ptr)

declare ptr @mesh_repo_update_where(i64, ptr, ptr, ptr)

declare ptr @mesh_repo_update_where_expr(i64, ptr, ptr, ptr)

declare ptr @mesh_repo_delete_where(i64, ptr, ptr)

declare ptr @mesh_repo_query_raw(i64, ptr, ptr)

declare ptr @mesh_repo_execute_raw(i64, ptr, ptr)

declare ptr @mesh_repo_insert_or_update(i64, ptr, ptr, ptr, ptr)

declare ptr @mesh_repo_insert_or_update_expr(i64, ptr, ptr, ptr, ptr)

declare ptr @mesh_repo_delete_where_returning(i64, ptr, ptr)

declare ptr @mesh_repo_preload(i64, ptr, ptr, ptr)

declare ptr @mesh_repo_insert_changeset(i64, ptr, ptr)

declare ptr @mesh_repo_update_changeset(i64, ptr, ptr, ptr)

declare ptr @mesh_changeset_cast(ptr, ptr, ptr)

declare ptr @mesh_changeset_cast_with_types(ptr, ptr, ptr, ptr)

declare ptr @mesh_changeset_validate_required(ptr, ptr)

declare ptr @mesh_changeset_validate_length(ptr, ptr, ptr, ptr)

declare ptr @mesh_changeset_validate_format(ptr, ptr, ptr)

declare ptr @mesh_changeset_validate_inclusion(ptr, ptr, ptr)

declare ptr @mesh_changeset_validate_number(ptr, ptr, ptr, ptr, ptr, ptr)

declare ptr @mesh_changeset_valid(ptr)

declare ptr @mesh_changeset_errors(ptr)

declare ptr @mesh_changeset_changes(ptr)

declare ptr @mesh_changeset_get_change(ptr, ptr)

declare ptr @mesh_changeset_get_error(ptr, ptr)

declare ptr @mesh_migration_create_table(i64, ptr, ptr)

declare ptr @mesh_migration_drop_table(i64, ptr)

declare ptr @mesh_migration_add_column(i64, ptr, ptr)

declare ptr @mesh_migration_drop_column(i64, ptr, ptr)

declare ptr @mesh_migration_rename_column(i64, ptr, ptr, ptr)

declare ptr @mesh_migration_create_index(i64, ptr, ptr, ptr)

declare ptr @mesh_migration_drop_index(i64, ptr, ptr)

declare ptr @mesh_migration_execute(i64, ptr)

declare i64 @mesh_global_register(ptr, i64, i64)

declare i64 @mesh_global_whereis(ptr, i64)

declare i64 @mesh_global_unregister(ptr, i64)

define ptr @ToJson__to_json__MembershipPayload(%MembershipPayload.2 %0) {
entry:
  %self = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %0, ptr %self, align 8
  %call = call ptr @mesh_json_object_new()
  %str = call ptr @mesh_string_new(ptr @.str, i64 4)
  %self1 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call2 = call ptr @mesh_json_from_string(ptr %field_val)
  %call3 = call ptr @mesh_json_object_put(ptr %call, ptr %str, ptr %call2)
  %str4 = call ptr @mesh_string_new(ptr @.str.1, i64 4)
  %self5 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp6 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self5, ptr %obj_tmp6, align 8
  %field_ptr7 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp6, i32 0, i32 1
  %field_val8 = load ptr, ptr %field_ptr7, align 8
  %call9 = call ptr @mesh_json_from_string(ptr %field_val8)
  %call10 = call ptr @mesh_json_object_put(ptr %call3, ptr %str4, ptr %call9)
  %str11 = call ptr @mesh_string_new(ptr @.str.2, i64 5)
  %self12 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp13 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self12, ptr %obj_tmp13, align 8
  %field_ptr14 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp13, i32 0, i32 2
  %field_val15 = load ptr, ptr %field_ptr14, align 8
  %call16 = call ptr @mesh_json_from_list(ptr %field_val15, ptr @mesh_json_from_string)
  %call17 = call ptr @mesh_json_object_put(ptr %call10, ptr %str11, ptr %call16)
  %str18 = call ptr @mesh_string_new(ptr @.str.3, i64 10)
  %self19 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp20 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self19, ptr %obj_tmp20, align 8
  %field_ptr21 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp20, i32 0, i32 3
  %field_val22 = load ptr, ptr %field_ptr21, align 8
  %call23 = call ptr @mesh_json_from_list(ptr %field_val22, ptr @mesh_json_from_string)
  %call24 = call ptr @mesh_json_object_put(ptr %call17, ptr %str18, ptr %call23)
  %str25 = call ptr @mesh_string_new(ptr @.str.4, i64 9)
  %self26 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp27 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self26, ptr %obj_tmp27, align 8
  %field_ptr28 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp27, i32 0, i32 4
  %field_val29 = load ptr, ptr %field_ptr28, align 8
  %call30 = call ptr @mesh_json_from_string(ptr %field_val29)
  %call31 = call ptr @mesh_json_object_put(ptr %call24, ptr %str25, ptr %call30)
  %str32 = call ptr @mesh_string_new(ptr @.str.5, i64 12)
  %self33 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp34 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self33, ptr %obj_tmp34, align 8
  %field_ptr35 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp34, i32 0, i32 5
  %field_val36 = load ptr, ptr %field_ptr35, align 8
  %call37 = call ptr @mesh_json_from_string(ptr %field_val36)
  %call38 = call ptr @mesh_json_object_put(ptr %call31, ptr %str32, ptr %call37)
  %str39 = call ptr @mesh_string_new(ptr @.str.6, i64 18)
  %self40 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp41 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self40, ptr %obj_tmp41, align 8
  %field_ptr42 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp41, i32 0, i32 6
  %field_val43 = load ptr, ptr %field_ptr42, align 8
  %call44 = call ptr @mesh_json_from_string(ptr %field_val43)
  %call45 = call ptr @mesh_json_object_put(ptr %call38, ptr %str39, ptr %call44)
  %str46 = call ptr @mesh_string_new(ptr @.str.7, i64 14)
  %self47 = load %MembershipPayload.2, ptr %self, align 8
  %obj_tmp48 = alloca %MembershipPayload.2, align 8
  store %MembershipPayload.2 %self47, ptr %obj_tmp48, align 8
  %field_ptr49 = getelementptr inbounds nuw %MembershipPayload.2, ptr %obj_tmp48, i32 0, i32 7
  %field_val50 = load ptr, ptr %field_ptr49, align 8
  %call51 = call ptr @mesh_json_from_string(ptr %field_val50)
  %call52 = call ptr @mesh_json_object_put(ptr %call45, ptr %str46, ptr %call51)
  ret ptr %call52
}

define %MembershipSnapshot.1 @membership_snapshot() {
entry:
  %self_name = alloca ptr, align 8
  %call = call ptr @mesh_node_self()
  store ptr %call, ptr %self_name, align 8
  %peers = alloca ptr, align 8
  %call1 = call ptr @mesh_node_list()
  store ptr %call1, ptr %peers, align 8
  %membership = alloca ptr, align 8
  %self_name2 = load ptr, ptr %self_name, align 8
  %call3 = call i64 @mesh_string_length(ptr %self_name2)
  %gt = icmp sgt i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %list_arr = alloca [1 x i64], align 8
  %self_name4 = load ptr, ptr %self_name, align 8
  %ptr_to_i64 = ptrtoint ptr %self_name4 to i64
  %elem_ptr = getelementptr [1 x i64], ptr %list_arr, i32 0, i32 0
  store i64 %ptr_to_i64, ptr %elem_ptr, align 8
  %list = call ptr @mesh_list_from_array(ptr %list_arr, i64 1)
  %peers5 = load ptr, ptr %peers, align 8
  %list_concat = call ptr @mesh_list_concat(ptr %list, ptr %peers5)
  store ptr %list_concat, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %peers6 = load ptr, ptr %peers, align 8
  store ptr %peers6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  store ptr %if_val, ptr %membership, align 8
  %struct_lit = alloca %MembershipSnapshot.1, align 8
  %self_name7 = load ptr, ptr %self_name, align 8
  %field_ptr = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %struct_lit, i32 0, i32 0
  store ptr %self_name7, ptr %field_ptr, align 8
  %peers8 = load ptr, ptr %peers, align 8
  %field_ptr9 = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %struct_lit, i32 0, i32 1
  store ptr %peers8, ptr %field_ptr9, align 8
  %membership10 = load ptr, ptr %membership, align 8
  %field_ptr11 = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %struct_lit, i32 0, i32 2
  store ptr %membership10, ptr %field_ptr11, align 8
  %struct_val = load %MembershipSnapshot.1, ptr %struct_lit, align 8
  ret %MembershipSnapshot.1 %struct_val
}

define ptr @current_self_name() {
entry:
  %call = call ptr @mesh_node_self()
  ret ptr %call
}

define ptr @current_membership() {
entry:
  %self_name = alloca ptr, align 8
  %call = call ptr @mesh_node_self()
  store ptr %call, ptr %self_name, align 8
  %peers = alloca ptr, align 8
  %call1 = call ptr @mesh_node_list()
  store ptr %call1, ptr %peers, align 8
  %self_name2 = load ptr, ptr %self_name, align 8
  %call3 = call i64 @mesh_string_length(ptr %self_name2)
  %gt = icmp sgt i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %list_arr = alloca [1 x i64], align 8
  %self_name4 = load ptr, ptr %self_name, align 8
  %ptr_to_i64 = ptrtoint ptr %self_name4 to i64
  %elem_ptr = getelementptr [1 x i64], ptr %list_arr, i32 0, i32 0
  store i64 %ptr_to_i64, ptr %elem_ptr, align 8
  %list = call ptr @mesh_list_from_array(ptr %list_arr, i64 1)
  %peers5 = load ptr, ptr %peers, align 8
  %list_concat = call ptr @mesh_list_concat(ptr %list, ptr %peers5)
  store ptr %list_concat, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %peers6 = load ptr, ptr %peers, align 8
  store ptr %peers6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @membership_payload(ptr %0, i64 %1, i64 %2, ptr %3) {
entry:
  %_mode = alloca ptr, align 8
  store ptr %0, ptr %_mode, align 8
  %http_port = alloca i64, align 8
  store i64 %1, ptr %http_port, align 8
  %cluster_port = alloca i64, align 8
  store i64 %2, ptr %cluster_port, align 8
  %discovery_seed_value = alloca ptr, align 8
  store ptr %3, ptr %discovery_seed_value, align 8
  %snapshot = alloca %MembershipSnapshot.1, align 8
  %call = call %MembershipSnapshot.1 @membership_snapshot()
  call void @mesh_reduction_check()
  store %MembershipSnapshot.1 %call, ptr %snapshot, align 8
  %payload = alloca %MembershipPayload.2, align 8
  %struct_lit = alloca %MembershipPayload.2, align 8
  %snapshot1 = load %MembershipSnapshot.1, ptr %snapshot, align 8
  %obj_tmp = alloca %MembershipSnapshot.1, align 8
  store %MembershipSnapshot.1 %snapshot1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call2 = call i64 @mesh_string_length(ptr %field_val)
  %gt = icmp sgt i64 %call2, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.8, i64 7)
  store ptr %str, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str3 = call ptr @mesh_string_new(ptr @.str.9, i64 10)
  store ptr %str3, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  %field_ptr4 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 0
  store ptr %if_val, ptr %field_ptr4, align 8
  %snapshot5 = load %MembershipSnapshot.1, ptr %snapshot, align 8
  %obj_tmp6 = alloca %MembershipSnapshot.1, align 8
  store %MembershipSnapshot.1 %snapshot5, ptr %obj_tmp6, align 8
  %field_ptr7 = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %obj_tmp6, i32 0, i32 0
  %field_val8 = load ptr, ptr %field_ptr7, align 8
  %field_ptr9 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 1
  store ptr %field_val8, ptr %field_ptr9, align 8
  %snapshot10 = load %MembershipSnapshot.1, ptr %snapshot, align 8
  %obj_tmp11 = alloca %MembershipSnapshot.1, align 8
  store %MembershipSnapshot.1 %snapshot10, ptr %obj_tmp11, align 8
  %field_ptr12 = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %obj_tmp11, i32 0, i32 1
  %field_val13 = load ptr, ptr %field_ptr12, align 8
  %field_ptr14 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 2
  store ptr %field_val13, ptr %field_ptr14, align 8
  %snapshot15 = load %MembershipSnapshot.1, ptr %snapshot, align 8
  %obj_tmp16 = alloca %MembershipSnapshot.1, align 8
  store %MembershipSnapshot.1 %snapshot15, ptr %obj_tmp16, align 8
  %field_ptr17 = getelementptr inbounds nuw %MembershipSnapshot.1, ptr %obj_tmp16, i32 0, i32 2
  %field_val18 = load ptr, ptr %field_ptr17, align 8
  %field_ptr19 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 3
  store ptr %field_val18, ptr %field_ptr19, align 8
  %str20 = call ptr @mesh_string_new(ptr @.str.10, i64 4)
  %str21 = call ptr @mesh_string_new(ptr @.str.11, i64 4)
  %call22 = call ptr @mesh_env_get_with_default(ptr %str20, ptr %str21)
  %field_ptr23 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 4
  store ptr %call22, ptr %field_ptr23, align 8
  %str24 = call ptr @mesh_string_new(ptr @.str.12, i64 17)
  %str25 = call ptr @mesh_string_new(ptr @.str.13, i64 4)
  %call26 = call ptr @mesh_env_get_with_default(ptr %str24, ptr %str25)
  %field_ptr27 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 5
  store ptr %call26, ptr %field_ptr27, align 8
  %discovery_seed_value28 = load ptr, ptr %discovery_seed_value, align 8
  %call29 = call i64 @mesh_string_length(ptr %discovery_seed_value28)
  %gt30 = icmp sgt i64 %call29, 0
  %if_result31 = alloca ptr, align 8
  br i1 %gt30, label %then32, label %else33

then32:                                           ; preds = %if_merge
  %str35 = call ptr @mesh_string_new(ptr @.str.14, i64 3)
  store ptr %str35, ptr %if_result31, align 8
  br label %if_merge34

else33:                                           ; preds = %if_merge
  %str36 = call ptr @mesh_string_new(ptr @.str.15, i64 4)
  store ptr %str36, ptr %if_result31, align 8
  br label %if_merge34

if_merge34:                                       ; preds = %else33, %then32
  %if_val37 = load ptr, ptr %if_result31, align 8
  %field_ptr38 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 6
  store ptr %if_val37, ptr %field_ptr38, align 8
  %discovery_seed_value39 = load ptr, ptr %discovery_seed_value, align 8
  %field_ptr40 = getelementptr inbounds nuw %MembershipPayload.2, ptr %struct_lit, i32 0, i32 7
  store ptr %discovery_seed_value39, ptr %field_ptr40, align 8
  %struct_val = load %MembershipPayload.2, ptr %struct_lit, align 8
  store %MembershipPayload.2 %struct_val, ptr %payload, align 8
  %payload41 = load %MembershipPayload.2, ptr %payload, align 8
  %call42 = call ptr @ToJson__to_json__MembershipPayload(%MembershipPayload.2 %payload41)
  call void @mesh_reduction_check()
  %call43 = call ptr @mesh_json_encode(ptr %call42)
  %str44 = call ptr @mesh_string_new(ptr @.str.16, i64 7)
  %str45 = call ptr @mesh_string_new(ptr @.str.17, i64 7)
  %call46 = call ptr @mesh_string_replace(ptr %call43, ptr %str44, ptr %str45)
  ret ptr %call46
}

define ptr @http_port_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.18, i64 4)
  ret ptr %str
}

define ptr @cluster_port_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.19, i64 17)
  ret ptr %str
}

define ptr @cookie_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.20, i64 20)
  ret ptr %str
}

define ptr @discovery_seed_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.21, i64 19)
  ret ptr %str
}

define ptr @node_basename_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.22, i64 27)
  ret ptr %str
}

define ptr @advertise_host_key() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.23, i64 28)
  ret ptr %str
}

define ptr @missing_required_env(ptr %0) {
entry:
  %name = alloca ptr, align 8
  store ptr %0, ptr %name, align 8
  %str = call ptr @mesh_string_new(ptr @.str.24, i64 38)
  %name1 = load ptr, ptr %name, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %name1)
  ret ptr %call
}

define ptr @invalid_positive_int(ptr %0) {
entry:
  %name = alloca ptr, align 8
  store ptr %0, ptr %name, align 8
  %str = call ptr @mesh_string_new(ptr @.str.25, i64 8)
  %name1 = load ptr, ptr %name, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %name1)
  %str2 = call ptr @mesh_string_new(ptr @.str.26, i64 29)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  ret ptr %call3
}

define ptr @cluster_cookie_required() {
entry:
  %call = call ptr @cookie_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.27, i64 50)
  %call1 = call ptr @mesh_string_concat(ptr %call, ptr %str)
  ret ptr %call1
}

define ptr @explicit_identity_required() {
entry:
  %call = call ptr @node_basename_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.28, i64 5)
  %call1 = call ptr @mesh_string_concat(ptr %call, ptr %str)
  %call2 = call ptr @advertise_host_key()
  call void @mesh_reduction_check()
  %call3 = call ptr @mesh_string_concat(ptr %call1, ptr %call2)
  %str4 = call ptr @mesh_string_new(ptr @.str.29, i64 21)
  %call5 = call ptr @mesh_string_concat(ptr %call3, ptr %str4)
  ret ptr %call5
}

define ptr @fly_identity_required() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.30, i64 90)
  ret ptr %str
}

define ptr @missing_identity_source() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.31, i64 22)
  %call = call ptr @node_basename_key()
  call void @mesh_reduction_check()
  %call1 = call ptr @mesh_string_concat(ptr %str, ptr %call)
  %str2 = call ptr @mesh_string_new(ptr @.str.32, i64 3)
  %call3 = call ptr @mesh_string_concat(ptr %call1, ptr %str2)
  %call4 = call ptr @advertise_host_key()
  call void @mesh_reduction_check()
  %call5 = call ptr @mesh_string_concat(ptr %call3, ptr %call4)
  %str6 = call ptr @mesh_string_new(ptr @.str.33, i64 20)
  %call7 = call ptr @mesh_string_concat(ptr %call5, ptr %str6)
  ret ptr %call7
}

define ptr @Config__invalid_cluster_identity(ptr %0) {
entry:
  %reason = alloca ptr, align 8
  store ptr %0, ptr %reason, align 8
  %str = call ptr @mesh_string_new(ptr @.str.34, i64 26)
  %reason1 = load ptr, ptr %reason, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %reason1)
  ret ptr %call
}

define i1 @Config__any_fly_identity_set(ptr %0, ptr %1, ptr %2, ptr %3) {
entry:
  %app_name = alloca ptr, align 8
  store ptr %0, ptr %app_name, align 8
  %region = alloca ptr, align 8
  store ptr %1, ptr %region, align 8
  %machine_id = alloca ptr, align 8
  store ptr %2, ptr %machine_id, align 8
  %private_ip = alloca ptr, align 8
  store ptr %3, ptr %private_ip, align 8
  %app_name1 = load ptr, ptr %app_name, align 8
  %call = call i64 @mesh_string_length(ptr %app_name1)
  %gt = icmp sgt i64 %call, 0
  %if_result = alloca i1, align 1
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  store i1 true, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %region2 = load ptr, ptr %region, align 8
  %call3 = call i64 @mesh_string_length(ptr %region2)
  %gt4 = icmp sgt i64 %call3, 0
  %if_result5 = alloca i1, align 1
  br i1 %gt4, label %then6, label %else7

if_merge:                                         ; preds = %if_merge8, %then
  %if_val20 = load i1, ptr %if_result, align 1
  ret i1 %if_val20

then6:                                            ; preds = %else
  store i1 true, ptr %if_result5, align 1
  br label %if_merge8

else7:                                            ; preds = %else
  %machine_id9 = load ptr, ptr %machine_id, align 8
  %call10 = call i64 @mesh_string_length(ptr %machine_id9)
  %gt11 = icmp sgt i64 %call10, 0
  %if_result12 = alloca i1, align 1
  br i1 %gt11, label %then13, label %else14

if_merge8:                                        ; preds = %if_merge15, %then6
  %if_val19 = load i1, ptr %if_result5, align 1
  store i1 %if_val19, ptr %if_result, align 1
  br label %if_merge

then13:                                           ; preds = %else7
  store i1 true, ptr %if_result12, align 1
  br label %if_merge15

else14:                                           ; preds = %else7
  %private_ip16 = load ptr, ptr %private_ip, align 8
  %call17 = call i64 @mesh_string_length(ptr %private_ip16)
  %gt18 = icmp sgt i64 %call17, 0
  store i1 %gt18, ptr %if_result12, align 1
  br label %if_merge15

if_merge15:                                       ; preds = %else14, %then13
  %if_val = load i1, ptr %if_result12, align 1
  store i1 %if_val, ptr %if_result5, align 1
  br label %if_merge8
}

define i1 @Config__has_cluster_hint(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6) {
entry:
  %discovery_seed_value = alloca ptr, align 8
  store ptr %0, ptr %discovery_seed_value, align 8
  %explicit_basename = alloca ptr, align 8
  store ptr %1, ptr %explicit_basename, align 8
  %explicit_host = alloca ptr, align 8
  store ptr %2, ptr %explicit_host, align 8
  %fly_app_name = alloca ptr, align 8
  store ptr %3, ptr %fly_app_name, align 8
  %fly_region = alloca ptr, align 8
  store ptr %4, ptr %fly_region, align 8
  %fly_machine_id = alloca ptr, align 8
  store ptr %5, ptr %fly_machine_id, align 8
  %fly_private_ip = alloca ptr, align 8
  store ptr %6, ptr %fly_private_ip, align 8
  %discovery_seed_value1 = load ptr, ptr %discovery_seed_value, align 8
  %call = call i64 @mesh_string_length(ptr %discovery_seed_value1)
  %gt = icmp sgt i64 %call, 0
  %if_result = alloca i1, align 1
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  store i1 true, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %explicit_basename2 = load ptr, ptr %explicit_basename, align 8
  %call3 = call i64 @mesh_string_length(ptr %explicit_basename2)
  %gt4 = icmp sgt i64 %call3, 0
  %if_result5 = alloca i1, align 1
  br i1 %gt4, label %then6, label %else7

if_merge:                                         ; preds = %if_merge8, %then
  %if_val22 = load i1, ptr %if_result, align 1
  ret i1 %if_val22

then6:                                            ; preds = %else
  store i1 true, ptr %if_result5, align 1
  br label %if_merge8

else7:                                            ; preds = %else
  %explicit_host9 = load ptr, ptr %explicit_host, align 8
  %call10 = call i64 @mesh_string_length(ptr %explicit_host9)
  %gt11 = icmp sgt i64 %call10, 0
  %if_result12 = alloca i1, align 1
  br i1 %gt11, label %then13, label %else14

if_merge8:                                        ; preds = %if_merge15, %then6
  %if_val21 = load i1, ptr %if_result5, align 1
  store i1 %if_val21, ptr %if_result, align 1
  br label %if_merge

then13:                                           ; preds = %else7
  store i1 true, ptr %if_result12, align 1
  br label %if_merge15

else14:                                           ; preds = %else7
  %fly_app_name16 = load ptr, ptr %fly_app_name, align 8
  %fly_region17 = load ptr, ptr %fly_region, align 8
  %fly_machine_id18 = load ptr, ptr %fly_machine_id, align 8
  %fly_private_ip19 = load ptr, ptr %fly_private_ip, align 8
  %call20 = call i1 @Config__any_fly_identity_set(ptr %fly_app_name16, ptr %fly_region17, ptr %fly_machine_id18, ptr %fly_private_ip19)
  call void @mesh_reduction_check()
  store i1 %call20, ptr %if_result12, align 1
  br label %if_merge15

if_merge15:                                       ; preds = %else14, %then13
  %if_val = load i1, ptr %if_result12, align 1
  store i1 %if_val, ptr %if_result5, align 1
  br label %if_merge8
}

define i64 @Config__positive_env_int(ptr %0, i64 %1) {
entry:
  %name = alloca ptr, align 8
  store ptr %0, ptr %name, align 8
  %default_value = alloca i64, align 8
  store i64 %1, ptr %default_value, align 8
  %raw = alloca ptr, align 8
  %name1 = load ptr, ptr %name, align 8
  %str = call ptr @mesh_string_new(ptr @.str.35, i64 0)
  %call = call ptr @mesh_env_get_with_default(ptr %name1, ptr %str)
  store ptr %call, ptr %raw, align 8
  %raw2 = load ptr, ptr %raw, align 8
  %str3 = call ptr @mesh_string_new(ptr @.str.36, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %raw2, ptr %str3)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca i64, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %default_value4 = load i64, ptr %default_value, align 8
  store i64 %default_value4, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %value = alloca i64, align 8
  %name5 = load ptr, ptr %name, align 8
  %call6 = call i64 @mesh_env_get_int(ptr %name5, i64 -1)
  store i64 %call6, ptr %value, align 8
  %value7 = load i64, ptr %value, align 8
  %gt = icmp sgt i64 %value7, 0
  %if_result8 = alloca i64, align 8
  br i1 %gt, label %then9, label %else10

if_merge:                                         ; preds = %if_merge11, %then
  %if_val13 = load i64, ptr %if_result, align 8
  ret i64 %if_val13

then9:                                            ; preds = %else
  %value12 = load i64, ptr %value, align 8
  store i64 %value12, ptr %if_result8, align 8
  br label %if_merge11

else10:                                           ; preds = %else
  store i64 -1, ptr %if_result8, align 8
  br label %if_merge11

if_merge11:                                       ; preds = %else10, %then9
  %if_val = load i64, ptr %if_result8, align 8
  store i64 %if_val, ptr %if_result, align 8
  br label %if_merge
}

define ptr @Config__normalized_host_or_empty(ptr %0) {
entry:
  %host = alloca ptr, align 8
  store ptr %0, ptr %host, align 8
  %trimmed = alloca ptr, align 8
  %host1 = load ptr, ptr %host, align 8
  %call = call ptr @mesh_string_trim(ptr %host1)
  store ptr %call, ptr %trimmed, align 8
  %trimmed2 = load ptr, ptr %trimmed, align 8
  %call3 = call i64 @mesh_string_length(ptr %trimmed2)
  %eq = icmp eq i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.37, i64 0)
  store ptr %str, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %trimmed4 = load ptr, ptr %trimmed, align 8
  %str5 = call ptr @mesh_string_new(ptr @.str.38, i64 1)
  %call6 = call i8 @mesh_string_contains(ptr %trimmed4, ptr %str5)
  %to_bool = trunc i8 %call6 to i1
  %if_result7 = alloca ptr, align 8
  br i1 %to_bool, label %then8, label %else9

if_merge:                                         ; preds = %if_merge10, %then
  %if_val57 = load ptr, ptr %if_result, align 8
  ret ptr %if_val57

then8:                                            ; preds = %else
  %str11 = call ptr @mesh_string_new(ptr @.str.39, i64 0)
  store ptr %str11, ptr %if_result7, align 8
  br label %if_merge10

else9:                                            ; preds = %else
  %trimmed12 = load ptr, ptr %trimmed, align 8
  %str13 = call ptr @mesh_string_new(ptr @.str.40, i64 1)
  %call14 = call i8 @mesh_string_starts_with(ptr %trimmed12, ptr %str13)
  %to_bool15 = trunc i8 %call14 to i1
  %if_result16 = alloca ptr, align 8
  br i1 %to_bool15, label %then17, label %else18

if_merge10:                                       ; preds = %if_merge19, %then8
  %if_val56 = load ptr, ptr %if_result7, align 8
  store ptr %if_val56, ptr %if_result, align 8
  br label %if_merge

then17:                                           ; preds = %else9
  %trimmed20 = load ptr, ptr %trimmed, align 8
  %str21 = call ptr @mesh_string_new(ptr @.str.41, i64 1)
  %call22 = call i8 @mesh_string_ends_with(ptr %trimmed20, ptr %str21)
  %to_bool23 = trunc i8 %call22 to i1
  %if_result24 = alloca ptr, align 8
  br i1 %to_bool23, label %then25, label %else26

else18:                                           ; preds = %else9
  %trimmed30 = load ptr, ptr %trimmed, align 8
  %str31 = call ptr @mesh_string_new(ptr @.str.43, i64 1)
  %call32 = call i8 @mesh_string_ends_with(ptr %trimmed30, ptr %str31)
  %to_bool33 = trunc i8 %call32 to i1
  %if_result34 = alloca ptr, align 8
  br i1 %to_bool33, label %then35, label %else36

if_merge19:                                       ; preds = %if_merge37, %if_merge27
  %if_val55 = load ptr, ptr %if_result16, align 8
  store ptr %if_val55, ptr %if_result7, align 8
  br label %if_merge10

then25:                                           ; preds = %then17
  %trimmed28 = load ptr, ptr %trimmed, align 8
  store ptr %trimmed28, ptr %if_result24, align 8
  br label %if_merge27

else26:                                           ; preds = %then17
  %str29 = call ptr @mesh_string_new(ptr @.str.42, i64 0)
  store ptr %str29, ptr %if_result24, align 8
  br label %if_merge27

if_merge27:                                       ; preds = %else26, %then25
  %if_val = load ptr, ptr %if_result24, align 8
  store ptr %if_val, ptr %if_result16, align 8
  br label %if_merge19

then35:                                           ; preds = %else18
  %str38 = call ptr @mesh_string_new(ptr @.str.44, i64 0)
  store ptr %str38, ptr %if_result34, align 8
  br label %if_merge37

else36:                                           ; preds = %else18
  %trimmed39 = load ptr, ptr %trimmed, align 8
  %str40 = call ptr @mesh_string_new(ptr @.str.45, i64 1)
  %call41 = call i8 @mesh_string_contains(ptr %trimmed39, ptr %str40)
  %to_bool42 = trunc i8 %call41 to i1
  %if_result43 = alloca ptr, align 8
  br i1 %to_bool42, label %then44, label %else45

if_merge37:                                       ; preds = %if_merge46, %then35
  %if_val54 = load ptr, ptr %if_result34, align 8
  store ptr %if_val54, ptr %if_result16, align 8
  br label %if_merge19

then44:                                           ; preds = %else36
  %str47 = call ptr @mesh_string_new(ptr @.str.46, i64 1)
  %trimmed48 = load ptr, ptr %trimmed, align 8
  %call49 = call ptr @mesh_string_concat(ptr %str47, ptr %trimmed48)
  %str50 = call ptr @mesh_string_new(ptr @.str.47, i64 1)
  %call51 = call ptr @mesh_string_concat(ptr %call49, ptr %str50)
  store ptr %call51, ptr %if_result43, align 8
  br label %if_merge46

else45:                                           ; preds = %else36
  %trimmed52 = load ptr, ptr %trimmed, align 8
  store ptr %trimmed52, ptr %if_result43, align 8
  br label %if_merge46

if_merge46:                                       ; preds = %else45, %then44
  %if_val53 = load ptr, ptr %if_result43, align 8
  store ptr %if_val53, ptr %if_result34, align 8
  br label %if_merge37
}

define ptr @Config__validated_basename_or_empty(ptr %0) {
entry:
  %node_basename = alloca ptr, align 8
  store ptr %0, ptr %node_basename, align 8
  %trimmed = alloca ptr, align 8
  %node_basename1 = load ptr, ptr %node_basename, align 8
  %call = call ptr @mesh_string_trim(ptr %node_basename1)
  store ptr %call, ptr %trimmed, align 8
  %trimmed2 = load ptr, ptr %trimmed, align 8
  %call3 = call i64 @mesh_string_length(ptr %trimmed2)
  %eq = icmp eq i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.48, i64 0)
  store ptr %str, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %trimmed4 = load ptr, ptr %trimmed, align 8
  %str5 = call ptr @mesh_string_new(ptr @.str.49, i64 1)
  %call6 = call i8 @mesh_string_contains(ptr %trimmed4, ptr %str5)
  %to_bool = trunc i8 %call6 to i1
  %if_result7 = alloca ptr, align 8
  br i1 %to_bool, label %then8, label %else9

if_merge:                                         ; preds = %if_merge10, %then
  %if_val13 = load ptr, ptr %if_result, align 8
  ret ptr %if_val13

then8:                                            ; preds = %else
  %str11 = call ptr @mesh_string_new(ptr @.str.50, i64 0)
  store ptr %str11, ptr %if_result7, align 8
  br label %if_merge10

else9:                                            ; preds = %else
  %trimmed12 = load ptr, ptr %trimmed, align 8
  store ptr %trimmed12, ptr %if_result7, align 8
  br label %if_merge10

if_merge10:                                       ; preds = %else9, %then8
  %if_val = load ptr, ptr %if_result7, align 8
  store ptr %if_val, ptr %if_result, align 8
  br label %if_merge
}

define ptr @Config__host_validation_error(ptr %0) {
entry:
  %advertised_host = alloca ptr, align 8
  store ptr %0, ptr %advertised_host, align 8
  %trimmed_host = alloca ptr, align 8
  %advertised_host1 = load ptr, ptr %advertised_host, align 8
  %call = call ptr @mesh_string_trim(ptr %advertised_host1)
  store ptr %call, ptr %trimmed_host, align 8
  %trimmed_host2 = load ptr, ptr %trimmed_host, align 8
  %call3 = call i64 @mesh_string_length(ptr %trimmed_host2)
  %eq = icmp eq i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.51, i64 31)
  %call4 = call ptr @Config__invalid_cluster_identity(ptr %str)
  call void @mesh_reduction_check()
  store ptr %call4, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %trimmed_host5 = load ptr, ptr %trimmed_host, align 8
  %str6 = call ptr @mesh_string_new(ptr @.str.52, i64 1)
  %call7 = call i8 @mesh_string_contains(ptr %trimmed_host5, ptr %str6)
  %to_bool = trunc i8 %call7 to i1
  %if_result8 = alloca ptr, align 8
  br i1 %to_bool, label %then9, label %else10

if_merge:                                         ; preds = %if_merge11, %then
  %if_val47 = load ptr, ptr %if_result, align 8
  ret ptr %if_val47

then9:                                            ; preds = %else
  %str12 = call ptr @mesh_string_new(ptr @.str.53, i64 32)
  %call13 = call ptr @Config__invalid_cluster_identity(ptr %str12)
  call void @mesh_reduction_check()
  store ptr %call13, ptr %if_result8, align 8
  br label %if_merge11

else10:                                           ; preds = %else
  %trimmed_host14 = load ptr, ptr %trimmed_host, align 8
  %str15 = call ptr @mesh_string_new(ptr @.str.54, i64 1)
  %call16 = call i8 @mesh_string_starts_with(ptr %trimmed_host14, ptr %str15)
  %to_bool17 = trunc i8 %call16 to i1
  %if_result18 = alloca ptr, align 8
  br i1 %to_bool17, label %then19, label %else20

if_merge11:                                       ; preds = %if_merge21, %then9
  %if_val46 = load ptr, ptr %if_result8, align 8
  store ptr %if_val46, ptr %if_result, align 8
  br label %if_merge

then19:                                           ; preds = %else10
  %trimmed_host22 = load ptr, ptr %trimmed_host, align 8
  %str23 = call ptr @mesh_string_new(ptr @.str.55, i64 1)
  %call24 = call i8 @mesh_string_ends_with(ptr %trimmed_host22, ptr %str23)
  %to_bool25 = trunc i8 %call24 to i1
  %if_result26 = alloca ptr, align 8
  br i1 %to_bool25, label %then27, label %else28

else20:                                           ; preds = %else10
  %trimmed_host33 = load ptr, ptr %trimmed_host, align 8
  %str34 = call ptr @mesh_string_new(ptr @.str.58, i64 1)
  %call35 = call i8 @mesh_string_ends_with(ptr %trimmed_host33, ptr %str34)
  %to_bool36 = trunc i8 %call35 to i1
  %if_result37 = alloca ptr, align 8
  br i1 %to_bool36, label %then38, label %else39

if_merge21:                                       ; preds = %if_merge40, %if_merge29
  %if_val45 = load ptr, ptr %if_result18, align 8
  store ptr %if_val45, ptr %if_result8, align 8
  br label %if_merge11

then27:                                           ; preds = %then19
  %str30 = call ptr @mesh_string_new(ptr @.str.56, i64 0)
  store ptr %str30, ptr %if_result26, align 8
  br label %if_merge29

else28:                                           ; preds = %then19
  %str31 = call ptr @mesh_string_new(ptr @.str.57, i64 56)
  %call32 = call ptr @Config__invalid_cluster_identity(ptr %str31)
  call void @mesh_reduction_check()
  store ptr %call32, ptr %if_result26, align 8
  br label %if_merge29

if_merge29:                                       ; preds = %else28, %then27
  %if_val = load ptr, ptr %if_result26, align 8
  store ptr %if_val, ptr %if_result18, align 8
  br label %if_merge21

then38:                                           ; preds = %else20
  %str41 = call ptr @mesh_string_new(ptr @.str.59, i64 56)
  %call42 = call ptr @Config__invalid_cluster_identity(ptr %str41)
  call void @mesh_reduction_check()
  store ptr %call42, ptr %if_result37, align 8
  br label %if_merge40

else39:                                           ; preds = %else20
  %str43 = call ptr @mesh_string_new(ptr @.str.60, i64 0)
  store ptr %str43, ptr %if_result37, align 8
  br label %if_merge40

if_merge40:                                       ; preds = %else39, %then38
  %if_val44 = load ptr, ptr %if_result37, align 8
  store ptr %if_val44, ptr %if_result18, align 8
  br label %if_merge21
}

define i64 @http_port() {
entry:
  %call = call ptr @http_port_key()
  call void @mesh_reduction_check()
  %call1 = call i64 @Config__positive_env_int(ptr %call, i64 8080)
  call void @mesh_reduction_check()
  ret i64 %call1
}

define i64 @cluster_port() {
entry:
  %call = call ptr @cluster_port_key()
  call void @mesh_reduction_check()
  %call1 = call i64 @Config__positive_env_int(ptr %call, i64 4370)
  call void @mesh_reduction_check()
  ret i64 %call1
}

define ptr @cookie() {
entry:
  %call = call ptr @cookie_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.61, i64 0)
  %call1 = call ptr @mesh_env_get_with_default(ptr %call, ptr %str)
  ret ptr %call1
}

define ptr @discovery_seed() {
entry:
  %call = call ptr @discovery_seed_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.62, i64 0)
  %call1 = call ptr @mesh_env_get_with_default(ptr %call, ptr %str)
  ret ptr %call1
}

define ptr @mode() {
entry:
  %call = call ptr @cookie()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.63, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %call, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca ptr, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %str1 = call ptr @mesh_string_new(ptr @.str.64, i64 10)
  store ptr %str1, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str2 = call ptr @mesh_string_new(ptr @.str.65, i64 7)
  store ptr %str2, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @mode_error() {
entry:
  %cluster_cookie = alloca ptr, align 8
  %call = call ptr @cookie()
  call void @mesh_reduction_check()
  store ptr %call, ptr %cluster_cookie, align 8
  %discovery_seed_value = alloca ptr, align 8
  %call1 = call ptr @discovery_seed()
  call void @mesh_reduction_check()
  store ptr %call1, ptr %discovery_seed_value, align 8
  %explicit_basename = alloca ptr, align 8
  %call2 = call ptr @node_basename_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.66, i64 0)
  %call3 = call ptr @mesh_env_get_with_default(ptr %call2, ptr %str)
  store ptr %call3, ptr %explicit_basename, align 8
  %explicit_host = alloca ptr, align 8
  %call4 = call ptr @advertise_host_key()
  call void @mesh_reduction_check()
  %str5 = call ptr @mesh_string_new(ptr @.str.67, i64 0)
  %call6 = call ptr @mesh_env_get_with_default(ptr %call4, ptr %str5)
  store ptr %call6, ptr %explicit_host, align 8
  %fly_app_name = alloca ptr, align 8
  %str7 = call ptr @mesh_string_new(ptr @.str.68, i64 12)
  %str8 = call ptr @mesh_string_new(ptr @.str.69, i64 0)
  %call9 = call ptr @mesh_env_get_with_default(ptr %str7, ptr %str8)
  store ptr %call9, ptr %fly_app_name, align 8
  %fly_region = alloca ptr, align 8
  %str10 = call ptr @mesh_string_new(ptr @.str.70, i64 10)
  %str11 = call ptr @mesh_string_new(ptr @.str.71, i64 0)
  %call12 = call ptr @mesh_env_get_with_default(ptr %str10, ptr %str11)
  store ptr %call12, ptr %fly_region, align 8
  %fly_machine_id = alloca ptr, align 8
  %str13 = call ptr @mesh_string_new(ptr @.str.72, i64 14)
  %str14 = call ptr @mesh_string_new(ptr @.str.73, i64 0)
  %call15 = call ptr @mesh_env_get_with_default(ptr %str13, ptr %str14)
  store ptr %call15, ptr %fly_machine_id, align 8
  %fly_private_ip = alloca ptr, align 8
  %str16 = call ptr @mesh_string_new(ptr @.str.74, i64 14)
  %str17 = call ptr @mesh_string_new(ptr @.str.75, i64 0)
  %call18 = call ptr @mesh_env_get_with_default(ptr %str16, ptr %str17)
  store ptr %call18, ptr %fly_private_ip, align 8
  %cluster_cookie19 = load ptr, ptr %cluster_cookie, align 8
  %str20 = call ptr @mesh_string_new(ptr @.str.76, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %cluster_cookie19, ptr %str20)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca ptr, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %discovery_seed_value21 = load ptr, ptr %discovery_seed_value, align 8
  %explicit_basename22 = load ptr, ptr %explicit_basename, align 8
  %explicit_host23 = load ptr, ptr %explicit_host, align 8
  %fly_app_name24 = load ptr, ptr %fly_app_name, align 8
  %fly_region25 = load ptr, ptr %fly_region, align 8
  %fly_machine_id26 = load ptr, ptr %fly_machine_id, align 8
  %fly_private_ip27 = load ptr, ptr %fly_private_ip, align 8
  %call28 = call i1 @Config__has_cluster_hint(ptr %discovery_seed_value21, ptr %explicit_basename22, ptr %explicit_host23, ptr %fly_app_name24, ptr %fly_region25, ptr %fly_machine_id26, ptr %fly_private_ip27)
  call void @mesh_reduction_check()
  %if_result29 = alloca ptr, align 8
  br i1 %call28, label %then30, label %else31

else:                                             ; preds = %entry
  %str35 = call ptr @mesh_string_new(ptr @.str.78, i64 0)
  store ptr %str35, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %if_merge32
  %if_val36 = load ptr, ptr %if_result, align 8
  ret ptr %if_val36

then30:                                           ; preds = %then
  %call33 = call ptr @cluster_cookie_required()
  call void @mesh_reduction_check()
  store ptr %call33, ptr %if_result29, align 8
  br label %if_merge32

else31:                                           ; preds = %then
  %str34 = call ptr @mesh_string_new(ptr @.str.77, i64 0)
  store ptr %str34, ptr %if_result29, align 8
  br label %if_merge32

if_merge32:                                       ; preds = %else31, %then30
  %if_val = load ptr, ptr %if_result29, align 8
  store ptr %if_val, ptr %if_result, align 8
  br label %if_merge
}

define ptr @node_name(i64 %0) {
entry:
  %cluster_port_value = alloca i64, align 8
  store i64 %0, ptr %cluster_port_value, align 8
  %explicit_basename = alloca ptr, align 8
  %call = call ptr @node_basename_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.79, i64 0)
  %call1 = call ptr @mesh_env_get_with_default(ptr %call, ptr %str)
  store ptr %call1, ptr %explicit_basename, align 8
  %explicit_host = alloca ptr, align 8
  %call2 = call ptr @advertise_host_key()
  call void @mesh_reduction_check()
  %str3 = call ptr @mesh_string_new(ptr @.str.80, i64 0)
  %call4 = call ptr @mesh_env_get_with_default(ptr %call2, ptr %str3)
  store ptr %call4, ptr %explicit_host, align 8
  %fly_app_name = alloca ptr, align 8
  %str5 = call ptr @mesh_string_new(ptr @.str.81, i64 12)
  %str6 = call ptr @mesh_string_new(ptr @.str.82, i64 0)
  %call7 = call ptr @mesh_env_get_with_default(ptr %str5, ptr %str6)
  store ptr %call7, ptr %fly_app_name, align 8
  %fly_region = alloca ptr, align 8
  %str8 = call ptr @mesh_string_new(ptr @.str.83, i64 10)
  %str9 = call ptr @mesh_string_new(ptr @.str.84, i64 0)
  %call10 = call ptr @mesh_env_get_with_default(ptr %str8, ptr %str9)
  store ptr %call10, ptr %fly_region, align 8
  %fly_machine_id = alloca ptr, align 8
  %str11 = call ptr @mesh_string_new(ptr @.str.85, i64 14)
  %str12 = call ptr @mesh_string_new(ptr @.str.86, i64 0)
  %call13 = call ptr @mesh_env_get_with_default(ptr %str11, ptr %str12)
  store ptr %call13, ptr %fly_machine_id, align 8
  %fly_private_ip = alloca ptr, align 8
  %str14 = call ptr @mesh_string_new(ptr @.str.87, i64 14)
  %str15 = call ptr @mesh_string_new(ptr @.str.88, i64 0)
  %call16 = call ptr @mesh_env_get_with_default(ptr %str14, ptr %str15)
  store ptr %call16, ptr %fly_private_ip, align 8
  %explicit_basename_trimmed = alloca ptr, align 8
  %explicit_basename17 = load ptr, ptr %explicit_basename, align 8
  %call18 = call ptr @Config__validated_basename_or_empty(ptr %explicit_basename17)
  call void @mesh_reduction_check()
  store ptr %call18, ptr %explicit_basename_trimmed, align 8
  %explicit_host_normalized = alloca ptr, align 8
  %explicit_host19 = load ptr, ptr %explicit_host, align 8
  %call20 = call ptr @Config__normalized_host_or_empty(ptr %explicit_host19)
  call void @mesh_reduction_check()
  store ptr %call20, ptr %explicit_host_normalized, align 8
  %explicit_basename21 = load ptr, ptr %explicit_basename, align 8
  %call22 = call ptr @mesh_string_trim(ptr %explicit_basename21)
  %call23 = call i64 @mesh_string_length(ptr %call22)
  %gt = icmp sgt i64 %call23, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %explicit_basename_trimmed24 = load ptr, ptr %explicit_basename_trimmed, align 8
  %str25 = call ptr @mesh_string_new(ptr @.str.89, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %explicit_basename_trimmed24, ptr %str25)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result26 = alloca ptr, align 8
  br i1 %str_eq_bool, label %then27, label %else28

else:                                             ; preds = %entry
  %explicit_host60 = load ptr, ptr %explicit_host, align 8
  %call61 = call ptr @mesh_string_trim(ptr %explicit_host60)
  %call62 = call i64 @mesh_string_length(ptr %call61)
  %gt63 = icmp sgt i64 %call62, 0
  %if_result64 = alloca ptr, align 8
  br i1 %gt63, label %then65, label %else66

if_merge:                                         ; preds = %if_merge67, %if_merge29
  %if_val144 = load ptr, ptr %if_result, align 8
  ret ptr %if_val144

then27:                                           ; preds = %then
  %str30 = call ptr @mesh_string_new(ptr @.str.90, i64 0)
  store ptr %str30, ptr %if_result26, align 8
  br label %if_merge29

else28:                                           ; preds = %then
  %explicit_host31 = load ptr, ptr %explicit_host, align 8
  %call32 = call ptr @mesh_string_trim(ptr %explicit_host31)
  %call33 = call i64 @mesh_string_length(ptr %call32)
  %eq = icmp eq i64 %call33, 0
  %if_result34 = alloca ptr, align 8
  br i1 %eq, label %then35, label %else36

if_merge29:                                       ; preds = %if_merge37, %then27
  %if_val59 = load ptr, ptr %if_result26, align 8
  store ptr %if_val59, ptr %if_result, align 8
  br label %if_merge

then35:                                           ; preds = %else28
  %str38 = call ptr @mesh_string_new(ptr @.str.91, i64 0)
  store ptr %str38, ptr %if_result34, align 8
  br label %if_merge37

else36:                                           ; preds = %else28
  %explicit_host_normalized39 = load ptr, ptr %explicit_host_normalized, align 8
  %str40 = call ptr @mesh_string_new(ptr @.str.92, i64 0)
  %str_eq41 = call i8 @mesh_string_eq(ptr %explicit_host_normalized39, ptr %str40)
  %str_eq_bool42 = icmp ne i8 %str_eq41, 0
  %if_result43 = alloca ptr, align 8
  br i1 %str_eq_bool42, label %then44, label %else45

if_merge37:                                       ; preds = %if_merge46, %then35
  %if_val58 = load ptr, ptr %if_result34, align 8
  store ptr %if_val58, ptr %if_result26, align 8
  br label %if_merge29

then44:                                           ; preds = %else36
  %str47 = call ptr @mesh_string_new(ptr @.str.93, i64 0)
  store ptr %str47, ptr %if_result43, align 8
  br label %if_merge46

else45:                                           ; preds = %else36
  %explicit_basename_trimmed48 = load ptr, ptr %explicit_basename_trimmed, align 8
  %str49 = call ptr @mesh_string_new(ptr @.str.94, i64 1)
  %call50 = call ptr @mesh_string_concat(ptr %explicit_basename_trimmed48, ptr %str49)
  %explicit_host_normalized51 = load ptr, ptr %explicit_host_normalized, align 8
  %call52 = call ptr @mesh_string_concat(ptr %call50, ptr %explicit_host_normalized51)
  %str53 = call ptr @mesh_string_new(ptr @.str.95, i64 1)
  %call54 = call ptr @mesh_string_concat(ptr %call52, ptr %str53)
  %cluster_port_value55 = load i64, ptr %cluster_port_value, align 8
  %call56 = call ptr @mesh_int_to_string(i64 %cluster_port_value55)
  %call57 = call ptr @mesh_string_concat(ptr %call54, ptr %call56)
  store ptr %call57, ptr %if_result43, align 8
  br label %if_merge46

if_merge46:                                       ; preds = %else45, %then44
  %if_val = load ptr, ptr %if_result43, align 8
  store ptr %if_val, ptr %if_result34, align 8
  br label %if_merge37

then65:                                           ; preds = %else
  %str68 = call ptr @mesh_string_new(ptr @.str.96, i64 0)
  store ptr %str68, ptr %if_result64, align 8
  br label %if_merge67

else66:                                           ; preds = %else
  %app_name = alloca ptr, align 8
  %fly_app_name69 = load ptr, ptr %fly_app_name, align 8
  %call70 = call ptr @mesh_string_trim(ptr %fly_app_name69)
  store ptr %call70, ptr %app_name, align 8
  %region = alloca ptr, align 8
  %fly_region71 = load ptr, ptr %fly_region, align 8
  %call72 = call ptr @mesh_string_trim(ptr %fly_region71)
  store ptr %call72, ptr %region, align 8
  %machine_id = alloca ptr, align 8
  %fly_machine_id73 = load ptr, ptr %fly_machine_id, align 8
  %call74 = call ptr @mesh_string_trim(ptr %fly_machine_id73)
  store ptr %call74, ptr %machine_id, align 8
  %private_ip_normalized = alloca ptr, align 8
  %fly_private_ip75 = load ptr, ptr %fly_private_ip, align 8
  %call76 = call ptr @Config__normalized_host_or_empty(ptr %fly_private_ip75)
  call void @mesh_reduction_check()
  store ptr %call76, ptr %private_ip_normalized, align 8
  %fly_app_name77 = load ptr, ptr %fly_app_name, align 8
  %fly_region78 = load ptr, ptr %fly_region, align 8
  %fly_machine_id79 = load ptr, ptr %fly_machine_id, align 8
  %fly_private_ip80 = load ptr, ptr %fly_private_ip, align 8
  %call81 = call i1 @Config__any_fly_identity_set(ptr %fly_app_name77, ptr %fly_region78, ptr %fly_machine_id79, ptr %fly_private_ip80)
  call void @mesh_reduction_check()
  %if_result82 = alloca ptr, align 8
  br i1 %call81, label %then83, label %else84

if_merge67:                                       ; preds = %if_merge85, %then65
  %if_val143 = load ptr, ptr %if_result64, align 8
  store ptr %if_val143, ptr %if_result, align 8
  br label %if_merge

then83:                                           ; preds = %else66
  %app_name86 = load ptr, ptr %app_name, align 8
  %call87 = call i64 @mesh_string_length(ptr %app_name86)
  %eq88 = icmp eq i64 %call87, 0
  %if_result89 = alloca ptr, align 8
  br i1 %eq88, label %then90, label %else91

else84:                                           ; preds = %else66
  %str141 = call ptr @mesh_string_new(ptr @.str.106, i64 0)
  store ptr %str141, ptr %if_result82, align 8
  br label %if_merge85

if_merge85:                                       ; preds = %else84, %if_merge92
  %if_val142 = load ptr, ptr %if_result82, align 8
  store ptr %if_val142, ptr %if_result64, align 8
  br label %if_merge67

then90:                                           ; preds = %then83
  %str93 = call ptr @mesh_string_new(ptr @.str.97, i64 0)
  store ptr %str93, ptr %if_result89, align 8
  br label %if_merge92

else91:                                           ; preds = %then83
  %region94 = load ptr, ptr %region, align 8
  %call95 = call i64 @mesh_string_length(ptr %region94)
  %eq96 = icmp eq i64 %call95, 0
  %if_result97 = alloca ptr, align 8
  br i1 %eq96, label %then98, label %else99

if_merge92:                                       ; preds = %if_merge100, %then90
  %if_val140 = load ptr, ptr %if_result89, align 8
  store ptr %if_val140, ptr %if_result82, align 8
  br label %if_merge85

then98:                                           ; preds = %else91
  %str101 = call ptr @mesh_string_new(ptr @.str.98, i64 0)
  store ptr %str101, ptr %if_result97, align 8
  br label %if_merge100

else99:                                           ; preds = %else91
  %machine_id102 = load ptr, ptr %machine_id, align 8
  %call103 = call i64 @mesh_string_length(ptr %machine_id102)
  %eq104 = icmp eq i64 %call103, 0
  %if_result105 = alloca ptr, align 8
  br i1 %eq104, label %then106, label %else107

if_merge100:                                      ; preds = %if_merge108, %then98
  %if_val139 = load ptr, ptr %if_result97, align 8
  store ptr %if_val139, ptr %if_result89, align 8
  br label %if_merge92

then106:                                          ; preds = %else99
  %str109 = call ptr @mesh_string_new(ptr @.str.99, i64 0)
  store ptr %str109, ptr %if_result105, align 8
  br label %if_merge108

else107:                                          ; preds = %else99
  %private_ip_normalized110 = load ptr, ptr %private_ip_normalized, align 8
  %str111 = call ptr @mesh_string_new(ptr @.str.100, i64 0)
  %str_eq112 = call i8 @mesh_string_eq(ptr %private_ip_normalized110, ptr %str111)
  %str_eq_bool113 = icmp ne i8 %str_eq112, 0
  %if_result114 = alloca ptr, align 8
  br i1 %str_eq_bool113, label %then115, label %else116

if_merge108:                                      ; preds = %if_merge117, %then106
  %if_val138 = load ptr, ptr %if_result105, align 8
  store ptr %if_val138, ptr %if_result97, align 8
  br label %if_merge100

then115:                                          ; preds = %else107
  %str118 = call ptr @mesh_string_new(ptr @.str.101, i64 0)
  store ptr %str118, ptr %if_result114, align 8
  br label %if_merge117

else116:                                          ; preds = %else107
  %app_name119 = load ptr, ptr %app_name, align 8
  %str120 = call ptr @mesh_string_new(ptr @.str.102, i64 1)
  %call121 = call ptr @mesh_string_concat(ptr %app_name119, ptr %str120)
  %region122 = load ptr, ptr %region, align 8
  %call123 = call ptr @mesh_string_concat(ptr %call121, ptr %region122)
  %str124 = call ptr @mesh_string_new(ptr @.str.103, i64 1)
  %call125 = call ptr @mesh_string_concat(ptr %call123, ptr %str124)
  %machine_id126 = load ptr, ptr %machine_id, align 8
  %call127 = call ptr @mesh_string_concat(ptr %call125, ptr %machine_id126)
  %str128 = call ptr @mesh_string_new(ptr @.str.104, i64 1)
  %call129 = call ptr @mesh_string_concat(ptr %call127, ptr %str128)
  %private_ip_normalized130 = load ptr, ptr %private_ip_normalized, align 8
  %call131 = call ptr @mesh_string_concat(ptr %call129, ptr %private_ip_normalized130)
  %str132 = call ptr @mesh_string_new(ptr @.str.105, i64 1)
  %call133 = call ptr @mesh_string_concat(ptr %call131, ptr %str132)
  %cluster_port_value134 = load i64, ptr %cluster_port_value, align 8
  %call135 = call ptr @mesh_int_to_string(i64 %cluster_port_value134)
  %call136 = call ptr @mesh_string_concat(ptr %call133, ptr %call135)
  store ptr %call136, ptr %if_result114, align 8
  br label %if_merge117

if_merge117:                                      ; preds = %else116, %then115
  %if_val137 = load ptr, ptr %if_result114, align 8
  store ptr %if_val137, ptr %if_result105, align 8
  br label %if_merge108
}

define ptr @node_name_error(i64 %0) {
entry:
  %cluster_port_value = alloca i64, align 8
  store i64 %0, ptr %cluster_port_value, align 8
  %explicit_basename = alloca ptr, align 8
  %call = call ptr @node_basename_key()
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.107, i64 0)
  %call1 = call ptr @mesh_env_get_with_default(ptr %call, ptr %str)
  store ptr %call1, ptr %explicit_basename, align 8
  %explicit_host = alloca ptr, align 8
  %call2 = call ptr @advertise_host_key()
  call void @mesh_reduction_check()
  %str3 = call ptr @mesh_string_new(ptr @.str.108, i64 0)
  %call4 = call ptr @mesh_env_get_with_default(ptr %call2, ptr %str3)
  store ptr %call4, ptr %explicit_host, align 8
  %fly_app_name = alloca ptr, align 8
  %str5 = call ptr @mesh_string_new(ptr @.str.109, i64 12)
  %str6 = call ptr @mesh_string_new(ptr @.str.110, i64 0)
  %call7 = call ptr @mesh_env_get_with_default(ptr %str5, ptr %str6)
  store ptr %call7, ptr %fly_app_name, align 8
  %fly_region = alloca ptr, align 8
  %str8 = call ptr @mesh_string_new(ptr @.str.111, i64 10)
  %str9 = call ptr @mesh_string_new(ptr @.str.112, i64 0)
  %call10 = call ptr @mesh_env_get_with_default(ptr %str8, ptr %str9)
  store ptr %call10, ptr %fly_region, align 8
  %fly_machine_id = alloca ptr, align 8
  %str11 = call ptr @mesh_string_new(ptr @.str.113, i64 14)
  %str12 = call ptr @mesh_string_new(ptr @.str.114, i64 0)
  %call13 = call ptr @mesh_env_get_with_default(ptr %str11, ptr %str12)
  store ptr %call13, ptr %fly_machine_id, align 8
  %fly_private_ip = alloca ptr, align 8
  %str14 = call ptr @mesh_string_new(ptr @.str.115, i64 14)
  %str15 = call ptr @mesh_string_new(ptr @.str.116, i64 0)
  %call16 = call ptr @mesh_env_get_with_default(ptr %str14, ptr %str15)
  store ptr %call16, ptr %fly_private_ip, align 8
  %explicit_basename_trimmed = alloca ptr, align 8
  %explicit_basename17 = load ptr, ptr %explicit_basename, align 8
  %call18 = call ptr @mesh_string_trim(ptr %explicit_basename17)
  store ptr %call18, ptr %explicit_basename_trimmed, align 8
  %explicit_host_trimmed = alloca ptr, align 8
  %explicit_host19 = load ptr, ptr %explicit_host, align 8
  %call20 = call ptr @mesh_string_trim(ptr %explicit_host19)
  store ptr %call20, ptr %explicit_host_trimmed, align 8
  %explicit_basename_trimmed21 = load ptr, ptr %explicit_basename_trimmed, align 8
  %call22 = call i64 @mesh_string_length(ptr %explicit_basename_trimmed21)
  %gt = icmp sgt i64 %call22, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %explicit_host_trimmed23 = load ptr, ptr %explicit_host_trimmed, align 8
  %call24 = call i64 @mesh_string_length(ptr %explicit_host_trimmed23)
  %eq = icmp eq i64 %call24, 0
  %if_result25 = alloca ptr, align 8
  br i1 %eq, label %then26, label %else27

else:                                             ; preds = %entry
  %explicit_host_trimmed43 = load ptr, ptr %explicit_host_trimmed, align 8
  %call44 = call i64 @mesh_string_length(ptr %explicit_host_trimmed43)
  %gt45 = icmp sgt i64 %call44, 0
  %if_result46 = alloca ptr, align 8
  br i1 %gt45, label %then47, label %else48

if_merge:                                         ; preds = %if_merge49, %if_merge28
  %if_val115 = load ptr, ptr %if_result, align 8
  ret ptr %if_val115

then26:                                           ; preds = %then
  %call29 = call ptr @explicit_identity_required()
  call void @mesh_reduction_check()
  %call30 = call ptr @Config__invalid_cluster_identity(ptr %call29)
  call void @mesh_reduction_check()
  store ptr %call30, ptr %if_result25, align 8
  br label %if_merge28

else27:                                           ; preds = %then
  %explicit_basename_trimmed31 = load ptr, ptr %explicit_basename_trimmed, align 8
  %call32 = call ptr @Config__validated_basename_or_empty(ptr %explicit_basename_trimmed31)
  call void @mesh_reduction_check()
  %str33 = call ptr @mesh_string_new(ptr @.str.117, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %call32, ptr %str33)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result34 = alloca ptr, align 8
  br i1 %str_eq_bool, label %then35, label %else36

if_merge28:                                       ; preds = %if_merge37, %then26
  %if_val42 = load ptr, ptr %if_result25, align 8
  store ptr %if_val42, ptr %if_result, align 8
  br label %if_merge

then35:                                           ; preds = %else27
  %str38 = call ptr @mesh_string_new(ptr @.str.118, i64 30)
  %call39 = call ptr @Config__invalid_cluster_identity(ptr %str38)
  call void @mesh_reduction_check()
  store ptr %call39, ptr %if_result34, align 8
  br label %if_merge37

else36:                                           ; preds = %else27
  %explicit_host_trimmed40 = load ptr, ptr %explicit_host_trimmed, align 8
  %call41 = call ptr @Config__host_validation_error(ptr %explicit_host_trimmed40)
  call void @mesh_reduction_check()
  store ptr %call41, ptr %if_result34, align 8
  br label %if_merge37

if_merge37:                                       ; preds = %else36, %then35
  %if_val = load ptr, ptr %if_result34, align 8
  store ptr %if_val, ptr %if_result25, align 8
  br label %if_merge28

then47:                                           ; preds = %else
  %call50 = call ptr @explicit_identity_required()
  call void @mesh_reduction_check()
  %call51 = call ptr @Config__invalid_cluster_identity(ptr %call50)
  call void @mesh_reduction_check()
  store ptr %call51, ptr %if_result46, align 8
  br label %if_merge49

else48:                                           ; preds = %else
  %fly_app_name52 = load ptr, ptr %fly_app_name, align 8
  %fly_region53 = load ptr, ptr %fly_region, align 8
  %fly_machine_id54 = load ptr, ptr %fly_machine_id, align 8
  %fly_private_ip55 = load ptr, ptr %fly_private_ip, align 8
  %call56 = call i1 @Config__any_fly_identity_set(ptr %fly_app_name52, ptr %fly_region53, ptr %fly_machine_id54, ptr %fly_private_ip55)
  call void @mesh_reduction_check()
  %if_result57 = alloca ptr, align 8
  br i1 %call56, label %then58, label %else59

if_merge49:                                       ; preds = %if_merge60, %then47
  %if_val114 = load ptr, ptr %if_result46, align 8
  store ptr %if_val114, ptr %if_result, align 8
  br label %if_merge

then58:                                           ; preds = %else48
  %app_name = alloca ptr, align 8
  %fly_app_name61 = load ptr, ptr %fly_app_name, align 8
  %call62 = call ptr @mesh_string_trim(ptr %fly_app_name61)
  store ptr %call62, ptr %app_name, align 8
  %region = alloca ptr, align 8
  %fly_region63 = load ptr, ptr %fly_region, align 8
  %call64 = call ptr @mesh_string_trim(ptr %fly_region63)
  store ptr %call64, ptr %region, align 8
  %machine_id = alloca ptr, align 8
  %fly_machine_id65 = load ptr, ptr %fly_machine_id, align 8
  %call66 = call ptr @mesh_string_trim(ptr %fly_machine_id65)
  store ptr %call66, ptr %machine_id, align 8
  %private_ip_trimmed = alloca ptr, align 8
  %fly_private_ip67 = load ptr, ptr %fly_private_ip, align 8
  %call68 = call ptr @mesh_string_trim(ptr %fly_private_ip67)
  store ptr %call68, ptr %private_ip_trimmed, align 8
  %app_name69 = load ptr, ptr %app_name, align 8
  %call70 = call i64 @mesh_string_length(ptr %app_name69)
  %eq71 = icmp eq i64 %call70, 0
  %if_result72 = alloca ptr, align 8
  br i1 %eq71, label %then73, label %else74

else59:                                           ; preds = %else48
  %call111 = call ptr @missing_identity_source()
  call void @mesh_reduction_check()
  %call112 = call ptr @Config__invalid_cluster_identity(ptr %call111)
  call void @mesh_reduction_check()
  store ptr %call112, ptr %if_result57, align 8
  br label %if_merge60

if_merge60:                                       ; preds = %else59, %if_merge75
  %if_val113 = load ptr, ptr %if_result57, align 8
  store ptr %if_val113, ptr %if_result46, align 8
  br label %if_merge49

then73:                                           ; preds = %then58
  %call76 = call ptr @fly_identity_required()
  call void @mesh_reduction_check()
  %call77 = call ptr @Config__invalid_cluster_identity(ptr %call76)
  call void @mesh_reduction_check()
  store ptr %call77, ptr %if_result72, align 8
  br label %if_merge75

else74:                                           ; preds = %then58
  %region78 = load ptr, ptr %region, align 8
  %call79 = call i64 @mesh_string_length(ptr %region78)
  %eq80 = icmp eq i64 %call79, 0
  %if_result81 = alloca ptr, align 8
  br i1 %eq80, label %then82, label %else83

if_merge75:                                       ; preds = %if_merge84, %then73
  %if_val110 = load ptr, ptr %if_result72, align 8
  store ptr %if_val110, ptr %if_result57, align 8
  br label %if_merge60

then82:                                           ; preds = %else74
  %call85 = call ptr @fly_identity_required()
  call void @mesh_reduction_check()
  %call86 = call ptr @Config__invalid_cluster_identity(ptr %call85)
  call void @mesh_reduction_check()
  store ptr %call86, ptr %if_result81, align 8
  br label %if_merge84

else83:                                           ; preds = %else74
  %machine_id87 = load ptr, ptr %machine_id, align 8
  %call88 = call i64 @mesh_string_length(ptr %machine_id87)
  %eq89 = icmp eq i64 %call88, 0
  %if_result90 = alloca ptr, align 8
  br i1 %eq89, label %then91, label %else92

if_merge84:                                       ; preds = %if_merge93, %then82
  %if_val109 = load ptr, ptr %if_result81, align 8
  store ptr %if_val109, ptr %if_result72, align 8
  br label %if_merge75

then91:                                           ; preds = %else83
  %call94 = call ptr @fly_identity_required()
  call void @mesh_reduction_check()
  %call95 = call ptr @Config__invalid_cluster_identity(ptr %call94)
  call void @mesh_reduction_check()
  store ptr %call95, ptr %if_result90, align 8
  br label %if_merge93

else92:                                           ; preds = %else83
  %private_ip_trimmed96 = load ptr, ptr %private_ip_trimmed, align 8
  %call97 = call i64 @mesh_string_length(ptr %private_ip_trimmed96)
  %eq98 = icmp eq i64 %call97, 0
  %if_result99 = alloca ptr, align 8
  br i1 %eq98, label %then100, label %else101

if_merge93:                                       ; preds = %if_merge102, %then91
  %if_val108 = load ptr, ptr %if_result90, align 8
  store ptr %if_val108, ptr %if_result81, align 8
  br label %if_merge84

then100:                                          ; preds = %else92
  %call103 = call ptr @fly_identity_required()
  call void @mesh_reduction_check()
  %call104 = call ptr @Config__invalid_cluster_identity(ptr %call103)
  call void @mesh_reduction_check()
  store ptr %call104, ptr %if_result99, align 8
  br label %if_merge102

else101:                                          ; preds = %else92
  %private_ip_trimmed105 = load ptr, ptr %private_ip_trimmed, align 8
  %call106 = call ptr @Config__host_validation_error(ptr %private_ip_trimmed105)
  call void @mesh_reduction_check()
  store ptr %call106, ptr %if_result99, align 8
  br label %if_merge102

if_merge102:                                      ; preds = %else101, %then100
  %if_val107 = load ptr, ptr %if_result99, align 8
  store ptr %if_val107, ptr %if_result90, align 8
  br label %if_merge93
}

define ptr @__json_decode__WorkSubmitBody(ptr %0) {
entry:
  %__input = alloca ptr, align 8
  store ptr %0, ptr %__input, align 8
  %__parse_res = alloca ptr, align 8
  %__input1 = load ptr, ptr %__input, align 8
  %call = call ptr @mesh_json_parse(ptr %__input1)
  store ptr %call, ptr %__parse_res, align 8
  %__parse_res2 = load ptr, ptr %__parse_res, align 8
  %call3 = call i64 @mesh_result_is_ok(ptr %__parse_res2)
  %cond_i1 = trunc i64 %call3 to i1
  %if_result = alloca ptr, align 8
  br i1 %cond_i1, label %then, label %else

then:                                             ; preds = %entry
  %__parsed_json = alloca ptr, align 8
  %__parse_res4 = load ptr, ptr %__parse_res, align 8
  %call5 = call ptr @mesh_result_unwrap(ptr %__parse_res4)
  store ptr %call5, ptr %__parsed_json, align 8
  %__parsed_json6 = load ptr, ptr %__parsed_json, align 8
  %call7 = call ptr @FromJson__from_json__WorkSubmitBody(ptr %__parsed_json6)
  call void @mesh_reduction_check()
  store ptr %call7, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %__parse_res8 = load ptr, ptr %__parse_res, align 8
  store ptr %__parse_res8, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @FromJson__from_json__WorkSubmitBody(ptr %0) {
entry:
  %json = alloca ptr, align 8
  store ptr %0, ptr %json, align 8
  %__get_res_0 = alloca ptr, align 8
  %json1 = load ptr, ptr %json, align 8
  %str = call ptr @mesh_string_new(ptr @.str.119, i64 11)
  %call = call ptr @mesh_json_object_get(ptr %json1, ptr %str)
  store ptr %call, ptr %__get_res_0, align 8
  %__get_res_02 = load ptr, ptr %__get_res_0, align 8
  %call3 = call i64 @mesh_result_is_ok(ptr %__get_res_02)
  %cond_i1 = trunc i64 %call3 to i1
  %if_result = alloca ptr, align 8
  br i1 %cond_i1, label %then, label %else

then:                                             ; preds = %entry
  %__json_field_0 = alloca ptr, align 8
  %__get_res_04 = load ptr, ptr %__get_res_0, align 8
  %call5 = call ptr @mesh_result_unwrap(ptr %__get_res_04)
  store ptr %call5, ptr %__json_field_0, align 8
  %__extract_res_0 = alloca ptr, align 8
  %__json_field_06 = load ptr, ptr %__json_field_0, align 8
  %call7 = call ptr @mesh_json_as_string(ptr %__json_field_06)
  store ptr %call7, ptr %__extract_res_0, align 8
  %__extract_res_08 = load ptr, ptr %__extract_res_0, align 8
  %call9 = call i64 @mesh_result_is_ok(ptr %__extract_res_08)
  %cond_i110 = trunc i64 %call9 to i1
  %if_result11 = alloca ptr, align 8
  br i1 %cond_i110, label %then12, label %else13

else:                                             ; preds = %entry
  %__get_res_049 = load ptr, ptr %__get_res_0, align 8
  store ptr %__get_res_049, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %if_merge14
  %if_val50 = load ptr, ptr %if_result, align 8
  ret ptr %if_val50

then12:                                           ; preds = %then
  %__field_0 = alloca ptr, align 8
  %__extract_res_015 = load ptr, ptr %__extract_res_0, align 8
  %call16 = call ptr @mesh_result_unwrap(ptr %__extract_res_015)
  store ptr %call16, ptr %__field_0, align 8
  %__get_res_1 = alloca ptr, align 8
  %json17 = load ptr, ptr %json, align 8
  %str18 = call ptr @mesh_string_new(ptr @.str.120, i64 7)
  %call19 = call ptr @mesh_json_object_get(ptr %json17, ptr %str18)
  store ptr %call19, ptr %__get_res_1, align 8
  %__get_res_120 = load ptr, ptr %__get_res_1, align 8
  %call21 = call i64 @mesh_result_is_ok(ptr %__get_res_120)
  %cond_i122 = trunc i64 %call21 to i1
  %if_result23 = alloca ptr, align 8
  br i1 %cond_i122, label %then24, label %else25

else13:                                           ; preds = %then
  %__extract_res_047 = load ptr, ptr %__extract_res_0, align 8
  store ptr %__extract_res_047, ptr %if_result11, align 8
  br label %if_merge14

if_merge14:                                       ; preds = %else13, %if_merge26
  %if_val48 = load ptr, ptr %if_result11, align 8
  store ptr %if_val48, ptr %if_result, align 8
  br label %if_merge

then24:                                           ; preds = %then12
  %__json_field_1 = alloca ptr, align 8
  %__get_res_127 = load ptr, ptr %__get_res_1, align 8
  %call28 = call ptr @mesh_result_unwrap(ptr %__get_res_127)
  store ptr %call28, ptr %__json_field_1, align 8
  %__extract_res_1 = alloca ptr, align 8
  %__json_field_129 = load ptr, ptr %__json_field_1, align 8
  %call30 = call ptr @mesh_json_as_string(ptr %__json_field_129)
  store ptr %call30, ptr %__extract_res_1, align 8
  %__extract_res_131 = load ptr, ptr %__extract_res_1, align 8
  %call32 = call i64 @mesh_result_is_ok(ptr %__extract_res_131)
  %cond_i133 = trunc i64 %call32 to i1
  %if_result34 = alloca ptr, align 8
  br i1 %cond_i133, label %then35, label %else36

else25:                                           ; preds = %then12
  %__get_res_145 = load ptr, ptr %__get_res_1, align 8
  store ptr %__get_res_145, ptr %if_result23, align 8
  br label %if_merge26

if_merge26:                                       ; preds = %else25, %if_merge37
  %if_val46 = load ptr, ptr %if_result23, align 8
  store ptr %if_val46, ptr %if_result11, align 8
  br label %if_merge14

then35:                                           ; preds = %then24
  %__field_1 = alloca ptr, align 8
  %__extract_res_138 = load ptr, ptr %__extract_res_1, align 8
  %call39 = call ptr @mesh_result_unwrap(ptr %__extract_res_138)
  store ptr %call39, ptr %__field_1, align 8
  %struct_lit = alloca %WorkSubmitBody.4, align 8
  %__field_040 = load ptr, ptr %__field_0, align 8
  %field_ptr = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %struct_lit, i32 0, i32 0
  store ptr %__field_040, ptr %field_ptr, align 8
  %__field_141 = load ptr, ptr %__field_1, align 8
  %field_ptr42 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %struct_lit, i32 0, i32 1
  store ptr %__field_141, ptr %field_ptr42, align 8
  %struct_val = load %WorkSubmitBody.4, ptr %struct_lit, align 8
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkSubmitBody.4, ptr null, i32 1) to i64), i64 8)
  store %WorkSubmitBody.4 %struct_val, ptr %struct_heap, align 8
  %call43 = call ptr @mesh_alloc_result(i64 0, ptr %struct_heap)
  store ptr %call43, ptr %if_result34, align 8
  br label %if_merge37

else36:                                           ; preds = %then24
  %__extract_res_144 = load ptr, ptr %__extract_res_1, align 8
  store ptr %__extract_res_144, ptr %if_result34, align 8
  br label %if_merge37

if_merge37:                                       ; preds = %else36, %then35
  %if_val = load ptr, ptr %if_result34, align 8
  store ptr %if_val, ptr %if_result23, align 8
  br label %if_merge26
}

define ptr @ToJson__to_json__WorkStatusPayload(%WorkStatusPayload.6 %0) {
entry:
  %self = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %0, ptr %self, align 8
  %call = call ptr @mesh_json_object_new()
  %str = call ptr @mesh_string_new(ptr @.str.121, i64 2)
  %self1 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp, i32 0, i32 0
  %field_val = load i1, ptr %field_ptr, align 1
  %zext_arg = zext i1 %field_val to i8
  %call2 = call ptr @mesh_json_from_bool(i8 %zext_arg)
  %call3 = call ptr @mesh_json_object_put(ptr %call, ptr %str, ptr %call2)
  %str4 = call ptr @mesh_string_new(ptr @.str.122, i64 11)
  %self5 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp6 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self5, ptr %obj_tmp6, align 8
  %field_ptr7 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp6, i32 0, i32 1
  %field_val8 = load ptr, ptr %field_ptr7, align 8
  %call9 = call ptr @mesh_json_from_string(ptr %field_val8)
  %call10 = call ptr @mesh_json_object_put(ptr %call3, ptr %str4, ptr %call9)
  %str11 = call ptr @mesh_string_new(ptr @.str.123, i64 10)
  %self12 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp13 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self12, ptr %obj_tmp13, align 8
  %field_ptr14 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp13, i32 0, i32 2
  %field_val15 = load ptr, ptr %field_ptr14, align 8
  %call16 = call ptr @mesh_json_from_string(ptr %field_val15)
  %call17 = call ptr @mesh_json_object_put(ptr %call10, ptr %str11, ptr %call16)
  %str18 = call ptr @mesh_string_new(ptr @.str.124, i64 5)
  %self19 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp20 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self19, ptr %obj_tmp20, align 8
  %field_ptr21 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp20, i32 0, i32 3
  %field_val22 = load ptr, ptr %field_ptr21, align 8
  %call23 = call ptr @mesh_json_from_string(ptr %field_val22)
  %call24 = call ptr @mesh_json_object_put(ptr %call17, ptr %str18, ptr %call23)
  %str25 = call ptr @mesh_string_new(ptr @.str.125, i64 6)
  %self26 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp27 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self26, ptr %obj_tmp27, align 8
  %field_ptr28 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp27, i32 0, i32 4
  %field_val29 = load ptr, ptr %field_ptr28, align 8
  %call30 = call ptr @mesh_json_from_string(ptr %field_val29)
  %call31 = call ptr @mesh_json_object_put(ptr %call24, ptr %str25, ptr %call30)
  %str32 = call ptr @mesh_string_new(ptr @.str.126, i64 12)
  %self33 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp34 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self33, ptr %obj_tmp34, align 8
  %field_ptr35 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp34, i32 0, i32 5
  %field_val36 = load ptr, ptr %field_ptr35, align 8
  %call37 = call ptr @mesh_json_from_string(ptr %field_val36)
  %call38 = call ptr @mesh_json_object_put(ptr %call31, ptr %str32, ptr %call37)
  %str39 = call ptr @mesh_string_new(ptr @.str.127, i64 10)
  %self40 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp41 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self40, ptr %obj_tmp41, align 8
  %field_ptr42 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp41, i32 0, i32 6
  %field_val43 = load ptr, ptr %field_ptr42, align 8
  %call44 = call ptr @mesh_json_from_string(ptr %field_val43)
  %call45 = call ptr @mesh_json_object_put(ptr %call38, ptr %str39, ptr %call44)
  %str46 = call ptr @mesh_string_new(ptr @.str.128, i64 12)
  %self47 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp48 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self47, ptr %obj_tmp48, align 8
  %field_ptr49 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp48, i32 0, i32 7
  %field_val50 = load ptr, ptr %field_ptr49, align 8
  %call51 = call ptr @mesh_json_from_string(ptr %field_val50)
  %call52 = call ptr @mesh_json_object_put(ptr %call45, ptr %str46, ptr %call51)
  %str53 = call ptr @mesh_string_new(ptr @.str.129, i64 14)
  %self54 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp55 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self54, ptr %obj_tmp55, align 8
  %field_ptr56 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp55, i32 0, i32 8
  %field_val57 = load ptr, ptr %field_ptr56, align 8
  %call58 = call ptr @mesh_json_from_string(ptr %field_val57)
  %call59 = call ptr @mesh_json_object_put(ptr %call52, ptr %str53, ptr %call58)
  %str60 = call ptr @mesh_string_new(ptr @.str.130, i64 14)
  %self61 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp62 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self61, ptr %obj_tmp62, align 8
  %field_ptr63 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp62, i32 0, i32 9
  %field_val64 = load ptr, ptr %field_ptr63, align 8
  %call65 = call ptr @mesh_json_from_string(ptr %field_val64)
  %call66 = call ptr @mesh_json_object_put(ptr %call59, ptr %str60, ptr %call65)
  %str67 = call ptr @mesh_string_new(ptr @.str.131, i64 15)
  %self68 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp69 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self68, ptr %obj_tmp69, align 8
  %field_ptr70 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp69, i32 0, i32 10
  %field_val71 = load i1, ptr %field_ptr70, align 1
  %zext_arg72 = zext i1 %field_val71 to i8
  %call73 = call ptr @mesh_json_from_bool(i8 %zext_arg72)
  %call74 = call ptr @mesh_json_object_put(ptr %call66, ptr %str67, ptr %call73)
  %str75 = call ptr @mesh_string_new(ptr @.str.132, i64 17)
  %self76 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp77 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self76, ptr %obj_tmp77, align 8
  %field_ptr78 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp77, i32 0, i32 11
  %field_val79 = load i1, ptr %field_ptr78, align 1
  %zext_arg80 = zext i1 %field_val79 to i8
  %call81 = call ptr @mesh_json_from_bool(i8 %zext_arg80)
  %call82 = call ptr @mesh_json_object_put(ptr %call74, ptr %str75, ptr %call81)
  %str83 = call ptr @mesh_string_new(ptr @.str.133, i64 5)
  %self84 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp85 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self84, ptr %obj_tmp85, align 8
  %field_ptr86 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp85, i32 0, i32 12
  %field_val87 = load ptr, ptr %field_ptr86, align 8
  %call88 = call ptr @mesh_json_from_string(ptr %field_val87)
  %call89 = call ptr @mesh_json_object_put(ptr %call82, ptr %str83, ptr %call88)
  %str90 = call ptr @mesh_string_new(ptr @.str.134, i64 15)
  %self91 = load %WorkStatusPayload.6, ptr %self, align 8
  %obj_tmp92 = alloca %WorkStatusPayload.6, align 8
  store %WorkStatusPayload.6 %self91, ptr %obj_tmp92, align 8
  %field_ptr93 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %obj_tmp92, i32 0, i32 13
  %field_val94 = load ptr, ptr %field_ptr93, align 8
  %call95 = call ptr @mesh_json_from_string(ptr %field_val94)
  %call96 = call ptr @mesh_json_object_put(ptr %call89, ptr %str90, ptr %call95)
  ret ptr %call96
}

define ptr @Work__build_membership(ptr %0, ptr %1) {
entry:
  %self_name = alloca ptr, align 8
  store ptr %0, ptr %self_name, align 8
  %peers = alloca ptr, align 8
  store ptr %1, ptr %peers, align 8
  %self_name1 = load ptr, ptr %self_name, align 8
  %call = call i64 @mesh_string_length(ptr %self_name1)
  %gt = icmp sgt i64 %call, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %list_arr = alloca [1 x i64], align 8
  %self_name2 = load ptr, ptr %self_name, align 8
  %ptr_to_i64 = ptrtoint ptr %self_name2 to i64
  %elem_ptr = getelementptr [1 x i64], ptr %list_arr, i32 0, i32 0
  store i64 %ptr_to_i64, ptr %elem_ptr, align 8
  %list = call ptr @mesh_list_from_array(ptr %list_arr, i64 1)
  %peers3 = load ptr, ptr %peers, align 8
  %list_concat = call ptr @mesh_list_concat(ptr %list, ptr %peers3)
  store ptr %list_concat, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %peers4 = load ptr, ptr %peers, align 8
  store ptr %peers4, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define i64 @Work__find_index(ptr %0, ptr %1, i64 %2) {
entry:
  %if_result7 = alloca i64, align 8
  %if_result = alloca i64, align 8
  %nodes = alloca ptr, align 8
  store ptr %0, ptr %nodes, align 8
  %target = alloca ptr, align 8
  store ptr %1, ptr %target, align 8
  %i = alloca i64, align 8
  store i64 %2, ptr %i, align 8
  br label %tce_loop

tce_loop:                                         ; preds = %else9, %entry
  %i1 = load i64, ptr %i, align 8
  %nodes2 = load ptr, ptr %nodes, align 8
  %call = call i64 @mesh_list_length(ptr %nodes2)
  %lt = icmp slt i64 %i1, %call
  br i1 %lt, label %then, label %else

then:                                             ; preds = %tce_loop
  %nodes3 = load ptr, ptr %nodes, align 8
  %i4 = load i64, ptr %i, align 8
  %call5 = call i64 @mesh_list_get(ptr %nodes3, i64 %i4)
  %i64_to_ptr = inttoptr i64 %call5 to ptr
  %target6 = load ptr, ptr %target, align 8
  %str_eq = call i8 @mesh_string_eq(ptr %i64_to_ptr, ptr %target6)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  br i1 %str_eq_bool, label %then8, label %else9

else:                                             ; preds = %tce_loop
  store i64 -1, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %if_merge10
  %if_val15 = load i64, ptr %if_result, align 8
  ret i64 %if_val15

then8:                                            ; preds = %then
  %i11 = load i64, ptr %i, align 8
  store i64 %i11, ptr %if_result7, align 8
  br label %if_merge10

else9:                                            ; preds = %then
  %nodes12 = load ptr, ptr %nodes, align 8
  %target13 = load ptr, ptr %target, align 8
  %i14 = load i64, ptr %i, align 8
  %add = add i64 %i14, 1
  store ptr %nodes12, ptr %nodes, align 8
  store ptr %target13, ptr %target, align 8
  store i64 %add, ptr %i, align 8
  call void @mesh_reduction_check()
  br label %tce_loop

if_merge10:                                       ; preds = %then8
  %if_val = load i64, ptr %if_result7, align 8
  store i64 %if_val, ptr %if_result, align 8
  br label %if_merge
}

define i64 @Work__find_first_peer_index(ptr %0, ptr %1, i64 %2) {
entry:
  %if_result7 = alloca i64, align 8
  %if_result = alloca i64, align 8
  %nodes = alloca ptr, align 8
  store ptr %0, ptr %nodes, align 8
  %self_name = alloca ptr, align 8
  store ptr %1, ptr %self_name, align 8
  %i = alloca i64, align 8
  store i64 %2, ptr %i, align 8
  br label %tce_loop

tce_loop:                                         ; preds = %else9, %entry
  %i1 = load i64, ptr %i, align 8
  %nodes2 = load ptr, ptr %nodes, align 8
  %call = call i64 @mesh_list_length(ptr %nodes2)
  %lt = icmp slt i64 %i1, %call
  br i1 %lt, label %then, label %else

then:                                             ; preds = %tce_loop
  %nodes3 = load ptr, ptr %nodes, align 8
  %i4 = load i64, ptr %i, align 8
  %call5 = call i64 @mesh_list_get(ptr %nodes3, i64 %i4)
  %i64_to_ptr = inttoptr i64 %call5 to ptr
  %self_name6 = load ptr, ptr %self_name, align 8
  %str_eq = call i8 @mesh_string_eq(ptr %i64_to_ptr, ptr %self_name6)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %str_neq = xor i1 %str_eq_bool, true
  br i1 %str_neq, label %then8, label %else9

else:                                             ; preds = %tce_loop
  %nodes15 = load ptr, ptr %nodes, align 8
  %self_name16 = load ptr, ptr %self_name, align 8
  %call17 = call i64 @Work__find_index(ptr %nodes15, ptr %self_name16, i64 0)
  call void @mesh_reduction_check()
  store i64 %call17, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %if_merge10
  %if_val18 = load i64, ptr %if_result, align 8
  ret i64 %if_val18

then8:                                            ; preds = %then
  %i11 = load i64, ptr %i, align 8
  store i64 %i11, ptr %if_result7, align 8
  br label %if_merge10

else9:                                            ; preds = %then
  %nodes12 = load ptr, ptr %nodes, align 8
  %self_name13 = load ptr, ptr %self_name, align 8
  %i14 = load i64, ptr %i, align 8
  %add = add i64 %i14, 1
  store ptr %nodes12, ptr %nodes, align 8
  store ptr %self_name13, ptr %self_name, align 8
  store i64 %add, ptr %i, align 8
  call void @mesh_reduction_check()
  br label %tce_loop

if_merge10:                                       ; preds = %then8
  %if_val = load i64, ptr %if_result7, align 8
  store i64 %if_val, ptr %if_result, align 8
  br label %if_merge
}

define i64 @Work__max_request_key_length() {
entry:
  ret i64 128
}

define ptr @Work__pending_phase() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.135, i64 9)
  ret ptr %str
}

define ptr @Work__pending_result() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.136, i64 7)
  ret ptr %str
}

define ptr @Work__completed_phase() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.137, i64 9)
  ret ptr %str
}

define ptr @Work__succeeded_result() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.138, i64 9)
  ret ptr %str
}

define ptr @Work__missing_phase() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.139, i64 7)
  ret ptr %str
}

define ptr @Work__unknown_result() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.140, i64 7)
  ret ptr %str
}

define ptr @Work__invalid_phase() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.141, i64 7)
  ret ptr %str
}

define ptr @Work__rejected_result() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.142, i64 8)
  ret ptr %str
}

define ptr @Work__unassigned_replica_status() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.143, i64 10)
  ret ptr %str
}

define ptr @Work__assigned_replica_status(ptr %0) {
entry:
  %replica_node = alloca ptr, align 8
  store ptr %0, ptr %replica_node, align 8
  %replica_node1 = load ptr, ptr %replica_node, align 8
  %call = call i64 @mesh_string_length(ptr %replica_node1)
  %gt = icmp sgt i64 %call, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.144, i64 8)
  store ptr %str, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %call2 = call ptr @Work__unassigned_replica_status()
  call void @mesh_reduction_check()
  store ptr %call2, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @Work__payload_hash(ptr %0) {
entry:
  %payload = alloca ptr, align 8
  store ptr %0, ptr %payload, align 8
  %payload1 = load ptr, ptr %payload, align 8
  %call = call ptr @mesh_crypto_sha256(ptr %payload1)
  ret ptr %call
}

define ptr @attempt_id_from_token(i64 %0) {
entry:
  %token = alloca i64, align 8
  store i64 %0, ptr %token, align 8
  %str = call ptr @mesh_string_new(ptr @.str.145, i64 8)
  %token1 = load i64, ptr %token, align 8
  %call = call ptr @mesh_int_to_string(i64 %token1)
  %call2 = call ptr @mesh_string_concat(ptr %str, ptr %call)
  ret ptr %call2
}

define ptr @request_registry_name_for_node(ptr %0) {
entry:
  %node_name = alloca ptr, align 8
  store ptr %0, ptr %node_name, align 8
  %node_name1 = load ptr, ptr %node_name, align 8
  %call = call i64 @mesh_string_length(ptr %node_name1)
  %gt = icmp sgt i64 %call, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.146, i64 28)
  %node_name2 = load ptr, ptr %node_name, align 8
  %call3 = call ptr @mesh_string_concat(ptr %str, ptr %node_name2)
  store ptr %call3, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str4 = call ptr @mesh_string_new(ptr @.str.147, i64 27)
  store ptr %str4, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @Work__standalone_work_node_name() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.148, i64 16)
  ret ptr %str
}

define ptr @Work__effective_work_node_name() {
entry:
  %self_name = alloca ptr, align 8
  %call = call ptr @current_self_name()
  call void @mesh_reduction_check()
  store ptr %call, ptr %self_name, align 8
  %self_name1 = load ptr, ptr %self_name, align 8
  %call2 = call i64 @mesh_string_length(ptr %self_name1)
  %gt = icmp sgt i64 %call2, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %self_name3 = load ptr, ptr %self_name, align 8
  store ptr %self_name3, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %call4 = call ptr @Work__standalone_work_node_name()
  call void @mesh_reduction_check()
  store ptr %call4, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @resolve_member_at(ptr %0, i64 %1) {
entry:
  %nodes = alloca ptr, align 8
  store ptr %0, ptr %nodes, align 8
  %index = alloca i64, align 8
  store i64 %1, ptr %index, align 8
  %index1 = load i64, ptr %index, align 8
  %lt = icmp slt i64 %index1, 0
  %if_result = alloca ptr, align 8
  br i1 %lt, label %then, label %else

then:                                             ; preds = %entry
  %str = call ptr @mesh_string_new(ptr @.str.149, i64 0)
  store ptr %str, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %index2 = load i64, ptr %index, align 8
  %nodes3 = load ptr, ptr %nodes, align 8
  %call = call i64 @mesh_list_length(ptr %nodes3)
  %ge = icmp sge i64 %index2, %call
  %if_result4 = alloca ptr, align 8
  br i1 %ge, label %then5, label %else6

if_merge:                                         ; preds = %if_merge7, %then
  %if_val12 = load ptr, ptr %if_result, align 8
  ret ptr %if_val12

then5:                                            ; preds = %else
  %str8 = call ptr @mesh_string_new(ptr @.str.150, i64 0)
  store ptr %str8, ptr %if_result4, align 8
  br label %if_merge7

else6:                                            ; preds = %else
  %nodes9 = load ptr, ptr %nodes, align 8
  %index10 = load i64, ptr %index, align 8
  %call11 = call i64 @mesh_list_get(ptr %nodes9, i64 %index10)
  %i64_to_ptr = inttoptr i64 %call11 to ptr
  store ptr %i64_to_ptr, ptr %if_result4, align 8
  br label %if_merge7

if_merge7:                                        ; preds = %else6, %then5
  %if_val = load ptr, ptr %if_result4, align 8
  store ptr %if_val, ptr %if_result, align 8
  br label %if_merge
}

define %TargetSelection.3 @route_selection(ptr %0, ptr %1) {
entry:
  %self_name = alloca ptr, align 8
  store ptr %0, ptr %self_name, align 8
  %peers = alloca ptr, align 8
  store ptr %1, ptr %peers, align 8
  %membership = alloca ptr, align 8
  %self_name1 = load ptr, ptr %self_name, align 8
  %peers2 = load ptr, ptr %peers, align 8
  %call = call ptr @Work__build_membership(ptr %self_name1, ptr %peers2)
  call void @mesh_reduction_check()
  store ptr %call, ptr %membership, align 8
  %ingress_index = alloca i64, align 8
  %self_name3 = load ptr, ptr %self_name, align 8
  %call4 = call i64 @mesh_string_length(ptr %self_name3)
  %gt = icmp sgt i64 %call4, 0
  %if_result = alloca i64, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %membership5 = load ptr, ptr %membership, align 8
  %self_name6 = load ptr, ptr %self_name, align 8
  %call7 = call i64 @Work__find_index(ptr %membership5, ptr %self_name6, i64 0)
  call void @mesh_reduction_check()
  store i64 %call7, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  store i64 -1, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load i64, ptr %if_result, align 8
  store i64 %if_val, ptr %ingress_index, align 8
  %target_index = alloca i64, align 8
  %membership8 = load ptr, ptr %membership, align 8
  %call9 = call i64 @mesh_list_length(ptr %membership8)
  %gt10 = icmp sgt i64 %call9, 0
  %if_result11 = alloca i64, align 8
  br i1 %gt10, label %then12, label %else13

then12:                                           ; preds = %if_merge
  %membership15 = load ptr, ptr %membership, align 8
  %self_name16 = load ptr, ptr %self_name, align 8
  %call17 = call i64 @Work__find_first_peer_index(ptr %membership15, ptr %self_name16, i64 0)
  call void @mesh_reduction_check()
  store i64 %call17, ptr %if_result11, align 8
  br label %if_merge14

else13:                                           ; preds = %if_merge
  store i64 -1, ptr %if_result11, align 8
  br label %if_merge14

if_merge14:                                       ; preds = %else13, %then12
  %if_val18 = load i64, ptr %if_result11, align 8
  store i64 %if_val18, ptr %target_index, align 8
  %routed_remotely = alloca i1, align 1
  %ingress_index19 = load i64, ptr %ingress_index, align 8
  %ge = icmp sge i64 %ingress_index19, 0
  %if_result20 = alloca i1, align 1
  br i1 %ge, label %then21, label %else22

then21:                                           ; preds = %if_merge14
  %target_index24 = load i64, ptr %target_index, align 8
  %ge25 = icmp sge i64 %target_index24, 0
  %if_result26 = alloca i1, align 1
  br i1 %ge25, label %then27, label %else28

else22:                                           ; preds = %if_merge14
  store i1 false, ptr %if_result20, align 1
  br label %if_merge23

if_merge23:                                       ; preds = %else22, %if_merge29
  %if_val33 = load i1, ptr %if_result20, align 1
  store i1 %if_val33, ptr %routed_remotely, align 1
  %struct_lit = alloca %TargetSelection.3, align 8
  %membership34 = load ptr, ptr %membership, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %struct_lit, i32 0, i32 0
  store ptr %membership34, ptr %field_ptr, align 8
  %ingress_index35 = load i64, ptr %ingress_index, align 8
  %field_ptr36 = getelementptr inbounds nuw %TargetSelection.3, ptr %struct_lit, i32 0, i32 1
  store i64 %ingress_index35, ptr %field_ptr36, align 8
  %target_index37 = load i64, ptr %target_index, align 8
  %field_ptr38 = getelementptr inbounds nuw %TargetSelection.3, ptr %struct_lit, i32 0, i32 2
  store i64 %target_index37, ptr %field_ptr38, align 8
  %routed_remotely39 = load i1, ptr %routed_remotely, align 1
  %field_ptr40 = getelementptr inbounds nuw %TargetSelection.3, ptr %struct_lit, i32 0, i32 3
  store i1 %routed_remotely39, ptr %field_ptr40, align 1
  %routed_remotely41 = load i1, ptr %routed_remotely, align 1
  %if_result42 = alloca i1, align 1
  br i1 %routed_remotely41, label %then43, label %else44

then27:                                           ; preds = %then21
  %target_index30 = load i64, ptr %target_index, align 8
  %ingress_index31 = load i64, ptr %ingress_index, align 8
  %ne = icmp ne i64 %target_index30, %ingress_index31
  store i1 %ne, ptr %if_result26, align 1
  br label %if_merge29

else28:                                           ; preds = %then21
  store i1 false, ptr %if_result26, align 1
  br label %if_merge29

if_merge29:                                       ; preds = %else28, %then27
  %if_val32 = load i1, ptr %if_result26, align 1
  store i1 %if_val32, ptr %if_result20, align 1
  br label %if_merge23

then43:                                           ; preds = %if_merge23
  store i1 false, ptr %if_result42, align 1
  br label %if_merge45

else44:                                           ; preds = %if_merge23
  store i1 true, ptr %if_result42, align 1
  br label %if_merge45

if_merge45:                                       ; preds = %else44, %then43
  %if_val46 = load i1, ptr %if_result42, align 1
  %field_ptr47 = getelementptr inbounds nuw %TargetSelection.3, ptr %struct_lit, i32 0, i32 4
  store i1 %if_val46, ptr %field_ptr47, align 1
  %struct_val = load %TargetSelection.3, ptr %struct_lit, align 8
  ret %TargetSelection.3 %struct_val
}

define ptr @selection_membership(%TargetSelection.3 %0) {
entry:
  %selection = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %0, ptr %selection, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %obj_tmp = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %selection1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  ret ptr %field_val
}

define i64 @selection_ingress_index(%TargetSelection.3 %0) {
entry:
  %selection = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %0, ptr %selection, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %obj_tmp = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %selection1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %obj_tmp, i32 0, i32 1
  %field_val = load i64, ptr %field_ptr, align 8
  ret i64 %field_val
}

define i64 @selection_target_index(%TargetSelection.3 %0) {
entry:
  %selection = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %0, ptr %selection, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %obj_tmp = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %selection1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %obj_tmp, i32 0, i32 2
  %field_val = load i64, ptr %field_ptr, align 8
  ret i64 %field_val
}

define i1 @selection_routed_remotely(%TargetSelection.3 %0) {
entry:
  %selection = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %0, ptr %selection, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %obj_tmp = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %selection1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %obj_tmp, i32 0, i32 3
  %field_val = load i1, ptr %field_ptr, align 1
  ret i1 %field_val
}

define i1 @selection_fell_back_locally(%TargetSelection.3 %0) {
entry:
  %selection = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %0, ptr %selection, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %obj_tmp = alloca %TargetSelection.3, align 8
  store %TargetSelection.3 %selection1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %TargetSelection.3, ptr %obj_tmp, i32 0, i32 4
  %field_val = load i1, ptr %field_ptr, align 1
  ret i1 %field_val
}

define { i8, ptr } @validate_request_key(ptr %0) {
entry:
  %raw_key = alloca ptr, align 8
  store ptr %0, ptr %raw_key, align 8
  %trimmed = alloca ptr, align 8
  %raw_key1 = load ptr, ptr %raw_key, align 8
  %call = call ptr @mesh_string_trim(ptr %raw_key1)
  store ptr %call, ptr %trimmed, align 8
  %trimmed2 = load ptr, ptr %trimmed, align 8
  %call3 = call i64 @mesh_string_length(ptr %trimmed2)
  %eq = icmp eq i64 %call3, 0
  %if_result = alloca { i8, ptr }, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 1, ptr %tag_ptr, align 1
  %str = call ptr @mesh_string_new(ptr @.str.151, i64 23)
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %str, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %trimmed4 = load ptr, ptr %trimmed, align 8
  %call5 = call i64 @mesh_string_length(ptr %trimmed4)
  %call6 = call i64 @Work__max_request_key_length()
  call void @mesh_reduction_check()
  %gt = icmp sgt i64 %call5, %call6
  %if_result7 = alloca { i8, ptr }, align 8
  br i1 %gt, label %then8, label %else9

if_merge:                                         ; preds = %if_merge10, %then
  %if_val21 = load { i8, ptr }, ptr %if_result, align 8
  ret { i8, ptr } %if_val21

then8:                                            ; preds = %else
  %variant11 = alloca { i8, ptr }, align 8
  %tag_ptr12 = getelementptr inbounds nuw { i8, ptr }, ptr %variant11, i32 0, i32 0
  store i8 1, ptr %tag_ptr12, align 1
  %str13 = call ptr @mesh_string_new(ptr @.str.152, i64 37)
  %vfield_ptr14 = getelementptr inbounds nuw { i8, ptr }, ptr %variant11, i32 0, i32 1
  store ptr %str13, ptr %vfield_ptr14, align 8
  %variant_val15 = load { i8, ptr }, ptr %variant11, align 8
  store { i8, ptr } %variant_val15, ptr %if_result7, align 8
  br label %if_merge10

else9:                                            ; preds = %else
  %variant16 = alloca { i8, ptr }, align 8
  %tag_ptr17 = getelementptr inbounds nuw { i8, ptr }, ptr %variant16, i32 0, i32 0
  store i8 0, ptr %tag_ptr17, align 1
  %trimmed18 = load ptr, ptr %trimmed, align 8
  %vfield_ptr19 = getelementptr inbounds nuw { i8, ptr }, ptr %variant16, i32 0, i32 1
  store ptr %trimmed18, ptr %vfield_ptr19, align 8
  %variant_val20 = load { i8, ptr }, ptr %variant16, align 8
  store { i8, ptr } %variant_val20, ptr %if_result7, align 8
  br label %if_merge10

if_merge10:                                       ; preds = %else9, %then8
  %if_val = load { i8, ptr }, ptr %if_result7, align 8
  store { i8, ptr } %if_val, ptr %if_result, align 8
  br label %if_merge
}

define { i8, ptr } @Work__validate_payload(ptr %0) {
entry:
  %raw_payload = alloca ptr, align 8
  store ptr %0, ptr %raw_payload, align 8
  %raw_payload1 = load ptr, ptr %raw_payload, align 8
  %call = call ptr @mesh_string_trim(ptr %raw_payload1)
  %call2 = call i64 @mesh_string_length(ptr %call)
  %eq = icmp eq i64 %call2, 0
  %if_result = alloca { i8, ptr }, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 1, ptr %tag_ptr, align 1
  %str = call ptr @mesh_string_new(ptr @.str.153, i64 19)
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %str, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %variant3 = alloca { i8, ptr }, align 8
  %tag_ptr4 = getelementptr inbounds nuw { i8, ptr }, ptr %variant3, i32 0, i32 0
  store i8 0, ptr %tag_ptr4, align 1
  %raw_payload5 = load ptr, ptr %raw_payload, align 8
  %vfield_ptr6 = getelementptr inbounds nuw { i8, ptr }, ptr %variant3, i32 0, i32 1
  store ptr %raw_payload5, ptr %vfield_ptr6, align 8
  %variant_val7 = load { i8, ptr }, ptr %variant3, align 8
  store { i8, ptr } %variant_val7, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load { i8, ptr }, ptr %if_result, align 8
  ret { i8, ptr } %if_val
}

define { i8, ptr } @Work__normalize_submit_body(%WorkSubmitBody.4 %0) {
entry:
  %reason = alloca ptr, align 8
  %payload = alloca ptr, align 8
  %request_key = alloca ptr, align 8
  %value = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %0, ptr %value, align 8
  %value1 = load %WorkSubmitBody.4, ptr %value, align 8
  %obj_tmp = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %value1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call { i8, ptr } @validate_request_key(ptr %field_val)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %match_merge9
  %match_val36 = load { i8, ptr }, ptr %match_result, align 8
  ret { i8, ptr } %match_val36

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.154, i64 30, ptr @.panic_file.155, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  store ptr %path_val, ptr %request_key, align 8
  %value2 = load %WorkSubmitBody.4, ptr %value, align 8
  %obj_tmp3 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %value2, ptr %obj_tmp3, align 8
  %field_ptr4 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp3, i32 0, i32 1
  %field_val5 = load ptr, ptr %field_ptr4, align 8
  %call6 = call { i8, ptr } @Work__validate_payload(ptr %field_val5)
  call void @mesh_reduction_check()
  %scrutinee7 = alloca { i8, ptr }, align 8
  store { i8, ptr } %call6, ptr %scrutinee7, align 8
  %match_result8 = alloca { i8, ptr }, align 8
  %tag_ptr10 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee7, i32 0, i32 0
  %tag11 = load i8, ptr %tag_ptr10, align 1
  switch i8 %tag11, label %switch_default12 [
    i8 0, label %case_Ok13
    i8 1, label %case_Err14
  ]

case_Err:                                         ; preds = %entry
  %variant_field29 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val30 = load ptr, ptr %variant_field29, align 8
  store ptr %path_val30, ptr %reason, align 8
  %variant31 = alloca { i8, ptr }, align 8
  %tag_ptr32 = getelementptr inbounds nuw { i8, ptr }, ptr %variant31, i32 0, i32 0
  store i8 1, ptr %tag_ptr32, align 1
  %reason33 = load ptr, ptr %reason, align 8
  %vfield_ptr34 = getelementptr inbounds nuw { i8, ptr }, ptr %variant31, i32 0, i32 1
  store ptr %reason33, ptr %vfield_ptr34, align 8
  %variant_val35 = load { i8, ptr }, ptr %variant31, align 8
  store { i8, ptr } %variant_val35, ptr %match_result, align 8
  br label %match_merge

match_merge9:                                     ; preds = %case_Err14, %case_Ok13
  %match_val = load { i8, ptr }, ptr %match_result8, align 8
  store { i8, ptr } %match_val, ptr %match_result, align 8
  br label %match_merge

switch_default12:                                 ; preds = %case_Ok
  call void @mesh_panic(ptr @.panic_msg, i64 30, ptr @.panic_file, i64 9, i32 0)
  unreachable

case_Ok13:                                        ; preds = %case_Ok
  %variant_field15 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee7, i32 0, i32 1
  %path_val16 = load ptr, ptr %variant_field15, align 8
  store ptr %path_val16, ptr %payload, align 8
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr17 = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 0, ptr %tag_ptr17, align 1
  %struct_lit = alloca %WorkSubmitBody.4, align 8
  %request_key18 = load ptr, ptr %request_key, align 8
  %field_ptr19 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %struct_lit, i32 0, i32 0
  store ptr %request_key18, ptr %field_ptr19, align 8
  %payload20 = load ptr, ptr %payload, align 8
  %field_ptr21 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %struct_lit, i32 0, i32 1
  store ptr %payload20, ptr %field_ptr21, align 8
  %struct_val = load %WorkSubmitBody.4, ptr %struct_lit, align 8
  %variant_box = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkSubmitBody.4, ptr null, i32 1) to i64), i64 8)
  store %WorkSubmitBody.4 %struct_val, ptr %variant_box, align 8
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %variant_box, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %match_result8, align 8
  br label %match_merge9

case_Err14:                                       ; preds = %case_Ok
  %variant_field22 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee7, i32 0, i32 1
  %path_val23 = load ptr, ptr %variant_field22, align 8
  store ptr %path_val23, ptr %reason, align 8
  %variant24 = alloca { i8, ptr }, align 8
  %tag_ptr25 = getelementptr inbounds nuw { i8, ptr }, ptr %variant24, i32 0, i32 0
  store i8 1, ptr %tag_ptr25, align 1
  %reason26 = load ptr, ptr %reason, align 8
  %vfield_ptr27 = getelementptr inbounds nuw { i8, ptr }, ptr %variant24, i32 0, i32 1
  store ptr %reason26, ptr %vfield_ptr27, align 8
  %variant_val28 = load { i8, ptr }, ptr %variant24, align 8
  store { i8, ptr } %variant_val28, ptr %match_result8, align 8
  br label %match_merge9
}

define { i8, ptr } @parse_submit_body(ptr %0) {
entry:
  %value = alloca %WorkSubmitBody.4, align 8
  %body = alloca ptr, align 8
  store ptr %0, ptr %body, align 8
  %parsed = alloca { i8, ptr }, align 8
  %body1 = load ptr, ptr %body, align 8
  %call = call ptr @__json_decode__WorkSubmitBody(ptr %body1)
  call void @mesh_reduction_check()
  %deref_sum = load { i8, ptr }, ptr %call, align 8
  store { i8, ptr } %deref_sum, ptr %parsed, align 8
  %parsed2 = load { i8, ptr }, ptr %parsed, align 8
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %parsed2, ptr %scrutinee, align 8
  %match_result = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load { i8, ptr }, ptr %match_result, align 8
  ret { i8, ptr } %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.157, i64 30, ptr @.panic_file.158, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkSubmitBody.4, ptr %path_val, align 8
  store %WorkSubmitBody.4 %deref_struct, ptr %value, align 8
  %value3 = load %WorkSubmitBody.4, ptr %value, align 8
  %call4 = call { i8, ptr } @Work__normalize_submit_body(%WorkSubmitBody.4 %value3)
  call void @mesh_reduction_check()
  store { i8, ptr } %call4, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr5 = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 1, ptr %tag_ptr5, align 1
  %str = call ptr @mesh_string_new(ptr @.str.156, i64 12)
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %str, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %match_result, align 8
  br label %match_merge
}

define ptr @Work__status_payload_from_fields(i1 %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i1 %10, i1 %11, ptr %12, ptr %13) {
entry:
  %ok = alloca i1, align 1
  store i1 %0, ptr %ok, align 1
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %phase = alloca ptr, align 8
  store ptr %3, ptr %phase, align 8
  %result = alloca ptr, align 8
  store ptr %4, ptr %result, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %5, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %6, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %7, ptr %replica_node, align 8
  %replica_status = alloca ptr, align 8
  store ptr %8, ptr %replica_status, align 8
  %execution_node = alloca ptr, align 8
  store ptr %9, ptr %execution_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %10, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %11, ptr %fell_back_locally, align 1
  %error = alloca ptr, align 8
  store ptr %12, ptr %error, align 8
  %conflict_reason = alloca ptr, align 8
  store ptr %13, ptr %conflict_reason, align 8
  %struct_lit = alloca %WorkStatusPayload.6, align 8
  %ok1 = load i1, ptr %ok, align 1
  %field_ptr = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 0
  store i1 %ok1, ptr %field_ptr, align 1
  %request_key2 = load ptr, ptr %request_key, align 8
  %field_ptr3 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 1
  store ptr %request_key2, ptr %field_ptr3, align 8
  %attempt_id4 = load ptr, ptr %attempt_id, align 8
  %field_ptr5 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 2
  store ptr %attempt_id4, ptr %field_ptr5, align 8
  %phase6 = load ptr, ptr %phase, align 8
  %field_ptr7 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 3
  store ptr %phase6, ptr %field_ptr7, align 8
  %result8 = load ptr, ptr %result, align 8
  %field_ptr9 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 4
  store ptr %result8, ptr %field_ptr9, align 8
  %ingress_node10 = load ptr, ptr %ingress_node, align 8
  %field_ptr11 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 5
  store ptr %ingress_node10, ptr %field_ptr11, align 8
  %owner_node12 = load ptr, ptr %owner_node, align 8
  %field_ptr13 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 6
  store ptr %owner_node12, ptr %field_ptr13, align 8
  %replica_node14 = load ptr, ptr %replica_node, align 8
  %field_ptr15 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 7
  store ptr %replica_node14, ptr %field_ptr15, align 8
  %replica_status16 = load ptr, ptr %replica_status, align 8
  %field_ptr17 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 8
  store ptr %replica_status16, ptr %field_ptr17, align 8
  %execution_node18 = load ptr, ptr %execution_node, align 8
  %field_ptr19 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 9
  store ptr %execution_node18, ptr %field_ptr19, align 8
  %routed_remotely20 = load i1, ptr %routed_remotely, align 1
  %field_ptr21 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 10
  store i1 %routed_remotely20, ptr %field_ptr21, align 1
  %fell_back_locally22 = load i1, ptr %fell_back_locally, align 1
  %field_ptr23 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 11
  store i1 %fell_back_locally22, ptr %field_ptr23, align 1
  %error24 = load ptr, ptr %error, align 8
  %field_ptr25 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 12
  store ptr %error24, ptr %field_ptr25, align 8
  %conflict_reason26 = load ptr, ptr %conflict_reason, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 13
  store ptr %conflict_reason26, ptr %field_ptr27, align 8
  %struct_val = load %WorkStatusPayload.6, ptr %struct_lit, align 8
  %call = call ptr @ToJson__to_json__WorkStatusPayload(%WorkStatusPayload.6 %struct_val)
  call void @mesh_reduction_check()
  %call28 = call ptr @mesh_json_encode(ptr %call)
  ret ptr %call28
}

define %WorkStatusPayload.6 @Work__status_payload_from_record(%WorkRequestRecord.5 %0, i1 %1, ptr %2, ptr %3) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %ok = alloca i1, align 1
  store i1 %1, ptr %ok, align 1
  %error = alloca ptr, align 8
  store ptr %2, ptr %error, align 8
  %conflict_reason = alloca ptr, align 8
  store ptr %3, ptr %conflict_reason, align 8
  %struct_lit = alloca %WorkStatusPayload.6, align 8
  %ok1 = load i1, ptr %ok, align 1
  %field_ptr = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 0
  store i1 %ok1, ptr %field_ptr, align 1
  %record2 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record2, ptr %obj_tmp, align 8
  %field_ptr3 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr3, align 8
  %field_ptr4 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 1
  store ptr %field_val, ptr %field_ptr4, align 8
  %record5 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp6 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record5, ptr %obj_tmp6, align 8
  %field_ptr7 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp6, i32 0, i32 2
  %field_val8 = load ptr, ptr %field_ptr7, align 8
  %field_ptr9 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 2
  store ptr %field_val8, ptr %field_ptr9, align 8
  %record10 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp11 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record10, ptr %obj_tmp11, align 8
  %field_ptr12 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp11, i32 0, i32 3
  %field_val13 = load ptr, ptr %field_ptr12, align 8
  %field_ptr14 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 3
  store ptr %field_val13, ptr %field_ptr14, align 8
  %record15 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp16 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record15, ptr %obj_tmp16, align 8
  %field_ptr17 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp16, i32 0, i32 4
  %field_val18 = load ptr, ptr %field_ptr17, align 8
  %field_ptr19 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 4
  store ptr %field_val18, ptr %field_ptr19, align 8
  %record20 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp21 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record20, ptr %obj_tmp21, align 8
  %field_ptr22 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp21, i32 0, i32 5
  %field_val23 = load ptr, ptr %field_ptr22, align 8
  %field_ptr24 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 5
  store ptr %field_val23, ptr %field_ptr24, align 8
  %record25 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp26 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record25, ptr %obj_tmp26, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp26, i32 0, i32 6
  %field_val28 = load ptr, ptr %field_ptr27, align 8
  %field_ptr29 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 6
  store ptr %field_val28, ptr %field_ptr29, align 8
  %record30 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp31 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record30, ptr %obj_tmp31, align 8
  %field_ptr32 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp31, i32 0, i32 7
  %field_val33 = load ptr, ptr %field_ptr32, align 8
  %field_ptr34 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 7
  store ptr %field_val33, ptr %field_ptr34, align 8
  %record35 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp36 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record35, ptr %obj_tmp36, align 8
  %field_ptr37 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp36, i32 0, i32 8
  %field_val38 = load ptr, ptr %field_ptr37, align 8
  %field_ptr39 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 8
  store ptr %field_val38, ptr %field_ptr39, align 8
  %record40 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp41 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record40, ptr %obj_tmp41, align 8
  %field_ptr42 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp41, i32 0, i32 9
  %field_val43 = load ptr, ptr %field_ptr42, align 8
  %field_ptr44 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 9
  store ptr %field_val43, ptr %field_ptr44, align 8
  %record45 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp46 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record45, ptr %obj_tmp46, align 8
  %field_ptr47 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp46, i32 0, i32 10
  %field_val48 = load i1, ptr %field_ptr47, align 1
  %field_ptr49 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 10
  store i1 %field_val48, ptr %field_ptr49, align 1
  %record50 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp51 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record50, ptr %obj_tmp51, align 8
  %field_ptr52 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp51, i32 0, i32 11
  %field_val53 = load i1, ptr %field_ptr52, align 1
  %field_ptr54 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 11
  store i1 %field_val53, ptr %field_ptr54, align 1
  %error55 = load ptr, ptr %error, align 8
  %field_ptr56 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 12
  store ptr %error55, ptr %field_ptr56, align 8
  %conflict_reason57 = load ptr, ptr %conflict_reason, align 8
  %field_ptr58 = getelementptr inbounds nuw %WorkStatusPayload.6, ptr %struct_lit, i32 0, i32 13
  store ptr %conflict_reason57, ptr %field_ptr58, align 8
  %struct_val = load %WorkStatusPayload.6, ptr %struct_lit, align 8
  ret %WorkStatusPayload.6 %struct_val
}

define ptr @status_payload_json(%WorkRequestRecord.5 %0, i1 %1, ptr %2, ptr %3) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %ok = alloca i1, align 1
  store i1 %1, ptr %ok, align 1
  %error = alloca ptr, align 8
  store ptr %2, ptr %error, align 8
  %conflict_reason = alloca ptr, align 8
  store ptr %3, ptr %conflict_reason, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %ok2 = load i1, ptr %ok, align 1
  %error3 = load ptr, ptr %error, align 8
  %conflict_reason4 = load ptr, ptr %conflict_reason, align 8
  %call = call %WorkStatusPayload.6 @Work__status_payload_from_record(%WorkRequestRecord.5 %record1, i1 %ok2, ptr %error3, ptr %conflict_reason4)
  call void @mesh_reduction_check()
  %call5 = call ptr @ToJson__to_json__WorkStatusPayload(%WorkStatusPayload.6 %call)
  call void @mesh_reduction_check()
  %call6 = call ptr @mesh_json_encode(ptr %call5)
  ret ptr %call6
}

define ptr @Work__missing_status_payload_json(ptr %0, ptr %1) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %error = alloca ptr, align 8
  store ptr %1, ptr %error, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %str = call ptr @mesh_string_new(ptr @.str.159, i64 0)
  %call = call ptr @Work__missing_phase()
  call void @mesh_reduction_check()
  %call2 = call ptr @Work__unknown_result()
  call void @mesh_reduction_check()
  %str3 = call ptr @mesh_string_new(ptr @.str.160, i64 0)
  %str4 = call ptr @mesh_string_new(ptr @.str.161, i64 0)
  %str5 = call ptr @mesh_string_new(ptr @.str.162, i64 0)
  %call6 = call ptr @Work__unassigned_replica_status()
  call void @mesh_reduction_check()
  %str7 = call ptr @mesh_string_new(ptr @.str.163, i64 0)
  %error8 = load ptr, ptr %error, align 8
  %str9 = call ptr @mesh_string_new(ptr @.str.164, i64 0)
  %call10 = call ptr @Work__status_payload_from_fields(i1 false, ptr %request_key1, ptr %str, ptr %call, ptr %call2, ptr %str3, ptr %str4, ptr %str5, ptr %call6, ptr %str7, i1 false, i1 false, ptr %error8, ptr %str9)
  call void @mesh_reduction_check()
  ret ptr %call10
}

define ptr @Work__invalid_request_payload_json(ptr %0, ptr %1) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %error = alloca ptr, align 8
  store ptr %1, ptr %error, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %str = call ptr @mesh_string_new(ptr @.str.165, i64 0)
  %call = call ptr @Work__invalid_phase()
  call void @mesh_reduction_check()
  %call2 = call ptr @Work__rejected_result()
  call void @mesh_reduction_check()
  %str3 = call ptr @mesh_string_new(ptr @.str.166, i64 0)
  %str4 = call ptr @mesh_string_new(ptr @.str.167, i64 0)
  %str5 = call ptr @mesh_string_new(ptr @.str.168, i64 0)
  %call6 = call ptr @Work__unassigned_replica_status()
  call void @mesh_reduction_check()
  %str7 = call ptr @mesh_string_new(ptr @.str.169, i64 0)
  %error8 = load ptr, ptr %error, align 8
  %str9 = call ptr @mesh_string_new(ptr @.str.170, i64 0)
  %call10 = call ptr @Work__status_payload_from_fields(i1 false, ptr %request_key1, ptr %str, ptr %call, ptr %call2, ptr %str3, ptr %str4, ptr %str5, ptr %call6, ptr %str7, i1 false, i1 false, ptr %error8, ptr %str9)
  call void @mesh_reduction_check()
  ret ptr %call10
}

define ptr @Work__invalid_selection_payload_json(ptr %0, ptr %1, ptr %2, i1 %3, i1 %4, ptr %5) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %1, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %2, ptr %owner_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %3, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %4, ptr %fell_back_locally, align 1
  %error = alloca ptr, align 8
  store ptr %5, ptr %error, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %str = call ptr @mesh_string_new(ptr @.str.171, i64 0)
  %call = call ptr @Work__rejected_result()
  call void @mesh_reduction_check()
  %call2 = call ptr @Work__rejected_result()
  call void @mesh_reduction_check()
  %ingress_node3 = load ptr, ptr %ingress_node, align 8
  %owner_node4 = load ptr, ptr %owner_node, align 8
  %str5 = call ptr @mesh_string_new(ptr @.str.172, i64 0)
  %call6 = call ptr @Work__unassigned_replica_status()
  call void @mesh_reduction_check()
  %str7 = call ptr @mesh_string_new(ptr @.str.173, i64 0)
  %routed_remotely8 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally9 = load i1, ptr %fell_back_locally, align 1
  %error10 = load ptr, ptr %error, align 8
  %str11 = call ptr @mesh_string_new(ptr @.str.174, i64 0)
  %call12 = call ptr @Work__status_payload_from_fields(i1 false, ptr %request_key1, ptr %str, ptr %call, ptr %call2, ptr %ingress_node3, ptr %owner_node4, ptr %str5, ptr %call6, ptr %str7, i1 %routed_remotely8, i1 %fell_back_locally9, ptr %error10, ptr %str11)
  call void @mesh_reduction_check()
  ret ptr %call12
}

define %RequestRegistryState.8 @initial_request_registry_state() {
entry:
  %struct_lit = alloca %RequestRegistryState.8, align 8
  %field_ptr = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 0
  store i64 0, ptr %field_ptr, align 8
  %call = call ptr @mesh_map_new()
  %field_ptr1 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 1
  store ptr %call, ptr %field_ptr1, align 8
  %struct_val = load %RequestRegistryState.8, ptr %struct_lit, align 8
  ret %RequestRegistryState.8 %struct_val
}

define %WorkRequestRecord.5 @Work__make_request_record(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i1 %6, i1 %7) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %payload_hash_value = alloca ptr, align 8
  store ptr %1, ptr %payload_hash_value, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %3, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %4, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %5, ptr %replica_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %6, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %7, ptr %fell_back_locally, align 1
  %struct_lit = alloca %WorkRequestRecord.5, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 0
  store ptr %request_key1, ptr %field_ptr, align 8
  %payload_hash_value2 = load ptr, ptr %payload_hash_value, align 8
  %field_ptr3 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 1
  store ptr %payload_hash_value2, ptr %field_ptr3, align 8
  %attempt_id4 = load ptr, ptr %attempt_id, align 8
  %field_ptr5 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 2
  store ptr %attempt_id4, ptr %field_ptr5, align 8
  %call = call ptr @Work__pending_phase()
  call void @mesh_reduction_check()
  %field_ptr6 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 3
  store ptr %call, ptr %field_ptr6, align 8
  %call7 = call ptr @Work__pending_result()
  call void @mesh_reduction_check()
  %field_ptr8 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 4
  store ptr %call7, ptr %field_ptr8, align 8
  %ingress_node9 = load ptr, ptr %ingress_node, align 8
  %field_ptr10 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 5
  store ptr %ingress_node9, ptr %field_ptr10, align 8
  %owner_node11 = load ptr, ptr %owner_node, align 8
  %field_ptr12 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 6
  store ptr %owner_node11, ptr %field_ptr12, align 8
  %replica_node13 = load ptr, ptr %replica_node, align 8
  %field_ptr14 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 7
  store ptr %replica_node13, ptr %field_ptr14, align 8
  %replica_node15 = load ptr, ptr %replica_node, align 8
  %call16 = call ptr @Work__assigned_replica_status(ptr %replica_node15)
  call void @mesh_reduction_check()
  %field_ptr17 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 8
  store ptr %call16, ptr %field_ptr17, align 8
  %str = call ptr @mesh_string_new(ptr @.str.175, i64 0)
  %field_ptr18 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 9
  store ptr %str, ptr %field_ptr18, align 8
  %routed_remotely19 = load i1, ptr %routed_remotely, align 1
  %field_ptr20 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 10
  store i1 %routed_remotely19, ptr %field_ptr20, align 1
  %fell_back_locally21 = load i1, ptr %fell_back_locally, align 1
  %field_ptr22 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 11
  store i1 %fell_back_locally21, ptr %field_ptr22, align 1
  %str23 = call ptr @mesh_string_new(ptr @.str.176, i64 0)
  %field_ptr24 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_lit, i32 0, i32 12
  store ptr %str23, ptr %field_ptr24, align 8
  %struct_val = load %WorkRequestRecord.5, ptr %struct_lit, align 8
  ret %WorkRequestRecord.5 %struct_val
}

define %SubmitMutation.7 @Work__submit_decision(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i1 %6, i1 %7) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %payload_hash_value = alloca ptr, align 8
  store ptr %2, ptr %payload_hash_value, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %3, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %4, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %5, ptr %replica_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %6, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %7, ptr %fell_back_locally, align 1
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp, i32 0, i32 1
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_map_tag_string(ptr %field_val)
  %request_key2 = load ptr, ptr %request_key, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key2 to i64
  %call3 = call i8 @mesh_map_has_key(ptr %call, i64 %ptr_to_i64)
  %to_bool = trunc i8 %call3 to i1
  %if_result = alloca %SubmitMutation.7, align 8
  br i1 %to_bool, label %then, label %else

then:                                             ; preds = %entry
  %existing = alloca %WorkRequestRecord.5, align 8
  %state4 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp5 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp5, i32 0, i32 1
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_map_tag_string(ptr %field_val7)
  %request_key9 = load ptr, ptr %request_key, align 8
  %ptr_to_i6410 = ptrtoint ptr %request_key9 to i64
  %call11 = call i64 @mesh_map_get(ptr %call8, i64 %ptr_to_i6410)
  %i64_to_ptr = inttoptr i64 %call11 to ptr
  %deref_sum = load %WorkRequestRecord.5, ptr %i64_to_ptr, align 8
  store %WorkRequestRecord.5 %deref_sum, ptr %existing, align 8
  %existing12 = load %WorkRequestRecord.5, ptr %existing, align 8
  %obj_tmp13 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %existing12, ptr %obj_tmp13, align 8
  %field_ptr14 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp13, i32 0, i32 1
  %field_val15 = load ptr, ptr %field_ptr14, align 8
  %payload_hash_value16 = load ptr, ptr %payload_hash_value, align 8
  %str_eq = call i8 @mesh_string_eq(ptr %field_val15, ptr %payload_hash_value16)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result17 = alloca %SubmitMutation.7, align 8
  br i1 %str_eq_bool, label %then18, label %else19

else:                                             ; preds = %entry
  %attempt_id = alloca ptr, align 8
  %state34 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp35 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state34, ptr %obj_tmp35, align 8
  %field_ptr36 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp35, i32 0, i32 0
  %field_val37 = load i64, ptr %field_ptr36, align 8
  %call38 = call ptr @attempt_id_from_token(i64 %field_val37)
  call void @mesh_reduction_check()
  store ptr %call38, ptr %attempt_id, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  %request_key39 = load ptr, ptr %request_key, align 8
  %payload_hash_value40 = load ptr, ptr %payload_hash_value, align 8
  %attempt_id41 = load ptr, ptr %attempt_id, align 8
  %ingress_node42 = load ptr, ptr %ingress_node, align 8
  %owner_node43 = load ptr, ptr %owner_node, align 8
  %replica_node44 = load ptr, ptr %replica_node, align 8
  %routed_remotely45 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally46 = load i1, ptr %fell_back_locally, align 1
  %call47 = call %WorkRequestRecord.5 @Work__make_request_record(ptr %request_key39, ptr %payload_hash_value40, ptr %attempt_id41, ptr %ingress_node42, ptr %owner_node43, ptr %replica_node44, i1 %routed_remotely45, i1 %fell_back_locally46)
  call void @mesh_reduction_check()
  store %WorkRequestRecord.5 %call47, ptr %record, align 8
  %struct_lit48 = alloca %SubmitMutation.7, align 8
  %str49 = call ptr @mesh_string_new(ptr @.str.181, i64 7)
  %field_ptr50 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit48, i32 0, i32 0
  store ptr %str49, ptr %field_ptr50, align 8
  %record51 = load %WorkRequestRecord.5, ptr %record, align 8
  %field_ptr52 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit48, i32 0, i32 1
  store %WorkRequestRecord.5 %record51, ptr %field_ptr52, align 8
  %str53 = call ptr @mesh_string_new(ptr @.str.182, i64 0)
  %field_ptr54 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit48, i32 0, i32 2
  store ptr %str53, ptr %field_ptr54, align 8
  %struct_val55 = load %SubmitMutation.7, ptr %struct_lit48, align 8
  store %SubmitMutation.7 %struct_val55, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %if_merge20
  %if_val56 = load %SubmitMutation.7, ptr %if_result, align 8
  ret %SubmitMutation.7 %if_val56

then18:                                           ; preds = %then
  %struct_lit = alloca %SubmitMutation.7, align 8
  %str = call ptr @mesh_string_new(ptr @.str.177, i64 9)
  %field_ptr21 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit, i32 0, i32 0
  store ptr %str, ptr %field_ptr21, align 8
  %existing22 = load %WorkRequestRecord.5, ptr %existing, align 8
  %field_ptr23 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit, i32 0, i32 1
  store %WorkRequestRecord.5 %existing22, ptr %field_ptr23, align 8
  %str24 = call ptr @mesh_string_new(ptr @.str.178, i64 0)
  %field_ptr25 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit, i32 0, i32 2
  store ptr %str24, ptr %field_ptr25, align 8
  %struct_val = load %SubmitMutation.7, ptr %struct_lit, align 8
  store %SubmitMutation.7 %struct_val, ptr %if_result17, align 8
  br label %if_merge20

else19:                                           ; preds = %then
  %struct_lit26 = alloca %SubmitMutation.7, align 8
  %str27 = call ptr @mesh_string_new(ptr @.str.179, i64 8)
  %field_ptr28 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit26, i32 0, i32 0
  store ptr %str27, ptr %field_ptr28, align 8
  %existing29 = load %WorkRequestRecord.5, ptr %existing, align 8
  %field_ptr30 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit26, i32 0, i32 1
  store %WorkRequestRecord.5 %existing29, ptr %field_ptr30, align 8
  %str31 = call ptr @mesh_string_new(ptr @.str.180, i64 20)
  %field_ptr32 = getelementptr inbounds nuw %SubmitMutation.7, ptr %struct_lit26, i32 0, i32 2
  store ptr %str31, ptr %field_ptr32, align 8
  %struct_val33 = load %SubmitMutation.7, ptr %struct_lit26, align 8
  store %SubmitMutation.7 %struct_val33, ptr %if_result17, align 8
  br label %if_merge20

if_merge20:                                       ; preds = %else19, %then18
  %if_val = load %SubmitMutation.7, ptr %if_result17, align 8
  store %SubmitMutation.7 %if_val, ptr %if_result, align 8
  br label %if_merge
}

define %RequestRegistryState.8 @Work__submit_next_state(%RequestRegistryState.8 %0, ptr %1, %SubmitMutation.7 %2) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %decision = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %2, ptr %decision, align 8
  %decision1 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %str = call ptr @mesh_string_new(ptr @.str.183, i64 7)
  %str_eq = call i8 @mesh_string_eq(ptr %field_val, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca %RequestRegistryState.8, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %struct_lit = alloca %RequestRegistryState.8, align 8
  %state2 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp3 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state2, ptr %obj_tmp3, align 8
  %field_ptr4 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp3, i32 0, i32 0
  %field_val5 = load i64, ptr %field_ptr4, align 8
  %add = add i64 %field_val5, 1
  %field_ptr6 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 0
  store i64 %add, ptr %field_ptr6, align 8
  %state7 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp8 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state7, ptr %obj_tmp8, align 8
  %field_ptr9 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp8, i32 0, i32 1
  %field_val10 = load ptr, ptr %field_ptr9, align 8
  %call = call ptr @mesh_map_tag_string(ptr %field_val10)
  %request_key11 = load ptr, ptr %request_key, align 8
  %decision12 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp13 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision12, ptr %obj_tmp13, align 8
  %field_ptr14 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp13, i32 0, i32 1
  %field_val15 = load %WorkRequestRecord.5, ptr %field_ptr14, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key11 to i64
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkRequestRecord.5, ptr null, i32 1) to i64), i64 8)
  store %WorkRequestRecord.5 %field_val15, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  %call16 = call ptr @mesh_map_put(ptr %call, i64 %ptr_to_i64, i64 %struct_ptr_to_i64)
  %field_ptr17 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 1
  store ptr %call16, ptr %field_ptr17, align 8
  %struct_val = load %RequestRegistryState.8, ptr %struct_lit, align 8
  store %RequestRegistryState.8 %struct_val, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %state18 = load %RequestRegistryState.8, ptr %state, align 8
  store %RequestRegistryState.8 %state18, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load %RequestRegistryState.8, ptr %if_result, align 8
  ret %RequestRegistryState.8 %if_val
}

define { i8, ptr } @lookup_request(%RequestRegistryState.8 %0, ptr %1) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp, i32 0, i32 1
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_map_tag_string(ptr %field_val)
  %request_key2 = load ptr, ptr %request_key, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key2 to i64
  %call3 = call i8 @mesh_map_has_key(ptr %call, i64 %ptr_to_i64)
  %to_bool = trunc i8 %call3 to i1
  %if_result = alloca { i8, ptr }, align 8
  br i1 %to_bool, label %then, label %else

then:                                             ; preds = %entry
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 0, ptr %tag_ptr, align 1
  %state4 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp5 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp5, i32 0, i32 1
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_map_tag_string(ptr %field_val7)
  %request_key9 = load ptr, ptr %request_key, align 8
  %ptr_to_i6410 = ptrtoint ptr %request_key9 to i64
  %call11 = call i64 @mesh_map_get(ptr %call8, i64 %ptr_to_i6410)
  %i64_to_ptr = inttoptr i64 %call11 to ptr
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %i64_to_ptr, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %variant12 = alloca { i8, ptr }, align 8
  %tag_ptr13 = getelementptr inbounds nuw { i8, ptr }, ptr %variant12, i32 0, i32 0
  store i8 1, ptr %tag_ptr13, align 1
  %str = call ptr @mesh_string_new(ptr @.str.184, i64 21)
  %vfield_ptr14 = getelementptr inbounds nuw { i8, ptr }, ptr %variant12, i32 0, i32 1
  store ptr %str, ptr %vfield_ptr14, align 8
  %variant_val15 = load { i8, ptr }, ptr %variant12, align 8
  store { i8, ptr } %variant_val15, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load { i8, ptr }, ptr %if_result, align 8
  ret { i8, ptr } %if_val
}

define { i8, ptr } @Work__transition_completed_record(%WorkRequestRecord.5 %0, ptr %1, ptr %2) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %1, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %2, ptr %execution_node, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 2
  %field_val = load ptr, ptr %field_ptr, align 8
  %attempt_id2 = load ptr, ptr %attempt_id, align 8
  %str_eq = call i8 @mesh_string_eq(ptr %field_val, ptr %attempt_id2)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %str_neq = xor i1 %str_eq_bool, true
  %if_result = alloca { i8, ptr }, align 8
  br i1 %str_neq, label %then, label %else

then:                                             ; preds = %entry
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 1, ptr %tag_ptr, align 1
  %str = call ptr @mesh_string_new(ptr @.str.185, i64 19)
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %str, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %execution_node3 = load ptr, ptr %execution_node, align 8
  %call = call i64 @mesh_string_length(ptr %execution_node3)
  %eq = icmp eq i64 %call, 0
  %if_result4 = alloca { i8, ptr }, align 8
  br i1 %eq, label %then5, label %else6

if_merge:                                         ; preds = %if_merge7, %then
  %if_val103 = load { i8, ptr }, ptr %if_result, align 8
  ret { i8, ptr } %if_val103

then5:                                            ; preds = %else
  %variant8 = alloca { i8, ptr }, align 8
  %tag_ptr9 = getelementptr inbounds nuw { i8, ptr }, ptr %variant8, i32 0, i32 0
  store i8 1, ptr %tag_ptr9, align 1
  %str10 = call ptr @mesh_string_new(ptr @.str.186, i64 22)
  %vfield_ptr11 = getelementptr inbounds nuw { i8, ptr }, ptr %variant8, i32 0, i32 1
  store ptr %str10, ptr %vfield_ptr11, align 8
  %variant_val12 = load { i8, ptr }, ptr %variant8, align 8
  store { i8, ptr } %variant_val12, ptr %if_result4, align 8
  br label %if_merge7

else6:                                            ; preds = %else
  %record13 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp14 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record13, ptr %obj_tmp14, align 8
  %field_ptr15 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp14, i32 0, i32 3
  %field_val16 = load ptr, ptr %field_ptr15, align 8
  %call17 = call ptr @Work__completed_phase()
  call void @mesh_reduction_check()
  %str_eq18 = call i8 @mesh_string_eq(ptr %field_val16, ptr %call17)
  %str_eq_bool19 = icmp ne i8 %str_eq18, 0
  %if_result20 = alloca { i8, ptr }, align 8
  br i1 %str_eq_bool19, label %then21, label %else22

if_merge7:                                        ; preds = %if_merge23, %then5
  %if_val102 = load { i8, ptr }, ptr %if_result4, align 8
  store { i8, ptr } %if_val102, ptr %if_result, align 8
  br label %if_merge

then21:                                           ; preds = %else6
  %record24 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp25 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record24, ptr %obj_tmp25, align 8
  %field_ptr26 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp25, i32 0, i32 9
  %field_val27 = load ptr, ptr %field_ptr26, align 8
  %execution_node28 = load ptr, ptr %execution_node, align 8
  %str_eq29 = call i8 @mesh_string_eq(ptr %field_val27, ptr %execution_node28)
  %str_eq_bool30 = icmp ne i8 %str_eq29, 0
  %if_result31 = alloca { i8, ptr }, align 8
  br i1 %str_eq_bool30, label %then32, label %else33

else22:                                           ; preds = %else6
  %record45 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp46 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record45, ptr %obj_tmp46, align 8
  %field_ptr47 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp46, i32 0, i32 3
  %field_val48 = load ptr, ptr %field_ptr47, align 8
  %call49 = call ptr @Work__pending_phase()
  call void @mesh_reduction_check()
  %str_eq50 = call i8 @mesh_string_eq(ptr %field_val48, ptr %call49)
  %str_eq_bool51 = icmp ne i8 %str_eq50, 0
  %str_neq52 = xor i1 %str_eq_bool51, true
  %if_result53 = alloca { i8, ptr }, align 8
  br i1 %str_neq52, label %then54, label %else55

if_merge23:                                       ; preds = %if_merge56, %if_merge34
  %if_val101 = load { i8, ptr }, ptr %if_result20, align 8
  store { i8, ptr } %if_val101, ptr %if_result4, align 8
  br label %if_merge7

then32:                                           ; preds = %then21
  %variant35 = alloca { i8, ptr }, align 8
  %tag_ptr36 = getelementptr inbounds nuw { i8, ptr }, ptr %variant35, i32 0, i32 0
  store i8 0, ptr %tag_ptr36, align 1
  %record37 = load %WorkRequestRecord.5, ptr %record, align 8
  %variant_box = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkRequestRecord.5, ptr null, i32 1) to i64), i64 8)
  store %WorkRequestRecord.5 %record37, ptr %variant_box, align 8
  %vfield_ptr38 = getelementptr inbounds nuw { i8, ptr }, ptr %variant35, i32 0, i32 1
  store ptr %variant_box, ptr %vfield_ptr38, align 8
  %variant_val39 = load { i8, ptr }, ptr %variant35, align 8
  store { i8, ptr } %variant_val39, ptr %if_result31, align 8
  br label %if_merge34

else33:                                           ; preds = %then21
  %variant40 = alloca { i8, ptr }, align 8
  %tag_ptr41 = getelementptr inbounds nuw { i8, ptr }, ptr %variant40, i32 0, i32 0
  store i8 1, ptr %tag_ptr41, align 1
  %str42 = call ptr @mesh_string_new(ptr @.str.187, i64 37)
  %vfield_ptr43 = getelementptr inbounds nuw { i8, ptr }, ptr %variant40, i32 0, i32 1
  store ptr %str42, ptr %vfield_ptr43, align 8
  %variant_val44 = load { i8, ptr }, ptr %variant40, align 8
  store { i8, ptr } %variant_val44, ptr %if_result31, align 8
  br label %if_merge34

if_merge34:                                       ; preds = %else33, %then32
  %if_val = load { i8, ptr }, ptr %if_result31, align 8
  store { i8, ptr } %if_val, ptr %if_result20, align 8
  br label %if_merge23

then54:                                           ; preds = %else22
  %variant57 = alloca { i8, ptr }, align 8
  %tag_ptr58 = getelementptr inbounds nuw { i8, ptr }, ptr %variant57, i32 0, i32 0
  store i8 1, ptr %tag_ptr58, align 1
  %str59 = call ptr @mesh_string_new(ptr @.str.188, i64 25)
  %vfield_ptr60 = getelementptr inbounds nuw { i8, ptr }, ptr %variant57, i32 0, i32 1
  store ptr %str59, ptr %vfield_ptr60, align 8
  %variant_val61 = load { i8, ptr }, ptr %variant57, align 8
  store { i8, ptr } %variant_val61, ptr %if_result53, align 8
  br label %if_merge56

else55:                                           ; preds = %else22
  %variant62 = alloca { i8, ptr }, align 8
  %tag_ptr63 = getelementptr inbounds nuw { i8, ptr }, ptr %variant62, i32 0, i32 0
  store i8 0, ptr %tag_ptr63, align 1
  %record64 = load %WorkRequestRecord.5, ptr %record, align 8
  %update_base = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record64, ptr %update_base, align 8
  %struct_update = alloca %WorkRequestRecord.5, align 8
  %base_field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 0
  %base_field_val = load ptr, ptr %base_field_ptr, align 8
  %new_field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 0
  store ptr %base_field_val, ptr %new_field_ptr, align 8
  %base_field_ptr65 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 1
  %base_field_val66 = load ptr, ptr %base_field_ptr65, align 8
  %new_field_ptr67 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 1
  store ptr %base_field_val66, ptr %new_field_ptr67, align 8
  %base_field_ptr68 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 2
  %base_field_val69 = load ptr, ptr %base_field_ptr68, align 8
  %new_field_ptr70 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 2
  store ptr %base_field_val69, ptr %new_field_ptr70, align 8
  %call71 = call ptr @Work__completed_phase()
  call void @mesh_reduction_check()
  %new_field_ptr72 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 3
  store ptr %call71, ptr %new_field_ptr72, align 8
  %call73 = call ptr @Work__succeeded_result()
  call void @mesh_reduction_check()
  %new_field_ptr74 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 4
  store ptr %call73, ptr %new_field_ptr74, align 8
  %base_field_ptr75 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 5
  %base_field_val76 = load ptr, ptr %base_field_ptr75, align 8
  %new_field_ptr77 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 5
  store ptr %base_field_val76, ptr %new_field_ptr77, align 8
  %base_field_ptr78 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 6
  %base_field_val79 = load ptr, ptr %base_field_ptr78, align 8
  %new_field_ptr80 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 6
  store ptr %base_field_val79, ptr %new_field_ptr80, align 8
  %base_field_ptr81 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 7
  %base_field_val82 = load ptr, ptr %base_field_ptr81, align 8
  %new_field_ptr83 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 7
  store ptr %base_field_val82, ptr %new_field_ptr83, align 8
  %base_field_ptr84 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 8
  %base_field_val85 = load ptr, ptr %base_field_ptr84, align 8
  %new_field_ptr86 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 8
  store ptr %base_field_val85, ptr %new_field_ptr86, align 8
  %execution_node87 = load ptr, ptr %execution_node, align 8
  %new_field_ptr88 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 9
  store ptr %execution_node87, ptr %new_field_ptr88, align 8
  %base_field_ptr89 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 10
  %base_field_val90 = load i1, ptr %base_field_ptr89, align 1
  %new_field_ptr91 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 10
  store i1 %base_field_val90, ptr %new_field_ptr91, align 1
  %base_field_ptr92 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %update_base, i32 0, i32 11
  %base_field_val93 = load i1, ptr %base_field_ptr92, align 1
  %new_field_ptr94 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 11
  store i1 %base_field_val93, ptr %new_field_ptr94, align 1
  %str95 = call ptr @mesh_string_new(ptr @.str.189, i64 0)
  %new_field_ptr96 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %struct_update, i32 0, i32 12
  store ptr %str95, ptr %new_field_ptr96, align 8
  %struct_update_val = load %WorkRequestRecord.5, ptr %struct_update, align 8
  %variant_box97 = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkRequestRecord.5, ptr null, i32 1) to i64), i64 8)
  store %WorkRequestRecord.5 %struct_update_val, ptr %variant_box97, align 8
  %vfield_ptr98 = getelementptr inbounds nuw { i8, ptr }, ptr %variant62, i32 0, i32 1
  store ptr %variant_box97, ptr %vfield_ptr98, align 8
  %variant_val99 = load { i8, ptr }, ptr %variant62, align 8
  store { i8, ptr } %variant_val99, ptr %if_result53, align 8
  br label %if_merge56

if_merge56:                                       ; preds = %else55, %then54
  %if_val100 = load { i8, ptr }, ptr %if_result53, align 8
  store { i8, ptr } %if_val100, ptr %if_result20, align 8
  br label %if_merge23
}

define { i8, ptr } @Work__apply_completion_from_record(%RequestRegistryState.8 %0, ptr %1, %WorkRequestRecord.5 %2, ptr %3, ptr %4) {
entry:
  %reason = alloca ptr, align 8
  %next_record = alloca %WorkRequestRecord.5, align 8
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %2, ptr %record, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %3, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %4, ptr %execution_node, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %attempt_id2 = load ptr, ptr %attempt_id, align 8
  %execution_node3 = load ptr, ptr %execution_node, align 8
  %call = call { i8, ptr } @Work__transition_completed_record(%WorkRequestRecord.5 %record1, ptr %attempt_id2, ptr %execution_node3)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load { i8, ptr }, ptr %match_result, align 8
  ret { i8, ptr } %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.190, i64 30, ptr @.panic_file.191, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkRequestRecord.5, ptr %path_val, align 8
  store %WorkRequestRecord.5 %deref_struct, ptr %next_record, align 8
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr4 = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 0, ptr %tag_ptr4, align 1
  %struct_lit = alloca %RequestRegistryState.8, align 8
  %state5 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state5, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp, i32 0, i32 0
  %field_val = load i64, ptr %field_ptr, align 8
  %field_ptr6 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 0
  store i64 %field_val, ptr %field_ptr6, align 8
  %state7 = load %RequestRegistryState.8, ptr %state, align 8
  %obj_tmp8 = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %state7, ptr %obj_tmp8, align 8
  %field_ptr9 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %obj_tmp8, i32 0, i32 1
  %field_val10 = load ptr, ptr %field_ptr9, align 8
  %call11 = call ptr @mesh_map_tag_string(ptr %field_val10)
  %request_key12 = load ptr, ptr %request_key, align 8
  %next_record13 = load %WorkRequestRecord.5, ptr %next_record, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key12 to i64
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%WorkRequestRecord.5, ptr null, i32 1) to i64), i64 8)
  store %WorkRequestRecord.5 %next_record13, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  %call14 = call ptr @mesh_map_put(ptr %call11, i64 %ptr_to_i64, i64 %struct_ptr_to_i64)
  %field_ptr15 = getelementptr inbounds nuw %RequestRegistryState.8, ptr %struct_lit, i32 0, i32 1
  store ptr %call14, ptr %field_ptr15, align 8
  %struct_val = load %RequestRegistryState.8, ptr %struct_lit, align 8
  %variant_box = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %struct_val, ptr %variant_box, align 8
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %variant_box, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant_field16 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val17 = load ptr, ptr %variant_field16, align 8
  store ptr %path_val17, ptr %reason, align 8
  %variant18 = alloca { i8, ptr }, align 8
  %tag_ptr19 = getelementptr inbounds nuw { i8, ptr }, ptr %variant18, i32 0, i32 0
  store i8 1, ptr %tag_ptr19, align 1
  %reason20 = load ptr, ptr %reason, align 8
  %vfield_ptr21 = getelementptr inbounds nuw { i8, ptr }, ptr %variant18, i32 0, i32 1
  store ptr %reason20, ptr %vfield_ptr21, align 8
  %variant_val22 = load { i8, ptr }, ptr %variant18, align 8
  store { i8, ptr } %variant_val22, ptr %match_result, align 8
  br label %match_merge
}

define { i8, ptr } @apply_completion(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3) {
entry:
  %reason = alloca ptr, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %3, ptr %execution_node, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %call = call { i8, ptr } @lookup_request(%RequestRegistryState.8 %state1, ptr %request_key2)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca { i8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load { i8, ptr }, ptr %match_result, align 8
  ret { i8, ptr } %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.192, i64 30, ptr @.panic_file.193, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkRequestRecord.5, ptr %path_val, align 8
  store %WorkRequestRecord.5 %deref_struct, ptr %record, align 8
  %state3 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key4 = load ptr, ptr %request_key, align 8
  %record5 = load %WorkRequestRecord.5, ptr %record, align 8
  %attempt_id6 = load ptr, ptr %attempt_id, align 8
  %execution_node7 = load ptr, ptr %execution_node, align 8
  %call8 = call { i8, ptr } @Work__apply_completion_from_record(%RequestRegistryState.8 %state3, ptr %request_key4, %WorkRequestRecord.5 %record5, ptr %attempt_id6, ptr %execution_node7)
  call void @mesh_reduction_check()
  store { i8, ptr } %call8, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant_field9 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val10 = load ptr, ptr %variant_field9, align 8
  store ptr %path_val10, ptr %reason, align 8
  %variant = alloca { i8, ptr }, align 8
  %tag_ptr11 = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 0
  store i8 1, ptr %tag_ptr11, align 1
  %reason12 = load ptr, ptr %reason, align 8
  %vfield_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %variant, i32 0, i32 1
  store ptr %reason12, ptr %vfield_ptr, align 8
  %variant_val = load { i8, ptr }, ptr %variant, align 8
  store { i8, ptr } %variant_val, ptr %match_result, align 8
  br label %match_merge
}

define {} @Work__log_submit(%WorkRequestRecord.5 %0) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.194, i64 40)
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %field_val)
  %str2 = call ptr @mesh_string_new(ptr @.str.195, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp5 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp5, i32 0, i32 2
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_string_concat(ptr %call3, ptr %field_val7)
  %str9 = call ptr @mesh_string_new(ptr @.str.196, i64 9)
  %call10 = call ptr @mesh_string_concat(ptr %call8, ptr %str9)
  %record11 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp12 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record11, ptr %obj_tmp12, align 8
  %field_ptr13 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp12, i32 0, i32 5
  %field_val14 = load ptr, ptr %field_ptr13, align 8
  %call15 = call ptr @mesh_string_concat(ptr %call10, ptr %field_val14)
  %str16 = call ptr @mesh_string_new(ptr @.str.197, i64 7)
  %call17 = call ptr @mesh_string_concat(ptr %call15, ptr %str16)
  %record18 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp19 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record18, ptr %obj_tmp19, align 8
  %field_ptr20 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp19, i32 0, i32 6
  %field_val21 = load ptr, ptr %field_ptr20, align 8
  %call22 = call ptr @mesh_string_concat(ptr %call17, ptr %field_val21)
  %str23 = call ptr @mesh_string_new(ptr @.str.198, i64 9)
  %call24 = call ptr @mesh_string_concat(ptr %call22, ptr %str23)
  %record25 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp26 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record25, ptr %obj_tmp26, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp26, i32 0, i32 7
  %field_val28 = load ptr, ptr %field_ptr27, align 8
  %call29 = call ptr @mesh_string_concat(ptr %call24, ptr %field_val28)
  %str30 = call ptr @mesh_string_new(ptr @.str.199, i64 16)
  %call31 = call ptr @mesh_string_concat(ptr %call29, ptr %str30)
  %record32 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp33 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record32, ptr %obj_tmp33, align 8
  %field_ptr34 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp33, i32 0, i32 8
  %field_val35 = load ptr, ptr %field_ptr34, align 8
  %call36 = call ptr @mesh_string_concat(ptr %call31, ptr %field_val35)
  %str37 = call ptr @mesh_string_new(ptr @.str.200, i64 17)
  %call38 = call ptr @mesh_string_concat(ptr %call36, ptr %str37)
  %record39 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp40 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record39, ptr %obj_tmp40, align 8
  %field_ptr41 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp40, i32 0, i32 10
  %field_val42 = load i1, ptr %field_ptr41, align 1
  %zext_arg = zext i1 %field_val42 to i8
  %call43 = call ptr @mesh_bool_to_string(i8 %zext_arg)
  %call44 = call ptr @mesh_string_concat(ptr %call38, ptr %call43)
  %str45 = call ptr @mesh_string_new(ptr @.str.201, i64 7)
  %call46 = call ptr @mesh_string_concat(ptr %call44, ptr %str45)
  %record47 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp48 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record47, ptr %obj_tmp48, align 8
  %field_ptr49 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp48, i32 0, i32 3
  %field_val50 = load ptr, ptr %field_ptr49, align 8
  %call51 = call ptr @mesh_string_concat(ptr %call46, ptr %field_val50)
  call void @mesh_println(ptr %call51)
  ret {} zeroinitializer
}

define {} @Work__log_dedupe(%WorkRequestRecord.5 %0) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.202, i64 40)
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %field_val)
  %str2 = call ptr @mesh_string_new(ptr @.str.203, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp5 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp5, i32 0, i32 2
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_string_concat(ptr %call3, ptr %field_val7)
  %str9 = call ptr @mesh_string_new(ptr @.str.204, i64 7)
  %call10 = call ptr @mesh_string_concat(ptr %call8, ptr %str9)
  %record11 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp12 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record11, ptr %obj_tmp12, align 8
  %field_ptr13 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp12, i32 0, i32 3
  %field_val14 = load ptr, ptr %field_ptr13, align 8
  %call15 = call ptr @mesh_string_concat(ptr %call10, ptr %field_val14)
  %str16 = call ptr @mesh_string_new(ptr @.str.205, i64 8)
  %call17 = call ptr @mesh_string_concat(ptr %call15, ptr %str16)
  %record18 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp19 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record18, ptr %obj_tmp19, align 8
  %field_ptr20 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp19, i32 0, i32 4
  %field_val21 = load ptr, ptr %field_ptr20, align 8
  %call22 = call ptr @mesh_string_concat(ptr %call17, ptr %field_val21)
  %str23 = call ptr @mesh_string_new(ptr @.str.206, i64 7)
  %call24 = call ptr @mesh_string_concat(ptr %call22, ptr %str23)
  %record25 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp26 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record25, ptr %obj_tmp26, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp26, i32 0, i32 6
  %field_val28 = load ptr, ptr %field_ptr27, align 8
  %call29 = call ptr @mesh_string_concat(ptr %call24, ptr %field_val28)
  %str30 = call ptr @mesh_string_new(ptr @.str.207, i64 9)
  %call31 = call ptr @mesh_string_concat(ptr %call29, ptr %str30)
  %record32 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp33 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record32, ptr %obj_tmp33, align 8
  %field_ptr34 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp33, i32 0, i32 7
  %field_val35 = load ptr, ptr %field_ptr34, align 8
  %call36 = call ptr @mesh_string_concat(ptr %call31, ptr %field_val35)
  call void @mesh_println(ptr %call36)
  ret {} zeroinitializer
}

define {} @Work__log_conflict(%WorkRequestRecord.5 %0, ptr %1, ptr %2) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %reason = alloca ptr, align 8
  store ptr %2, ptr %reason, align 8
  %str = call ptr @mesh_string_new(ptr @.str.208, i64 42)
  %request_key1 = load ptr, ptr %request_key, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %request_key1)
  %str2 = call ptr @mesh_string_new(ptr @.str.209, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record4, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 2
  %field_val = load ptr, ptr %field_ptr, align 8
  %call5 = call ptr @mesh_string_concat(ptr %call3, ptr %field_val)
  %str6 = call ptr @mesh_string_new(ptr @.str.210, i64 14)
  %call7 = call ptr @mesh_string_concat(ptr %call5, ptr %str6)
  %record8 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp9 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record8, ptr %obj_tmp9, align 8
  %field_ptr10 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp9, i32 0, i32 3
  %field_val11 = load ptr, ptr %field_ptr10, align 8
  %call12 = call ptr @mesh_string_concat(ptr %call7, ptr %field_val11)
  %str13 = call ptr @mesh_string_new(ptr @.str.211, i64 15)
  %call14 = call ptr @mesh_string_concat(ptr %call12, ptr %str13)
  %record15 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp16 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record15, ptr %obj_tmp16, align 8
  %field_ptr17 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp16, i32 0, i32 4
  %field_val18 = load ptr, ptr %field_ptr17, align 8
  %call19 = call ptr @mesh_string_concat(ptr %call14, ptr %field_val18)
  %str20 = call ptr @mesh_string_new(ptr @.str.212, i64 8)
  %call21 = call ptr @mesh_string_concat(ptr %call19, ptr %str20)
  %reason22 = load ptr, ptr %reason, align 8
  %call23 = call ptr @mesh_string_concat(ptr %call21, ptr %reason22)
  call void @mesh_println(ptr %call23)
  ret {} zeroinitializer
}

define {} @Work__log_status(%WorkRequestRecord.5 %0) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.213, i64 40)
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %field_val)
  %str2 = call ptr @mesh_string_new(ptr @.str.214, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp5 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp5, i32 0, i32 2
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_string_concat(ptr %call3, ptr %field_val7)
  %str9 = call ptr @mesh_string_new(ptr @.str.215, i64 7)
  %call10 = call ptr @mesh_string_concat(ptr %call8, ptr %str9)
  %record11 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp12 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record11, ptr %obj_tmp12, align 8
  %field_ptr13 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp12, i32 0, i32 3
  %field_val14 = load ptr, ptr %field_ptr13, align 8
  %call15 = call ptr @mesh_string_concat(ptr %call10, ptr %field_val14)
  %str16 = call ptr @mesh_string_new(ptr @.str.216, i64 8)
  %call17 = call ptr @mesh_string_concat(ptr %call15, ptr %str16)
  %record18 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp19 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record18, ptr %obj_tmp19, align 8
  %field_ptr20 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp19, i32 0, i32 4
  %field_val21 = load ptr, ptr %field_ptr20, align 8
  %call22 = call ptr @mesh_string_concat(ptr %call17, ptr %field_val21)
  %str23 = call ptr @mesh_string_new(ptr @.str.217, i64 9)
  %call24 = call ptr @mesh_string_concat(ptr %call22, ptr %str23)
  %record25 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp26 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record25, ptr %obj_tmp26, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp26, i32 0, i32 5
  %field_val28 = load ptr, ptr %field_ptr27, align 8
  %call29 = call ptr @mesh_string_concat(ptr %call24, ptr %field_val28)
  %str30 = call ptr @mesh_string_new(ptr @.str.218, i64 7)
  %call31 = call ptr @mesh_string_concat(ptr %call29, ptr %str30)
  %record32 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp33 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record32, ptr %obj_tmp33, align 8
  %field_ptr34 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp33, i32 0, i32 6
  %field_val35 = load ptr, ptr %field_ptr34, align 8
  %call36 = call ptr @mesh_string_concat(ptr %call31, ptr %field_val35)
  %str37 = call ptr @mesh_string_new(ptr @.str.219, i64 9)
  %call38 = call ptr @mesh_string_concat(ptr %call36, ptr %str37)
  %record39 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp40 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record39, ptr %obj_tmp40, align 8
  %field_ptr41 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp40, i32 0, i32 7
  %field_val42 = load ptr, ptr %field_ptr41, align 8
  %call43 = call ptr @mesh_string_concat(ptr %call38, ptr %field_val42)
  call void @mesh_println(ptr %call43)
  ret {} zeroinitializer
}

define {} @Work__log_status_missing(ptr %0) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %str = call ptr @mesh_string_new(ptr @.str.220, i64 48)
  %request_key1 = load ptr, ptr %request_key, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %request_key1)
  %str2 = call ptr @mesh_string_new(ptr @.str.221, i64 29)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  call void @mesh_println(ptr %call3)
  ret {} zeroinitializer
}

define {} @Work__log_status_transition(%WorkRequestRecord.5 %0) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.222, i64 51)
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record1, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %field_val)
  %str2 = call ptr @mesh_string_new(ptr @.str.223, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp5 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record4, ptr %obj_tmp5, align 8
  %field_ptr6 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp5, i32 0, i32 2
  %field_val7 = load ptr, ptr %field_ptr6, align 8
  %call8 = call ptr @mesh_string_concat(ptr %call3, ptr %field_val7)
  %str9 = call ptr @mesh_string_new(ptr @.str.224, i64 7)
  %call10 = call ptr @mesh_string_concat(ptr %call8, ptr %str9)
  %record11 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp12 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record11, ptr %obj_tmp12, align 8
  %field_ptr13 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp12, i32 0, i32 3
  %field_val14 = load ptr, ptr %field_ptr13, align 8
  %call15 = call ptr @mesh_string_concat(ptr %call10, ptr %field_val14)
  %str16 = call ptr @mesh_string_new(ptr @.str.225, i64 8)
  %call17 = call ptr @mesh_string_concat(ptr %call15, ptr %str16)
  %record18 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp19 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record18, ptr %obj_tmp19, align 8
  %field_ptr20 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp19, i32 0, i32 4
  %field_val21 = load ptr, ptr %field_ptr20, align 8
  %call22 = call ptr @mesh_string_concat(ptr %call17, ptr %field_val21)
  %str23 = call ptr @mesh_string_new(ptr @.str.226, i64 11)
  %call24 = call ptr @mesh_string_concat(ptr %call22, ptr %str23)
  %record25 = load %WorkRequestRecord.5, ptr %record, align 8
  %obj_tmp26 = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %record25, ptr %obj_tmp26, align 8
  %field_ptr27 = getelementptr inbounds nuw %WorkRequestRecord.5, ptr %obj_tmp26, i32 0, i32 9
  %field_val28 = load ptr, ptr %field_ptr27, align 8
  %call29 = call ptr @mesh_string_concat(ptr %call24, ptr %field_val28)
  call void @mesh_println(ptr %call29)
  ret {} zeroinitializer
}

define {} @Work__log_status_transition_rejected(ptr %0, ptr %1, ptr %2) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %1, ptr %attempt_id, align 8
  %reason = alloca ptr, align 8
  store ptr %2, ptr %reason, align 8
  %str = call ptr @mesh_string_new(ptr @.str.227, i64 60)
  %request_key1 = load ptr, ptr %request_key, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %request_key1)
  %str2 = call ptr @mesh_string_new(ptr @.str.228, i64 12)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %attempt_id4 = load ptr, ptr %attempt_id, align 8
  %call5 = call ptr @mesh_string_concat(ptr %call3, ptr %attempt_id4)
  %str6 = call ptr @mesh_string_new(ptr @.str.229, i64 8)
  %call7 = call ptr @mesh_string_concat(ptr %call5, ptr %str6)
  %reason8 = load ptr, ptr %reason, align 8
  %call9 = call ptr @mesh_string_concat(ptr %call7, ptr %reason8)
  call void @mesh_println(ptr %call9)
  ret {} zeroinitializer
}

define {} @Work__log_invalid_selection(ptr %0, ptr %1, ptr %2, i1 %3, ptr %4) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %1, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %2, ptr %owner_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %3, ptr %routed_remotely, align 1
  %reason = alloca ptr, align 8
  store ptr %4, ptr %reason, align 8
  %str = call ptr @mesh_string_new(ptr @.str.230, i64 49)
  %request_key1 = load ptr, ptr %request_key, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %request_key1)
  %str2 = call ptr @mesh_string_new(ptr @.str.231, i64 9)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %ingress_node4 = load ptr, ptr %ingress_node, align 8
  %call5 = call ptr @mesh_string_concat(ptr %call3, ptr %ingress_node4)
  %str6 = call ptr @mesh_string_new(ptr @.str.232, i64 7)
  %call7 = call ptr @mesh_string_concat(ptr %call5, ptr %str6)
  %owner_node8 = load ptr, ptr %owner_node, align 8
  %call9 = call ptr @mesh_string_concat(ptr %call7, ptr %owner_node8)
  %str10 = call ptr @mesh_string_new(ptr @.str.233, i64 17)
  %call11 = call ptr @mesh_string_concat(ptr %call9, ptr %str10)
  %routed_remotely12 = load i1, ptr %routed_remotely, align 1
  %zext_arg = zext i1 %routed_remotely12 to i8
  %call13 = call ptr @mesh_bool_to_string(i8 %zext_arg)
  %call14 = call ptr @mesh_string_concat(ptr %call11, ptr %call13)
  %str15 = call ptr @mesh_string_new(ptr @.str.234, i64 8)
  %call16 = call ptr @mesh_string_concat(ptr %call14, ptr %str15)
  %reason17 = load ptr, ptr %reason, align 8
  %call18 = call ptr @mesh_string_concat(ptr %call16, ptr %reason17)
  call void @mesh_println(ptr %call18)
  ret {} zeroinitializer
}

define ptr @Work__registry_message(ptr %0, ptr %1) {
entry:
  %kind = alloca ptr, align 8
  store ptr %0, ptr %kind, align 8
  %payload_json = alloca ptr, align 8
  store ptr %1, ptr %payload_json, align 8
  %kind1 = load ptr, ptr %kind, align 8
  %str = call ptr @mesh_string_new(ptr @.str.235, i64 1)
  %concat = call ptr @mesh_string_concat(ptr %kind1, ptr %str)
  %payload_json2 = load ptr, ptr %payload_json, align 8
  %concat3 = call ptr @mesh_string_concat(ptr %concat, ptr %payload_json2)
  ret ptr %concat3
}

define ptr @Work__registry_message_kind(ptr %0) {
entry:
  %message = alloca ptr, align 8
  store ptr %0, ptr %message, align 8
  %parts = alloca ptr, align 8
  %message1 = load ptr, ptr %message, align 8
  %str = call ptr @mesh_string_new(ptr @.str.236, i64 1)
  %call = call ptr @mesh_string_split(ptr %message1, ptr %str)
  store ptr %call, ptr %parts, align 8
  %parts2 = load ptr, ptr %parts, align 8
  %call3 = call i64 @mesh_list_length(ptr %parts2)
  %gt = icmp sgt i64 %call3, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %parts4 = load ptr, ptr %parts, align 8
  %call5 = call i64 @mesh_list_head(ptr %parts4)
  %i64_to_ptr = inttoptr i64 %call5 to ptr
  store ptr %i64_to_ptr, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str6 = call ptr @mesh_string_new(ptr @.str.237, i64 0)
  store ptr %str6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @Work__registry_message_json(ptr %0) {
entry:
  %message = alloca ptr, align 8
  store ptr %0, ptr %message, align 8
  %parts = alloca ptr, align 8
  %message1 = load ptr, ptr %message, align 8
  %str = call ptr @mesh_string_new(ptr @.str.238, i64 1)
  %call = call ptr @mesh_string_split(ptr %message1, ptr %str)
  store ptr %call, ptr %parts, align 8
  %parts2 = load ptr, ptr %parts, align 8
  %call3 = call i64 @mesh_list_length(ptr %parts2)
  %gt = icmp sgt i64 %call3, 1
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %parts4 = load ptr, ptr %parts, align 8
  %call5 = call i64 @mesh_list_get(ptr %parts4, i64 1)
  %i64_to_ptr = inttoptr i64 %call5 to ptr
  store ptr %i64_to_ptr, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str6 = call ptr @mesh_string_new(ptr @.str.239, i64 2)
  store ptr %str6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define { %RequestRegistryState.8, ptr } @Work__status_found_response(%RequestRegistryState.8 %0, %WorkRequestRecord.5 %1) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %1, ptr %record, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %call = call {} @Work__log_status(%WorkRequestRecord.5 %record1)
  call void @mesh_reduction_check()
  %state2 = load %RequestRegistryState.8, ptr %state, align 8
  %str = call ptr @mesh_string_new(ptr @.str.240, i64 5)
  %record3 = load %WorkRequestRecord.5, ptr %record, align 8
  %str4 = call ptr @mesh_string_new(ptr @.str.241, i64 0)
  %str5 = call ptr @mesh_string_new(ptr @.str.242, i64 0)
  %call6 = call ptr @status_payload_json(%WorkRequestRecord.5 %record3, i1 true, ptr %str4, ptr %str5)
  call void @mesh_reduction_check()
  %call7 = call ptr @Work__registry_message(ptr %str, ptr %call6)
  call void @mesh_reduction_check()
  %tuple_ptr = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  store i64 2, ptr %tuple_ptr, align 8
  %tuple_base = ptrtoint ptr %tuple_ptr to i64
  %elem_addr = add i64 %tuple_base, 8
  %elem_ptr = inttoptr i64 %elem_addr to ptr
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %state2, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  store i64 %struct_ptr_to_i64, ptr %elem_ptr, align 8
  %tuple_base8 = ptrtoint ptr %tuple_ptr to i64
  %elem_addr9 = add i64 %tuple_base8, 16
  %elem_ptr10 = inttoptr i64 %elem_addr9 to ptr
  %ptr_to_i64 = ptrtoint ptr %call7 to i64
  store i64 %ptr_to_i64, ptr %elem_ptr10, align 8
  %ret_coerce_load = load { %RequestRegistryState.8, ptr }, ptr %tuple_ptr, align 8
  ret { %RequestRegistryState.8, ptr } %ret_coerce_load
}

define { %RequestRegistryState.8, ptr } @Work__status_missing_response(%RequestRegistryState.8 %0, ptr %1, ptr %2) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %reason = alloca ptr, align 8
  store ptr %2, ptr %reason, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %call = call {} @Work__log_status_missing(ptr %request_key1)
  call void @mesh_reduction_check()
  %state2 = load %RequestRegistryState.8, ptr %state, align 8
  %str = call ptr @mesh_string_new(ptr @.str.243, i64 7)
  %request_key3 = load ptr, ptr %request_key, align 8
  %reason4 = load ptr, ptr %reason, align 8
  %call5 = call ptr @Work__missing_status_payload_json(ptr %request_key3, ptr %reason4)
  call void @mesh_reduction_check()
  %call6 = call ptr @Work__registry_message(ptr %str, ptr %call5)
  call void @mesh_reduction_check()
  %tuple_ptr = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  store i64 2, ptr %tuple_ptr, align 8
  %tuple_base = ptrtoint ptr %tuple_ptr to i64
  %elem_addr = add i64 %tuple_base, 8
  %elem_ptr = inttoptr i64 %elem_addr to ptr
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %state2, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  store i64 %struct_ptr_to_i64, ptr %elem_ptr, align 8
  %tuple_base7 = ptrtoint ptr %tuple_ptr to i64
  %elem_addr8 = add i64 %tuple_base7, 16
  %elem_ptr9 = inttoptr i64 %elem_addr8 to ptr
  %ptr_to_i64 = ptrtoint ptr %call6 to i64
  store i64 %ptr_to_i64, ptr %elem_ptr9, align 8
  %ret_coerce_load = load { %RequestRegistryState.8, ptr }, ptr %tuple_ptr, align 8
  ret { %RequestRegistryState.8, ptr } %ret_coerce_load
}

define i64 @Work__log_status_transition_and_continue(%WorkRequestRecord.5 %0) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %0, ptr %record, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %call = call {} @Work__log_status_transition(%WorkRequestRecord.5 %record1)
  call void @mesh_reduction_check()
  ret i64 0
}

define %RequestRegistryState.8 @Work__mark_completed_success(%RequestRegistryState.8 %0, ptr %1) {
entry:
  %record = alloca %WorkRequestRecord.5, align 8
  %next_state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %next_state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %next_state1 = load %RequestRegistryState.8, ptr %next_state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %call = call { i8, ptr } @lookup_request(%RequestRegistryState.8 %next_state1, ptr %request_key2)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca i64, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load i64, ptr %match_result, align 8
  %next_state5 = load %RequestRegistryState.8, ptr %next_state, align 8
  ret %RequestRegistryState.8 %next_state5

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.244, i64 30, ptr @.panic_file.245, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkRequestRecord.5, ptr %path_val, align 8
  store %WorkRequestRecord.5 %deref_struct, ptr %record, align 8
  %record3 = load %WorkRequestRecord.5, ptr %record, align 8
  %call4 = call i64 @Work__log_status_transition_and_continue(%WorkRequestRecord.5 %record3)
  call void @mesh_reduction_check()
  store i64 %call4, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  store i64 0, ptr %match_result, align 8
  br label %match_merge
}

define %RequestRegistryState.8 @Work__mark_completed_error(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %reason = alloca ptr, align 8
  store ptr %3, ptr %reason, align 8
  %request_key1 = load ptr, ptr %request_key, align 8
  %attempt_id2 = load ptr, ptr %attempt_id, align 8
  %reason3 = load ptr, ptr %reason, align 8
  %call = call {} @Work__log_status_transition_rejected(ptr %request_key1, ptr %attempt_id2, ptr %reason3)
  call void @mesh_reduction_check()
  %state4 = load %RequestRegistryState.8, ptr %state, align 8
  ret %RequestRegistryState.8 %state4
}

define { %RequestRegistryState.8, ptr } @Work__submit_created_response(%RequestRegistryState.8 %0, %WorkRequestRecord.5 %1, ptr %2) {
entry:
  %next_state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %next_state, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %1, ptr %record, align 8
  %outcome = alloca ptr, align 8
  store ptr %2, ptr %outcome, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %call = call {} @Work__log_submit(%WorkRequestRecord.5 %record1)
  call void @mesh_reduction_check()
  %next_state2 = load %RequestRegistryState.8, ptr %next_state, align 8
  %outcome3 = load ptr, ptr %outcome, align 8
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.246, i64 0)
  %str5 = call ptr @mesh_string_new(ptr @.str.247, i64 0)
  %call6 = call ptr @status_payload_json(%WorkRequestRecord.5 %record4, i1 true, ptr %str, ptr %str5)
  call void @mesh_reduction_check()
  %call7 = call ptr @Work__registry_message(ptr %outcome3, ptr %call6)
  call void @mesh_reduction_check()
  %tuple_ptr = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  store i64 2, ptr %tuple_ptr, align 8
  %tuple_base = ptrtoint ptr %tuple_ptr to i64
  %elem_addr = add i64 %tuple_base, 8
  %elem_ptr = inttoptr i64 %elem_addr to ptr
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %next_state2, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  store i64 %struct_ptr_to_i64, ptr %elem_ptr, align 8
  %tuple_base8 = ptrtoint ptr %tuple_ptr to i64
  %elem_addr9 = add i64 %tuple_base8, 16
  %elem_ptr10 = inttoptr i64 %elem_addr9 to ptr
  %ptr_to_i64 = ptrtoint ptr %call7 to i64
  store i64 %ptr_to_i64, ptr %elem_ptr10, align 8
  %ret_coerce_load = load { %RequestRegistryState.8, ptr }, ptr %tuple_ptr, align 8
  ret { %RequestRegistryState.8, ptr } %ret_coerce_load
}

define { %RequestRegistryState.8, ptr } @Work__submit_duplicate_response(%RequestRegistryState.8 %0, %WorkRequestRecord.5 %1, ptr %2) {
entry:
  %next_state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %next_state, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %1, ptr %record, align 8
  %outcome = alloca ptr, align 8
  store ptr %2, ptr %outcome, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %call = call {} @Work__log_dedupe(%WorkRequestRecord.5 %record1)
  call void @mesh_reduction_check()
  %next_state2 = load %RequestRegistryState.8, ptr %next_state, align 8
  %outcome3 = load ptr, ptr %outcome, align 8
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.248, i64 0)
  %str5 = call ptr @mesh_string_new(ptr @.str.249, i64 0)
  %call6 = call ptr @status_payload_json(%WorkRequestRecord.5 %record4, i1 true, ptr %str, ptr %str5)
  call void @mesh_reduction_check()
  %call7 = call ptr @Work__registry_message(ptr %outcome3, ptr %call6)
  call void @mesh_reduction_check()
  %tuple_ptr = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  store i64 2, ptr %tuple_ptr, align 8
  %tuple_base = ptrtoint ptr %tuple_ptr to i64
  %elem_addr = add i64 %tuple_base, 8
  %elem_ptr = inttoptr i64 %elem_addr to ptr
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %next_state2, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  store i64 %struct_ptr_to_i64, ptr %elem_ptr, align 8
  %tuple_base8 = ptrtoint ptr %tuple_ptr to i64
  %elem_addr9 = add i64 %tuple_base8, 16
  %elem_ptr10 = inttoptr i64 %elem_addr9 to ptr
  %ptr_to_i64 = ptrtoint ptr %call7 to i64
  store i64 %ptr_to_i64, ptr %elem_ptr10, align 8
  %ret_coerce_load = load { %RequestRegistryState.8, ptr }, ptr %tuple_ptr, align 8
  ret { %RequestRegistryState.8, ptr } %ret_coerce_load
}

define { %RequestRegistryState.8, ptr } @Work__submit_conflict_response(%RequestRegistryState.8 %0, %WorkRequestRecord.5 %1, ptr %2, ptr %3, ptr %4) {
entry:
  %next_state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %next_state, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  store %WorkRequestRecord.5 %1, ptr %record, align 8
  %request_key = alloca ptr, align 8
  store ptr %2, ptr %request_key, align 8
  %conflict_reason = alloca ptr, align 8
  store ptr %3, ptr %conflict_reason, align 8
  %outcome = alloca ptr, align 8
  store ptr %4, ptr %outcome, align 8
  %record1 = load %WorkRequestRecord.5, ptr %record, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %conflict_reason3 = load ptr, ptr %conflict_reason, align 8
  %call = call {} @Work__log_conflict(%WorkRequestRecord.5 %record1, ptr %request_key2, ptr %conflict_reason3)
  call void @mesh_reduction_check()
  %next_state4 = load %RequestRegistryState.8, ptr %next_state, align 8
  %outcome5 = load ptr, ptr %outcome, align 8
  %record6 = load %WorkRequestRecord.5, ptr %record, align 8
  %str = call ptr @mesh_string_new(ptr @.str.250, i64 0)
  %conflict_reason7 = load ptr, ptr %conflict_reason, align 8
  %call8 = call ptr @status_payload_json(%WorkRequestRecord.5 %record6, i1 false, ptr %str, ptr %conflict_reason7)
  call void @mesh_reduction_check()
  %call9 = call ptr @Work__registry_message(ptr %outcome5, ptr %call8)
  call void @mesh_reduction_check()
  %tuple_ptr = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  store i64 2, ptr %tuple_ptr, align 8
  %tuple_base = ptrtoint ptr %tuple_ptr to i64
  %elem_addr = add i64 %tuple_base, 8
  %elem_ptr = inttoptr i64 %elem_addr to ptr
  %struct_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr (%RequestRegistryState.8, ptr null, i32 1) to i64), i64 8)
  store %RequestRegistryState.8 %next_state4, ptr %struct_heap, align 8
  %struct_ptr_to_i64 = ptrtoint ptr %struct_heap to i64
  store i64 %struct_ptr_to_i64, ptr %elem_ptr, align 8
  %tuple_base10 = ptrtoint ptr %tuple_ptr to i64
  %elem_addr11 = add i64 %tuple_base10, 16
  %elem_ptr12 = inttoptr i64 %elem_addr11 to ptr
  %ptr_to_i64 = ptrtoint ptr %call9 to i64
  store i64 %ptr_to_i64, ptr %elem_ptr12, align 8
  %ret_coerce_load = load { %RequestRegistryState.8, ptr }, ptr %tuple_ptr, align 8
  ret { %RequestRegistryState.8, ptr } %ret_coerce_load
}

define { %RequestRegistryState.8, ptr } @Work__submit_registry_response(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i1 %6, i1 %7) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %payload_hash_value = alloca ptr, align 8
  store ptr %2, ptr %payload_hash_value, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %3, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %4, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %5, ptr %replica_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %6, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %7, ptr %fell_back_locally, align 1
  %decision = alloca %SubmitMutation.7, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %payload_hash_value3 = load ptr, ptr %payload_hash_value, align 8
  %ingress_node4 = load ptr, ptr %ingress_node, align 8
  %owner_node5 = load ptr, ptr %owner_node, align 8
  %replica_node6 = load ptr, ptr %replica_node, align 8
  %routed_remotely7 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally8 = load i1, ptr %fell_back_locally, align 1
  %call = call %SubmitMutation.7 @Work__submit_decision(%RequestRegistryState.8 %state1, ptr %request_key2, ptr %payload_hash_value3, ptr %ingress_node4, ptr %owner_node5, ptr %replica_node6, i1 %routed_remotely7, i1 %fell_back_locally8)
  call void @mesh_reduction_check()
  store %SubmitMutation.7 %call, ptr %decision, align 8
  %next_state = alloca %RequestRegistryState.8, align 8
  %state9 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key10 = load ptr, ptr %request_key, align 8
  %decision11 = load %SubmitMutation.7, ptr %decision, align 8
  %call12 = call %RequestRegistryState.8 @Work__submit_next_state(%RequestRegistryState.8 %state9, ptr %request_key10, %SubmitMutation.7 %decision11)
  call void @mesh_reduction_check()
  store %RequestRegistryState.8 %call12, ptr %next_state, align 8
  %decision13 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision13, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %str = call ptr @mesh_string_new(ptr @.str.251, i64 7)
  %str_eq = call i8 @mesh_string_eq(ptr %field_val, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca { %RequestRegistryState.8, ptr }, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %next_state14 = load %RequestRegistryState.8, ptr %next_state, align 8
  %decision15 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp16 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision15, ptr %obj_tmp16, align 8
  %field_ptr17 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp16, i32 0, i32 1
  %field_val18 = load %WorkRequestRecord.5, ptr %field_ptr17, align 8
  %decision19 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp20 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision19, ptr %obj_tmp20, align 8
  %field_ptr21 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp20, i32 0, i32 0
  %field_val22 = load ptr, ptr %field_ptr21, align 8
  %call23 = call { %RequestRegistryState.8, ptr } @Work__submit_created_response(%RequestRegistryState.8 %next_state14, %WorkRequestRecord.5 %field_val18, ptr %field_val22)
  call void @mesh_reduction_check()
  store { %RequestRegistryState.8, ptr } %call23, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %decision24 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp25 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision24, ptr %obj_tmp25, align 8
  %field_ptr26 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp25, i32 0, i32 0
  %field_val27 = load ptr, ptr %field_ptr26, align 8
  %str28 = call ptr @mesh_string_new(ptr @.str.252, i64 9)
  %str_eq29 = call i8 @mesh_string_eq(ptr %field_val27, ptr %str28)
  %str_eq_bool30 = icmp ne i8 %str_eq29, 0
  %if_result31 = alloca { %RequestRegistryState.8, ptr }, align 8
  br i1 %str_eq_bool30, label %then32, label %else33

if_merge:                                         ; preds = %if_merge34, %then
  %if_val60 = load { %RequestRegistryState.8, ptr }, ptr %if_result, align 8
  ret { %RequestRegistryState.8, ptr } %if_val60

then32:                                           ; preds = %else
  %next_state35 = load %RequestRegistryState.8, ptr %next_state, align 8
  %decision36 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp37 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision36, ptr %obj_tmp37, align 8
  %field_ptr38 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp37, i32 0, i32 1
  %field_val39 = load %WorkRequestRecord.5, ptr %field_ptr38, align 8
  %decision40 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp41 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision40, ptr %obj_tmp41, align 8
  %field_ptr42 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp41, i32 0, i32 0
  %field_val43 = load ptr, ptr %field_ptr42, align 8
  %call44 = call { %RequestRegistryState.8, ptr } @Work__submit_duplicate_response(%RequestRegistryState.8 %next_state35, %WorkRequestRecord.5 %field_val39, ptr %field_val43)
  call void @mesh_reduction_check()
  store { %RequestRegistryState.8, ptr } %call44, ptr %if_result31, align 8
  br label %if_merge34

else33:                                           ; preds = %else
  %next_state45 = load %RequestRegistryState.8, ptr %next_state, align 8
  %decision46 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp47 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision46, ptr %obj_tmp47, align 8
  %field_ptr48 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp47, i32 0, i32 1
  %field_val49 = load %WorkRequestRecord.5, ptr %field_ptr48, align 8
  %request_key50 = load ptr, ptr %request_key, align 8
  %decision51 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp52 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision51, ptr %obj_tmp52, align 8
  %field_ptr53 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp52, i32 0, i32 2
  %field_val54 = load ptr, ptr %field_ptr53, align 8
  %decision55 = load %SubmitMutation.7, ptr %decision, align 8
  %obj_tmp56 = alloca %SubmitMutation.7, align 8
  store %SubmitMutation.7 %decision55, ptr %obj_tmp56, align 8
  %field_ptr57 = getelementptr inbounds nuw %SubmitMutation.7, ptr %obj_tmp56, i32 0, i32 0
  %field_val58 = load ptr, ptr %field_ptr57, align 8
  %call59 = call { %RequestRegistryState.8, ptr } @Work__submit_conflict_response(%RequestRegistryState.8 %next_state45, %WorkRequestRecord.5 %field_val49, ptr %request_key50, ptr %field_val54, ptr %field_val58)
  call void @mesh_reduction_check()
  store { %RequestRegistryState.8, ptr } %call59, ptr %if_result31, align 8
  br label %if_merge34

if_merge34:                                       ; preds = %else33, %then32
  %if_val = load { %RequestRegistryState.8, ptr }, ptr %if_result31, align 8
  store { %RequestRegistryState.8, ptr } %if_val, ptr %if_result, align 8
  br label %if_merge
}

define { %RequestRegistryState.8, ptr } @Work__get_status_registry_response(%RequestRegistryState.8 %0, ptr %1) {
entry:
  %reason = alloca ptr, align 8
  %record = alloca %WorkRequestRecord.5, align 8
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %call = call { i8, ptr } @lookup_request(%RequestRegistryState.8 %state1, ptr %request_key2)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca { %RequestRegistryState.8, ptr }, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load { %RequestRegistryState.8, ptr }, ptr %match_result, align 8
  ret { %RequestRegistryState.8, ptr } %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.253, i64 30, ptr @.panic_file.254, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkRequestRecord.5, ptr %path_val, align 8
  store %WorkRequestRecord.5 %deref_struct, ptr %record, align 8
  %state3 = load %RequestRegistryState.8, ptr %state, align 8
  %record4 = load %WorkRequestRecord.5, ptr %record, align 8
  %call5 = call { %RequestRegistryState.8, ptr } @Work__status_found_response(%RequestRegistryState.8 %state3, %WorkRequestRecord.5 %record4)
  call void @mesh_reduction_check()
  store { %RequestRegistryState.8, ptr } %call5, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant_field6 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val7 = load ptr, ptr %variant_field6, align 8
  store ptr %path_val7, ptr %reason, align 8
  %state8 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key9 = load ptr, ptr %request_key, align 8
  %reason10 = load ptr, ptr %reason, align 8
  %call11 = call { %RequestRegistryState.8, ptr } @Work__status_missing_response(%RequestRegistryState.8 %state8, ptr %request_key9, ptr %reason10)
  call void @mesh_reduction_check()
  store { %RequestRegistryState.8, ptr } %call11, ptr %match_result, align 8
  br label %match_merge
}

define %RequestRegistryState.8 @Work__mark_completed_registry_state(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3) {
entry:
  %reason = alloca ptr, align 8
  %next_state = alloca %RequestRegistryState.8, align 8
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %3, ptr %execution_node, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %attempt_id3 = load ptr, ptr %attempt_id, align 8
  %execution_node4 = load ptr, ptr %execution_node, align 8
  %call = call { i8, ptr } @apply_completion(%RequestRegistryState.8 %state1, ptr %request_key2, ptr %attempt_id3, ptr %execution_node4)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call, ptr %scrutinee, align 8
  %match_result = alloca %RequestRegistryState.8, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load %RequestRegistryState.8, ptr %match_result, align 8
  ret %RequestRegistryState.8 %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.255, i64 30, ptr @.panic_file.256, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %RequestRegistryState.8, ptr %path_val, align 8
  store %RequestRegistryState.8 %deref_struct, ptr %next_state, align 8
  %next_state5 = load %RequestRegistryState.8, ptr %next_state, align 8
  %request_key6 = load ptr, ptr %request_key, align 8
  %call7 = call %RequestRegistryState.8 @Work__mark_completed_success(%RequestRegistryState.8 %next_state5, ptr %request_key6)
  call void @mesh_reduction_check()
  store %RequestRegistryState.8 %call7, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant_field8 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val9 = load ptr, ptr %variant_field8, align 8
  store ptr %path_val9, ptr %reason, align 8
  %state10 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key11 = load ptr, ptr %request_key, align 8
  %attempt_id12 = load ptr, ptr %attempt_id, align 8
  %reason13 = load ptr, ptr %reason, align 8
  %call14 = call %RequestRegistryState.8 @Work__mark_completed_error(%RequestRegistryState.8 %state10, ptr %request_key11, ptr %attempt_id12, ptr %reason13)
  call void @mesh_reduction_check()
  store %RequestRegistryState.8 %call14, ptr %match_result, align 8
  br label %match_merge
}

define %RequestRegistryState.8 @__service_workrequestregistry_init() {
entry:
  %call = call %RequestRegistryState.8 @initial_request_registry_state()
  call void @mesh_reduction_check()
  ret %RequestRegistryState.8 %call
}

define ptr @__service_workrequestregistry_handle_call_submit(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i1 %6, i1 %7) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %payload_hash_value = alloca ptr, align 8
  store ptr %2, ptr %payload_hash_value, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %3, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %4, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %5, ptr %replica_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %6, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %7, ptr %fell_back_locally, align 1
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %payload_hash_value3 = load ptr, ptr %payload_hash_value, align 8
  %ingress_node4 = load ptr, ptr %ingress_node, align 8
  %owner_node5 = load ptr, ptr %owner_node, align 8
  %replica_node6 = load ptr, ptr %replica_node, align 8
  %routed_remotely7 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally8 = load i1, ptr %fell_back_locally, align 1
  %call = call { %RequestRegistryState.8, ptr } @Work__submit_registry_response(%RequestRegistryState.8 %state1, ptr %request_key2, ptr %payload_hash_value3, ptr %ingress_node4, ptr %owner_node5, ptr %replica_node6, i1 %routed_remotely7, i1 %fell_back_locally8)
  call void @mesh_reduction_check()
  %ret_coerce_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr ({ %RequestRegistryState.8, ptr }, ptr null, i32 1) to i64), i64 8)
  store { %RequestRegistryState.8, ptr } %call, ptr %ret_coerce_heap, align 8
  ret ptr %ret_coerce_heap
}

define ptr @__service_workrequestregistry_handle_call_get_status(%RequestRegistryState.8 %0, ptr %1) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %call = call { %RequestRegistryState.8, ptr } @Work__get_status_registry_response(%RequestRegistryState.8 %state1, ptr %request_key2)
  call void @mesh_reduction_check()
  %ret_coerce_heap = call ptr @mesh_gc_alloc_actor(i64 ptrtoint (ptr getelementptr ({ %RequestRegistryState.8, ptr }, ptr null, i32 1) to i64), i64 8)
  store { %RequestRegistryState.8, ptr } %call, ptr %ret_coerce_heap, align 8
  ret ptr %ret_coerce_heap
}

define %RequestRegistryState.8 @__service_workrequestregistry_handle_cast_mark_completed(%RequestRegistryState.8 %0, ptr %1, ptr %2, ptr %3) {
entry:
  %state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %0, ptr %state, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %3, ptr %execution_node, align 8
  %state1 = load %RequestRegistryState.8, ptr %state, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %attempt_id3 = load ptr, ptr %attempt_id, align 8
  %execution_node4 = load ptr, ptr %execution_node, align 8
  %call = call %RequestRegistryState.8 @Work__mark_completed_registry_state(%RequestRegistryState.8 %state1, ptr %request_key2, ptr %attempt_id3, ptr %execution_node4)
  call void @mesh_reduction_check()
  ret %RequestRegistryState.8 %call
}

define ptr @__service_workrequestregistry_call_submit(i64 %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i1 %6, i1 %7) {
entry:
  %__pid = alloca i64, align 8
  store i64 %0, ptr %__pid, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %payload_hash_value = alloca ptr, align 8
  store ptr %2, ptr %payload_hash_value, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %3, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  store ptr %4, ptr %owner_node, align 8
  %replica_node = alloca ptr, align 8
  store ptr %5, ptr %replica_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %6, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  store i1 %7, ptr %fell_back_locally, align 1
  %__pid1 = load i64, ptr %__pid, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %payload_hash_value3 = load ptr, ptr %payload_hash_value, align 8
  %ingress_node4 = load ptr, ptr %ingress_node, align 8
  %owner_node5 = load ptr, ptr %owner_node, align 8
  %replica_node6 = load ptr, ptr %replica_node, align 8
  %routed_remotely7 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally8 = load i1, ptr %fell_back_locally, align 1
  %__pid9 = load i64, ptr %__pid, align 8
  %request_key10 = load ptr, ptr %request_key, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key10 to i64
  %payload_hash_value11 = load ptr, ptr %payload_hash_value, align 8
  %ptr_to_i6412 = ptrtoint ptr %payload_hash_value11 to i64
  %ingress_node13 = load ptr, ptr %ingress_node, align 8
  %ptr_to_i6414 = ptrtoint ptr %ingress_node13 to i64
  %owner_node15 = load ptr, ptr %owner_node, align 8
  %ptr_to_i6416 = ptrtoint ptr %owner_node15 to i64
  %replica_node17 = load ptr, ptr %replica_node, align 8
  %ptr_to_i6418 = ptrtoint ptr %replica_node17 to i64
  %routed_remotely19 = load i1, ptr %routed_remotely, align 1
  %zext_to_i64 = zext i1 %routed_remotely19 to i64
  %fell_back_locally20 = load i1, ptr %fell_back_locally, align 1
  %zext_to_i6421 = zext i1 %fell_back_locally20 to i64
  %call_payload = alloca [7 x i64], align 8
  %payload_elem = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 0
  store i64 %ptr_to_i64, ptr %payload_elem, align 8
  %payload_elem22 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 1
  store i64 %ptr_to_i6412, ptr %payload_elem22, align 8
  %payload_elem23 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 2
  store i64 %ptr_to_i6414, ptr %payload_elem23, align 8
  %payload_elem24 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 3
  store i64 %ptr_to_i6416, ptr %payload_elem24, align 8
  %payload_elem25 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 4
  store i64 %ptr_to_i6418, ptr %payload_elem25, align 8
  %payload_elem26 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 5
  store i64 %zext_to_i64, ptr %payload_elem26, align 8
  %payload_elem27 = getelementptr [7 x i64], ptr %call_payload, i32 0, i32 6
  store i64 %zext_to_i6421, ptr %payload_elem27, align 8
  %call_result = call ptr @mesh_service_call(i64 %__pid9, i64 0, ptr %call_payload, i64 56)
  %reply_data = getelementptr i8, ptr %call_result, i64 16
  %reply_i64 = load i64, ptr %reply_data, align 8
  %reply_ptr = inttoptr i64 %reply_i64 to ptr
  ret ptr %reply_ptr
}

define ptr @__service_workrequestregistry_call_get_status(i64 %0, ptr %1) {
entry:
  %__pid = alloca i64, align 8
  store i64 %0, ptr %__pid, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %__pid1 = load i64, ptr %__pid, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %__pid3 = load i64, ptr %__pid, align 8
  %request_key4 = load ptr, ptr %request_key, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key4 to i64
  %call_payload = alloca [1 x i64], align 8
  %payload_elem = getelementptr [1 x i64], ptr %call_payload, i32 0, i32 0
  store i64 %ptr_to_i64, ptr %payload_elem, align 8
  %call_result = call ptr @mesh_service_call(i64 %__pid3, i64 1, ptr %call_payload, i64 8)
  %reply_data = getelementptr i8, ptr %call_result, i64 16
  %reply_i64 = load i64, ptr %reply_data, align 8
  %reply_ptr = inttoptr i64 %reply_i64 to ptr
  ret ptr %reply_ptr
}

define {} @__service_workrequestregistry_cast_mark_completed(i64 %0, ptr %1, ptr %2, ptr %3) {
entry:
  %__pid = alloca i64, align 8
  store i64 %0, ptr %__pid, align 8
  %request_key = alloca ptr, align 8
  store ptr %1, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %2, ptr %attempt_id, align 8
  %execution_node = alloca ptr, align 8
  store ptr %3, ptr %execution_node, align 8
  %__pid1 = load i64, ptr %__pid, align 8
  %request_key2 = load ptr, ptr %request_key, align 8
  %attempt_id3 = load ptr, ptr %attempt_id, align 8
  %execution_node4 = load ptr, ptr %execution_node, align 8
  %__pid5 = load i64, ptr %__pid, align 8
  %request_key6 = load ptr, ptr %request_key, align 8
  %ptr_to_i64 = ptrtoint ptr %request_key6 to i64
  %attempt_id7 = load ptr, ptr %attempt_id, align 8
  %ptr_to_i648 = ptrtoint ptr %attempt_id7 to i64
  %execution_node9 = load ptr, ptr %execution_node, align 8
  %ptr_to_i6410 = ptrtoint ptr %execution_node9 to i64
  %cast_msg = alloca [5 x i64], align 8
  %tag_slot = getelementptr [5 x i64], ptr %cast_msg, i32 0, i32 0
  store i64 2, ptr %tag_slot, align 8
  %caller_slot = getelementptr [5 x i64], ptr %cast_msg, i32 0, i32 1
  store i64 0, ptr %caller_slot, align 8
  %arg_slot = getelementptr [5 x i64], ptr %cast_msg, i32 0, i32 2
  store i64 %ptr_to_i64, ptr %arg_slot, align 8
  %arg_slot11 = getelementptr [5 x i64], ptr %cast_msg, i32 0, i32 3
  store i64 %ptr_to_i648, ptr %arg_slot11, align 8
  %arg_slot12 = getelementptr [5 x i64], ptr %cast_msg, i32 0, i32 4
  store i64 %ptr_to_i6410, ptr %arg_slot12, align 8
  call void @mesh_actor_send(i64 %__pid5, ptr %cast_msg, i64 40)
  ret {} zeroinitializer
}

define i64 @__service_workrequestregistry_start() {
entry:
  %__init_state = alloca %RequestRegistryState.8, align 8
  %call = call %RequestRegistryState.8 @__service_workrequestregistry_init()
  call void @mesh_reduction_check()
  store %RequestRegistryState.8 %call, ptr %__init_state, align 8
  %__init_state1 = load %RequestRegistryState.8, ptr %__init_state, align 8
  %spawn_args = call ptr @mesh_gc_alloc_actor(i64 16, i64 8)
  store %RequestRegistryState.8 %__init_state1, ptr %spawn_args, align 8
  %pid = call i64 @mesh_actor_spawn(ptr @__service_workrequestregistry_loop, ptr %spawn_args, i64 16, i8 1)
  ret i64 %pid
}

define {} @__service_workrequestregistry_loop(ptr %0) {
entry:
  %__args_ptr = alloca ptr, align 8
  store ptr %0, ptr %__args_ptr, align 8
  %args_ptr_val = load ptr, ptr %__args_ptr, align 8
  %init_state = load %RequestRegistryState.8, ptr %args_ptr_val, align 8
  %__state = alloca %RequestRegistryState.8, align 8
  store %RequestRegistryState.8 %init_state, ptr %__state, align 8
  br label %loop

loop:                                             ; preds = %default, %handler_2, %handler_1, %handler_0, %entry
  %state = load %RequestRegistryState.8, ptr %__state, align 8
  %msg_ptr = call ptr @mesh_actor_receive(i64 -1)
  %msg_is_null = icmp eq ptr %msg_ptr, null
  br i1 %msg_is_null, label %exit_loop, label %continue_loop

exit_loop:                                        ; preds = %loop
  ret {} zeroinitializer

continue_loop:                                    ; preds = %loop
  %data_ptr = getelementptr i8, ptr %msg_ptr, i64 16
  %type_tag = load i64, ptr %data_ptr, align 8
  %caller_ptr = getelementptr i8, ptr %data_ptr, i64 8
  %caller_pid = load i64, ptr %caller_ptr, align 8
  switch i64 %type_tag, label %default [
    i64 0, label %handler_0
    i64 1, label %handler_1
    i64 2, label %handler_2
  ]

default:                                          ; preds = %continue_loop
  br label %loop

handler_0:                                        ; preds = %continue_loop
  %arg_0_ptr = getelementptr i8, ptr %data_ptr, i64 16
  %arg_0 = load ptr, ptr %arg_0_ptr, align 8
  %arg_1_ptr = getelementptr i8, ptr %data_ptr, i64 24
  %arg_1 = load ptr, ptr %arg_1_ptr, align 8
  %arg_2_ptr = getelementptr i8, ptr %data_ptr, i64 32
  %arg_2 = load ptr, ptr %arg_2_ptr, align 8
  %arg_3_ptr = getelementptr i8, ptr %data_ptr, i64 40
  %arg_3 = load ptr, ptr %arg_3_ptr, align 8
  %arg_4_ptr = getelementptr i8, ptr %data_ptr, i64 48
  %arg_4 = load ptr, ptr %arg_4_ptr, align 8
  %arg_5_ptr = getelementptr i8, ptr %data_ptr, i64 56
  %arg_5 = load i64, ptr %arg_5_ptr, align 8
  %trunc_arg_5 = trunc i64 %arg_5 to i1
  %arg_6_ptr = getelementptr i8, ptr %data_ptr, i64 64
  %arg_6 = load i64, ptr %arg_6_ptr, align 8
  %trunc_arg_6 = trunc i64 %arg_6 to i1
  %handler_result = call ptr @__service_workrequestregistry_handle_call_submit(%RequestRegistryState.8 %state, ptr %arg_0, ptr %arg_1, ptr %arg_2, ptr %arg_3, ptr %arg_4, i1 %trunc_arg_5, i1 %trunc_arg_6)
  %new_state = call i64 @mesh_tuple_first(ptr %handler_result)
  %reply = call i64 @mesh_tuple_second(ptr %handler_result)
  %reply_buf = alloca i64, align 8
  store i64 %reply, ptr %reply_buf, align 8
  call void @mesh_service_reply(i64 %caller_pid, ptr %reply_buf, i64 8)
  %new_state_struct_ptr = inttoptr i64 %new_state to ptr
  %new_state_struct = load %RequestRegistryState.8, ptr %new_state_struct_ptr, align 8
  store %RequestRegistryState.8 %new_state_struct, ptr %__state, align 8
  br label %loop

handler_1:                                        ; preds = %continue_loop
  %arg_0_ptr1 = getelementptr i8, ptr %data_ptr, i64 16
  %arg_02 = load ptr, ptr %arg_0_ptr1, align 8
  %handler_result3 = call ptr @__service_workrequestregistry_handle_call_get_status(%RequestRegistryState.8 %state, ptr %arg_02)
  %new_state4 = call i64 @mesh_tuple_first(ptr %handler_result3)
  %reply5 = call i64 @mesh_tuple_second(ptr %handler_result3)
  %reply_buf6 = alloca i64, align 8
  store i64 %reply5, ptr %reply_buf6, align 8
  call void @mesh_service_reply(i64 %caller_pid, ptr %reply_buf6, i64 8)
  %new_state_struct_ptr7 = inttoptr i64 %new_state4 to ptr
  %new_state_struct8 = load %RequestRegistryState.8, ptr %new_state_struct_ptr7, align 8
  store %RequestRegistryState.8 %new_state_struct8, ptr %__state, align 8
  br label %loop

handler_2:                                        ; preds = %continue_loop
  %arg_0_ptr9 = getelementptr i8, ptr %data_ptr, i64 16
  %arg_010 = load ptr, ptr %arg_0_ptr9, align 8
  %arg_1_ptr11 = getelementptr i8, ptr %data_ptr, i64 24
  %arg_112 = load ptr, ptr %arg_1_ptr11, align 8
  %arg_2_ptr13 = getelementptr i8, ptr %data_ptr, i64 32
  %arg_214 = load ptr, ptr %arg_2_ptr13, align 8
  %handler_result15 = call %RequestRegistryState.8 @__service_workrequestregistry_handle_cast_mark_completed(%RequestRegistryState.8 %state, ptr %arg_010, ptr %arg_112, ptr %arg_214)
  store %RequestRegistryState.8 %handler_result15, ptr %__state, align 8
  br label %loop
}

define ptr @Work__local_request_registry_name() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.257, i64 27)
  ret ptr %str
}

define i64 @Work__local_request_registry_pid() {
entry:
  %call = call ptr @Work__local_request_registry_name()
  call void @mesh_reduction_check()
  %call1 = call i64 @mesh_process_whereis(ptr %call)
  %i64_to_ptr = inttoptr i64 %call1 to ptr
  %ret_coerce_ptrtoint = ptrtoint ptr %i64_to_ptr to i64
  ret i64 %ret_coerce_ptrtoint
}

define i64 @Work__request_registry_pid_for_node(ptr %0) {
entry:
  %node_name = alloca ptr, align 8
  store ptr %0, ptr %node_name, align 8
  %call = call ptr @current_self_name()
  call void @mesh_reduction_check()
  %call1 = call i64 @mesh_string_length(ptr %call)
  %gt = icmp sgt i64 %call1, 0
  %if_result = alloca i64, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %node_name2 = load ptr, ptr %node_name, align 8
  %call3 = call ptr @request_registry_name_for_node(ptr %node_name2)
  call void @mesh_reduction_check()
  %node_name4 = load ptr, ptr %node_name, align 8
  %call5 = call ptr @request_registry_name_for_node(ptr %node_name4)
  call void @mesh_reduction_check()
  %str_len = load i64, ptr %call5, align 8
  %str_data = getelementptr i8, ptr %call5, i64 8
  %node_call = call i64 @mesh_global_whereis(ptr %str_data, i64 %str_len)
  store i64 %node_call, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %call6 = call i64 @Work__local_request_registry_pid()
  call void @mesh_reduction_check()
  store i64 %call6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load i64, ptr %if_result, align 8
  ret i64 %if_val
}

define i64 @Work__register_global_request_registry(i64 %0) {
entry:
  %registry_pid = alloca i64, align 8
  store i64 %0, ptr %registry_pid, align 8
  %self_name = alloca ptr, align 8
  %call = call ptr @current_self_name()
  call void @mesh_reduction_check()
  store ptr %call, ptr %self_name, align 8
  %self_name1 = load ptr, ptr %self_name, align 8
  %call2 = call i64 @mesh_string_length(ptr %self_name1)
  %gt = icmp sgt i64 %call2, 0
  %if_result = alloca i64, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %self_name3 = load ptr, ptr %self_name, align 8
  %call4 = call ptr @request_registry_name_for_node(ptr %self_name3)
  call void @mesh_reduction_check()
  %registry_pid5 = load i64, ptr %registry_pid, align 8
  %self_name6 = load ptr, ptr %self_name, align 8
  %call7 = call ptr @request_registry_name_for_node(ptr %self_name6)
  call void @mesh_reduction_check()
  %str_len = load i64, ptr %call7, align 8
  %str_data = getelementptr i8, ptr %call7, i64 8
  %registry_pid8 = load i64, ptr %registry_pid, align 8
  %global_register = call i64 @mesh_global_register(ptr %str_data, i64 %str_len, i64 %registry_pid8)
  %call9 = call ptr @Work__local_request_registry_name()
  call void @mesh_reduction_check()
  %registry_pid10 = load i64, ptr %registry_pid, align 8
  %call11 = call ptr @Work__local_request_registry_name()
  call void @mesh_reduction_check()
  %str_len12 = load i64, ptr %call11, align 8
  %str_data13 = getelementptr i8, ptr %call11, i64 8
  %registry_pid14 = load i64, ptr %registry_pid, align 8
  %global_register15 = call i64 @mesh_global_register(ptr %str_data13, i64 %str_len12, i64 %registry_pid14)
  %str = call ptr @mesh_string_new(ptr @.str.258, i64 46)
  %self_name16 = load ptr, ptr %self_name, align 8
  %call17 = call ptr @request_registry_name_for_node(ptr %self_name16)
  call void @mesh_reduction_check()
  %call18 = call ptr @mesh_string_concat(ptr %str, ptr %call17)
  call void @mesh_println(ptr %call18)
  store i64 0, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  store i64 0, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load i64, ptr %if_result, align 8
  ret i64 %if_val
}

define i1 @Work__closure_1(ptr %0, ptr %1) {
entry:
  %__env = alloca ptr, align 8
  store ptr %0, ptr %__env, align 8
  %node = alloca ptr, align 8
  store ptr %1, ptr %node, align 8
  %env_ptr = load ptr, ptr %__env, align 8
  %cap_self_name = getelementptr inbounds nuw { ptr }, ptr %env_ptr, i32 0, i32 0
  %self_name = load ptr, ptr %cap_self_name, align 8
  %self_name1 = alloca ptr, align 8
  store ptr %self_name, ptr %self_name1, align 8
  %node2 = load ptr, ptr %node, align 8
  %self_name3 = load ptr, ptr %self_name1, align 8
  %str_eq = call i8 @mesh_string_eq(ptr %node2, ptr %self_name3)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %str_neq = xor i1 %str_eq_bool, true
  ret i1 %str_neq
}

define %TargetSelection.3 @Work__current_target_selection() {
entry:
  %self_name = alloca ptr, align 8
  %call = call ptr @Work__effective_work_node_name()
  call void @mesh_reduction_check()
  store ptr %call, ptr %self_name, align 8
  %peers = alloca ptr, align 8
  %call1 = call ptr @current_self_name()
  call void @mesh_reduction_check()
  %call2 = call i64 @mesh_string_length(ptr %call1)
  %gt = icmp sgt i64 %call2, 0
  %if_result = alloca ptr, align 8
  br i1 %gt, label %then, label %else

then:                                             ; preds = %entry
  %call3 = call ptr @current_membership()
  call void @mesh_reduction_check()
  %env_raw = call ptr @mesh_gc_alloc_actor(i64 8, i64 8)
  %self_name4 = load ptr, ptr %self_name, align 8
  %cap_ptr = getelementptr inbounds nuw { ptr }, ptr %env_raw, i32 0, i32 0
  store ptr %self_name4, ptr %cap_ptr, align 8
  %closure = alloca { ptr, ptr }, align 8
  %fn_slot = getelementptr inbounds nuw { ptr, ptr }, ptr %closure, i32 0, i32 0
  store ptr @Work__closure_1, ptr %fn_slot, align 8
  %env_slot = getelementptr inbounds nuw { ptr, ptr }, ptr %closure, i32 0, i32 1
  store ptr %env_raw, ptr %env_slot, align 8
  %closure_val = load { ptr, ptr }, ptr %closure, align 8
  %cls_split = alloca { ptr, ptr }, align 8
  store { ptr, ptr } %closure_val, ptr %cls_split, align 8
  %cls_fn_ptr = getelementptr inbounds nuw { ptr, ptr }, ptr %cls_split, i32 0, i32 0
  %fn_ptr = load ptr, ptr %cls_fn_ptr, align 8
  %cls_env_ptr = getelementptr inbounds nuw { ptr, ptr }, ptr %cls_split, i32 0, i32 1
  %env_ptr = load ptr, ptr %cls_env_ptr, align 8
  %call5 = call ptr @mesh_list_filter(ptr %call3, ptr %fn_ptr, ptr %env_ptr)
  store ptr %call5, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %call6 = call ptr @mesh_list_new()
  store ptr %call6, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  store ptr %if_val, ptr %peers, align 8
  %self_name7 = load ptr, ptr %self_name, align 8
  %peers8 = load ptr, ptr %peers, align 8
  %call9 = call %TargetSelection.3 @route_selection(ptr %self_name7, ptr %peers8)
  call void @mesh_reduction_check()
  ret %TargetSelection.3 %call9
}

define {} @__actor_execute_work_body(ptr %0, ptr %1, ptr %2) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %1, ptr %attempt_id, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %2, ptr %ingress_node, align 8
  %execution_node = alloca ptr, align 8
  %call = call ptr @Work__effective_work_node_name()
  call void @mesh_reduction_check()
  store ptr %call, ptr %execution_node, align 8
  %str = call ptr @mesh_string_new(ptr @.str.259, i64 42)
  %request_key1 = load ptr, ptr %request_key, align 8
  %call2 = call ptr @mesh_string_concat(ptr %str, ptr %request_key1)
  %str3 = call ptr @mesh_string_new(ptr @.str.260, i64 12)
  %call4 = call ptr @mesh_string_concat(ptr %call2, ptr %str3)
  %attempt_id5 = load ptr, ptr %attempt_id, align 8
  %call6 = call ptr @mesh_string_concat(ptr %call4, ptr %attempt_id5)
  %str7 = call ptr @mesh_string_new(ptr @.str.261, i64 11)
  %call8 = call ptr @mesh_string_concat(ptr %call6, ptr %str7)
  %execution_node9 = load ptr, ptr %execution_node, align 8
  %call10 = call ptr @mesh_string_concat(ptr %call8, ptr %execution_node9)
  call void @mesh_println(ptr %call10)
  %registry_pid = alloca i64, align 8
  %ingress_node11 = load ptr, ptr %ingress_node, align 8
  %call12 = call i64 @Work__request_registry_pid_for_node(ptr %ingress_node11)
  call void @mesh_reduction_check()
  store i64 %call12, ptr %registry_pid, align 8
  %registry_pid13 = load i64, ptr %registry_pid, align 8
  %request_key14 = load ptr, ptr %request_key, align 8
  %attempt_id15 = load ptr, ptr %attempt_id, align 8
  %execution_node16 = load ptr, ptr %execution_node, align 8
  %call17 = call {} @__service_workrequestregistry_cast_mark_completed(i64 %registry_pid13, ptr %request_key14, ptr %attempt_id15, ptr %execution_node16)
  call void @mesh_reduction_check()
  ret {} zeroinitializer
}

define {} @execute_work(ptr %0) {
entry:
  %__args_ptr = alloca ptr, align 8
  store ptr %0, ptr %__args_ptr, align 8
  %args_ptr_val = load ptr, ptr %__args_ptr, align 8
  %arg_ptr_0 = getelementptr [3 x i64], ptr %args_ptr_val, i32 0, i32 0
  %arg_raw_0 = load i64, ptr %arg_ptr_0, align 8
  %arg_ptr_01 = inttoptr i64 %arg_raw_0 to ptr
  %arg_ptr_1 = getelementptr [3 x i64], ptr %args_ptr_val, i32 0, i32 1
  %arg_raw_1 = load i64, ptr %arg_ptr_1, align 8
  %arg_ptr_12 = inttoptr i64 %arg_raw_1 to ptr
  %arg_ptr_2 = getelementptr [3 x i64], ptr %args_ptr_val, i32 0, i32 2
  %arg_raw_2 = load i64, ptr %arg_ptr_2, align 8
  %arg_ptr_23 = inttoptr i64 %arg_raw_2 to ptr
  %body_call = call {} @__actor_execute_work_body(ptr %arg_ptr_01, ptr %arg_ptr_12, ptr %arg_ptr_23)
  ret {} zeroinitializer
}

define i64 @Work__dispatch_work(ptr %0, i1 %1, ptr %2, ptr %3, ptr %4) {
entry:
  %target_node = alloca ptr, align 8
  store ptr %0, ptr %target_node, align 8
  %routed_remotely = alloca i1, align 1
  store i1 %1, ptr %routed_remotely, align 1
  %request_key = alloca ptr, align 8
  store ptr %2, ptr %request_key, align 8
  %attempt_id = alloca ptr, align 8
  store ptr %3, ptr %attempt_id, align 8
  %ingress_node = alloca ptr, align 8
  store ptr %4, ptr %ingress_node, align 8
  %routed_remotely1 = load i1, ptr %routed_remotely, align 1
  %if_result = alloca i64, align 8
  br i1 %routed_remotely1, label %then, label %else

then:                                             ; preds = %entry
  %target_node2 = load ptr, ptr %target_node, align 8
  %request_key3 = load ptr, ptr %request_key, align 8
  %attempt_id4 = load ptr, ptr %attempt_id, align 8
  %ingress_node5 = load ptr, ptr %ingress_node, align 8
  %target_node6 = load ptr, ptr %target_node, align 8
  %str_len = load i64, ptr %target_node6, align 8
  %str_data = getelementptr i8, ptr %target_node6, i64 8
  %request_key7 = load ptr, ptr %request_key, align 8
  %attempt_id8 = load ptr, ptr %attempt_id, align 8
  %ingress_node9 = load ptr, ptr %ingress_node, align 8
  %spawn_args = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  %arg_int = ptrtoint ptr %request_key7 to i64
  %arg_ptr = getelementptr [3 x i64], ptr %spawn_args, i32 0, i32 0
  store i64 %arg_int, ptr %arg_ptr, align 8
  %arg_int10 = ptrtoint ptr %attempt_id8 to i64
  %arg_ptr11 = getelementptr [3 x i64], ptr %spawn_args, i32 0, i32 1
  store i64 %arg_int10, ptr %arg_ptr11, align 8
  %arg_int12 = ptrtoint ptr %ingress_node9 to i64
  %arg_ptr13 = getelementptr [3 x i64], ptr %spawn_args, i32 0, i32 2
  store i64 %arg_int12, ptr %arg_ptr13, align 8
  %remote_pid = call i64 @mesh_node_spawn(ptr %str_data, i64 %str_len, ptr @spawn_fn_name, i64 12, ptr %spawn_args, i64 24, i8 0)
  store i64 %remote_pid, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %request_key14 = load ptr, ptr %request_key, align 8
  %attempt_id15 = load ptr, ptr %attempt_id, align 8
  %ingress_node16 = load ptr, ptr %ingress_node, align 8
  %spawn_args17 = call ptr @mesh_gc_alloc_actor(i64 24, i64 8)
  %arg_int18 = ptrtoint ptr %request_key14 to i64
  store i64 %arg_int18, ptr %spawn_args17, align 8
  %arg_ptr_1 = getelementptr i8, ptr %spawn_args17, i64 8
  %arg_int19 = ptrtoint ptr %attempt_id15 to i64
  store i64 %arg_int19, ptr %arg_ptr_1, align 8
  %arg_ptr_2 = getelementptr i8, ptr %spawn_args17, i64 16
  %arg_int20 = ptrtoint ptr %ingress_node16 to i64
  store i64 %arg_int20, ptr %arg_ptr_2, align 8
  %pid = call i64 @mesh_actor_spawn(ptr @execute_work, ptr %spawn_args17, i64 24, i8 1)
  store i64 %pid, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load i64, ptr %if_result, align 8
  ret i64 0
}

define i64 @start_work_services() {
entry:
  %request_registry_pid = alloca i64, align 8
  %call = call i64 @__service_workrequestregistry_start()
  call void @mesh_reduction_check()
  store i64 %call, ptr %request_registry_pid, align 8
  %call1 = call ptr @Work__local_request_registry_name()
  call void @mesh_reduction_check()
  %request_registry_pid2 = load i64, ptr %request_registry_pid, align 8
  %call3 = call i64 @mesh_process_register(ptr %call1, i64 %request_registry_pid2)
  %request_registry_pid4 = load i64, ptr %request_registry_pid, align 8
  %call5 = call i64 @Work__register_global_request_registry(i64 %request_registry_pid4)
  call void @mesh_reduction_check()
  %str = call ptr @mesh_string_new(ptr @.str.262, i64 53)
  %call6 = call ptr @Work__local_request_registry_name()
  call void @mesh_reduction_check()
  %call7 = call ptr @mesh_string_concat(ptr %str, ptr %call6)
  %str8 = call ptr @mesh_string_new(ptr @.str.263, i64 6)
  %call9 = call ptr @mesh_string_concat(ptr %call7, ptr %str8)
  %call10 = call ptr @Work__effective_work_node_name()
  call void @mesh_reduction_check()
  %call11 = call ptr @mesh_string_concat(ptr %call9, ptr %call10)
  call void @mesh_println(ptr %call11)
  ret i64 0
}

define ptr @Work__handle_valid_submit(%WorkSubmitBody.4 %0) {
entry:
  %submit = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %0, ptr %submit, align 8
  %selection = alloca %TargetSelection.3, align 8
  %call = call %TargetSelection.3 @Work__current_target_selection()
  call void @mesh_reduction_check()
  store %TargetSelection.3 %call, ptr %selection, align 8
  %membership = alloca ptr, align 8
  %selection1 = load %TargetSelection.3, ptr %selection, align 8
  %call2 = call ptr @selection_membership(%TargetSelection.3 %selection1)
  call void @mesh_reduction_check()
  store ptr %call2, ptr %membership, align 8
  %ingress_node = alloca ptr, align 8
  %membership3 = load ptr, ptr %membership, align 8
  %selection4 = load %TargetSelection.3, ptr %selection, align 8
  %call5 = call i64 @selection_ingress_index(%TargetSelection.3 %selection4)
  call void @mesh_reduction_check()
  %call6 = call ptr @resolve_member_at(ptr %membership3, i64 %call5)
  call void @mesh_reduction_check()
  store ptr %call6, ptr %ingress_node, align 8
  %owner_node = alloca ptr, align 8
  %membership7 = load ptr, ptr %membership, align 8
  %selection8 = load %TargetSelection.3, ptr %selection, align 8
  %call9 = call i64 @selection_target_index(%TargetSelection.3 %selection8)
  call void @mesh_reduction_check()
  %call10 = call ptr @resolve_member_at(ptr %membership7, i64 %call9)
  call void @mesh_reduction_check()
  store ptr %call10, ptr %owner_node, align 8
  %routed_remotely = alloca i1, align 1
  %selection11 = load %TargetSelection.3, ptr %selection, align 8
  %call12 = call i1 @selection_routed_remotely(%TargetSelection.3 %selection11)
  call void @mesh_reduction_check()
  store i1 %call12, ptr %routed_remotely, align 1
  %fell_back_locally = alloca i1, align 1
  %selection13 = load %TargetSelection.3, ptr %selection, align 8
  %call14 = call i1 @selection_fell_back_locally(%TargetSelection.3 %selection13)
  call void @mesh_reduction_check()
  store i1 %call14, ptr %fell_back_locally, align 1
  %ingress_node15 = load ptr, ptr %ingress_node, align 8
  %str = call ptr @mesh_string_new(ptr @.str.264, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %ingress_node15, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca ptr, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %reason = alloca ptr, align 8
  %str16 = call ptr @mesh_string_new(ptr @.str.265, i64 24)
  store ptr %str16, ptr %reason, align 8
  %submit17 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit17, ptr %obj_tmp, align 8
  %field_ptr = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp, i32 0, i32 0
  %field_val = load ptr, ptr %field_ptr, align 8
  %ingress_node18 = load ptr, ptr %ingress_node, align 8
  %owner_node19 = load ptr, ptr %owner_node, align 8
  %routed_remotely20 = load i1, ptr %routed_remotely, align 1
  %reason21 = load ptr, ptr %reason, align 8
  %call22 = call {} @Work__log_invalid_selection(ptr %field_val, ptr %ingress_node18, ptr %owner_node19, i1 %routed_remotely20, ptr %reason21)
  call void @mesh_reduction_check()
  %submit23 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp24 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit23, ptr %obj_tmp24, align 8
  %field_ptr25 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp24, i32 0, i32 0
  %field_val26 = load ptr, ptr %field_ptr25, align 8
  %ingress_node27 = load ptr, ptr %ingress_node, align 8
  %owner_node28 = load ptr, ptr %owner_node, align 8
  %routed_remotely29 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally30 = load i1, ptr %fell_back_locally, align 1
  %reason31 = load ptr, ptr %reason, align 8
  %call32 = call ptr @Work__invalid_selection_payload_json(ptr %field_val26, ptr %ingress_node27, ptr %owner_node28, i1 %routed_remotely29, i1 %fell_back_locally30, ptr %reason31)
  call void @mesh_reduction_check()
  %call33 = call ptr @mesh_http_response_new(i64 500, ptr %call32)
  store ptr %call33, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %owner_node34 = load ptr, ptr %owner_node, align 8
  %str35 = call ptr @mesh_string_new(ptr @.str.266, i64 0)
  %str_eq36 = call i8 @mesh_string_eq(ptr %owner_node34, ptr %str35)
  %str_eq_bool37 = icmp ne i8 %str_eq36, 0
  %if_result38 = alloca ptr, align 8
  br i1 %str_eq_bool37, label %then39, label %else40

if_merge:                                         ; preds = %if_merge41, %then
  %if_val121 = load ptr, ptr %if_result, align 8
  ret ptr %if_val121

then39:                                           ; preds = %else
  %reason42 = alloca ptr, align 8
  %str43 = call ptr @mesh_string_new(ptr @.str.267, i64 24)
  store ptr %str43, ptr %reason42, align 8
  %submit44 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp45 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit44, ptr %obj_tmp45, align 8
  %field_ptr46 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp45, i32 0, i32 0
  %field_val47 = load ptr, ptr %field_ptr46, align 8
  %ingress_node48 = load ptr, ptr %ingress_node, align 8
  %owner_node49 = load ptr, ptr %owner_node, align 8
  %routed_remotely50 = load i1, ptr %routed_remotely, align 1
  %reason51 = load ptr, ptr %reason42, align 8
  %call52 = call {} @Work__log_invalid_selection(ptr %field_val47, ptr %ingress_node48, ptr %owner_node49, i1 %routed_remotely50, ptr %reason51)
  call void @mesh_reduction_check()
  %submit53 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp54 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit53, ptr %obj_tmp54, align 8
  %field_ptr55 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp54, i32 0, i32 0
  %field_val56 = load ptr, ptr %field_ptr55, align 8
  %ingress_node57 = load ptr, ptr %ingress_node, align 8
  %owner_node58 = load ptr, ptr %owner_node, align 8
  %routed_remotely59 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally60 = load i1, ptr %fell_back_locally, align 1
  %reason61 = load ptr, ptr %reason42, align 8
  %call62 = call ptr @Work__invalid_selection_payload_json(ptr %field_val56, ptr %ingress_node57, ptr %owner_node58, i1 %routed_remotely59, i1 %fell_back_locally60, ptr %reason61)
  call void @mesh_reduction_check()
  %call63 = call ptr @mesh_http_response_new(i64 500, ptr %call62)
  store ptr %call63, ptr %if_result38, align 8
  br label %if_merge41

else40:                                           ; preds = %else
  %registry_pid = alloca i64, align 8
  %call64 = call i64 @Work__local_request_registry_pid()
  call void @mesh_reduction_check()
  store i64 %call64, ptr %registry_pid, align 8
  %registry_response = alloca ptr, align 8
  %registry_pid65 = load i64, ptr %registry_pid, align 8
  %submit66 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp67 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit66, ptr %obj_tmp67, align 8
  %field_ptr68 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp67, i32 0, i32 0
  %field_val69 = load ptr, ptr %field_ptr68, align 8
  %submit70 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp71 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit70, ptr %obj_tmp71, align 8
  %field_ptr72 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp71, i32 0, i32 1
  %field_val73 = load ptr, ptr %field_ptr72, align 8
  %call74 = call ptr @Work__payload_hash(ptr %field_val73)
  call void @mesh_reduction_check()
  %ingress_node75 = load ptr, ptr %ingress_node, align 8
  %owner_node76 = load ptr, ptr %owner_node, align 8
  %str77 = call ptr @mesh_string_new(ptr @.str.268, i64 0)
  %routed_remotely78 = load i1, ptr %routed_remotely, align 1
  %fell_back_locally79 = load i1, ptr %fell_back_locally, align 1
  %call80 = call ptr @__service_workrequestregistry_call_submit(i64 %registry_pid65, ptr %field_val69, ptr %call74, ptr %ingress_node75, ptr %owner_node76, ptr %str77, i1 %routed_remotely78, i1 %fell_back_locally79)
  call void @mesh_reduction_check()
  store ptr %call80, ptr %registry_response, align 8
  %kind = alloca ptr, align 8
  %registry_response81 = load ptr, ptr %registry_response, align 8
  %call82 = call ptr @Work__registry_message_kind(ptr %registry_response81)
  call void @mesh_reduction_check()
  store ptr %call82, ptr %kind, align 8
  %response_json = alloca ptr, align 8
  %registry_response83 = load ptr, ptr %registry_response, align 8
  %call84 = call ptr @Work__registry_message_json(ptr %registry_response83)
  call void @mesh_reduction_check()
  store ptr %call84, ptr %response_json, align 8
  %kind85 = load ptr, ptr %kind, align 8
  %str86 = call ptr @mesh_string_new(ptr @.str.269, i64 7)
  %str_eq87 = call i8 @mesh_string_eq(ptr %kind85, ptr %str86)
  %str_eq_bool88 = icmp ne i8 %str_eq87, 0
  %if_result89 = alloca ptr, align 8
  br i1 %str_eq_bool88, label %then90, label %else91

if_merge41:                                       ; preds = %if_merge92, %then39
  %if_val120 = load ptr, ptr %if_result38, align 8
  store ptr %if_val120, ptr %if_result, align 8
  br label %if_merge

then90:                                           ; preds = %else40
  %attempt_id = alloca ptr, align 8
  %response_json93 = load ptr, ptr %response_json, align 8
  %str94 = call ptr @mesh_string_new(ptr @.str.270, i64 10)
  %call95 = call ptr @mesh_json_get(ptr %response_json93, ptr %str94)
  store ptr %call95, ptr %attempt_id, align 8
  %_ = alloca i64, align 8
  %owner_node96 = load ptr, ptr %owner_node, align 8
  %routed_remotely97 = load i1, ptr %routed_remotely, align 1
  %submit98 = load %WorkSubmitBody.4, ptr %submit, align 8
  %obj_tmp99 = alloca %WorkSubmitBody.4, align 8
  store %WorkSubmitBody.4 %submit98, ptr %obj_tmp99, align 8
  %field_ptr100 = getelementptr inbounds nuw %WorkSubmitBody.4, ptr %obj_tmp99, i32 0, i32 0
  %field_val101 = load ptr, ptr %field_ptr100, align 8
  %attempt_id102 = load ptr, ptr %attempt_id, align 8
  %ingress_node103 = load ptr, ptr %ingress_node, align 8
  %call104 = call i64 @Work__dispatch_work(ptr %owner_node96, i1 %routed_remotely97, ptr %field_val101, ptr %attempt_id102, ptr %ingress_node103)
  call void @mesh_reduction_check()
  store i64 %call104, ptr %_, align 8
  %response_json105 = load ptr, ptr %response_json, align 8
  %call106 = call ptr @mesh_http_response_new(i64 200, ptr %response_json105)
  store ptr %call106, ptr %if_result89, align 8
  br label %if_merge92

else91:                                           ; preds = %else40
  %kind107 = load ptr, ptr %kind, align 8
  %str108 = call ptr @mesh_string_new(ptr @.str.271, i64 9)
  %str_eq109 = call i8 @mesh_string_eq(ptr %kind107, ptr %str108)
  %str_eq_bool110 = icmp ne i8 %str_eq109, 0
  %if_result111 = alloca ptr, align 8
  br i1 %str_eq_bool110, label %then112, label %else113

if_merge92:                                       ; preds = %if_merge114, %then90
  %if_val119 = load ptr, ptr %if_result89, align 8
  store ptr %if_val119, ptr %if_result38, align 8
  br label %if_merge41

then112:                                          ; preds = %else91
  %response_json115 = load ptr, ptr %response_json, align 8
  %call116 = call ptr @mesh_http_response_new(i64 200, ptr %response_json115)
  store ptr %call116, ptr %if_result111, align 8
  br label %if_merge114

else113:                                          ; preds = %else91
  %response_json117 = load ptr, ptr %response_json, align 8
  %call118 = call ptr @mesh_http_response_new(i64 409, ptr %response_json117)
  store ptr %call118, ptr %if_result111, align 8
  br label %if_merge114

if_merge114:                                      ; preds = %else113, %then112
  %if_val = load ptr, ptr %if_result111, align 8
  store ptr %if_val, ptr %if_result89, align 8
  br label %if_merge92
}

define ptr @Work__handle_valid_status(ptr %0) {
entry:
  %request_key = alloca ptr, align 8
  store ptr %0, ptr %request_key, align 8
  %registry_response = alloca ptr, align 8
  %call = call i64 @Work__local_request_registry_pid()
  call void @mesh_reduction_check()
  %request_key1 = load ptr, ptr %request_key, align 8
  %call2 = call ptr @__service_workrequestregistry_call_get_status(i64 %call, ptr %request_key1)
  call void @mesh_reduction_check()
  store ptr %call2, ptr %registry_response, align 8
  %kind = alloca ptr, align 8
  %registry_response3 = load ptr, ptr %registry_response, align 8
  %call4 = call ptr @Work__registry_message_kind(ptr %registry_response3)
  call void @mesh_reduction_check()
  store ptr %call4, ptr %kind, align 8
  %response_json = alloca ptr, align 8
  %registry_response5 = load ptr, ptr %registry_response, align 8
  %call6 = call ptr @Work__registry_message_json(ptr %registry_response5)
  call void @mesh_reduction_check()
  store ptr %call6, ptr %response_json, align 8
  %kind7 = load ptr, ptr %kind, align 8
  %str = call ptr @mesh_string_new(ptr @.str.272, i64 7)
  %str_eq = call i8 @mesh_string_eq(ptr %kind7, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca ptr, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %response_json8 = load ptr, ptr %response_json, align 8
  %call9 = call ptr @mesh_http_response_new(i64 404, ptr %response_json8)
  store ptr %call9, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %response_json10 = load ptr, ptr %response_json, align 8
  %call11 = call ptr @mesh_http_response_new(i64 200, ptr %response_json10)
  store ptr %call11, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define ptr @handle_work_submit(ptr %0) {
entry:
  %reason = alloca ptr, align 8
  %submit = alloca %WorkSubmitBody.4, align 8
  %request = alloca ptr, align 8
  store ptr %0, ptr %request, align 8
  %body = alloca ptr, align 8
  %request1 = load ptr, ptr %request, align 8
  %call = call ptr @mesh_http_request_body(ptr %request1)
  store ptr %call, ptr %body, align 8
  %body2 = load ptr, ptr %body, align 8
  %call3 = call { i8, ptr } @parse_submit_body(ptr %body2)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call3, ptr %scrutinee, align 8
  %match_result = alloca ptr, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

match_merge:                                      ; preds = %case_Err, %case_Ok
  %match_val = load ptr, ptr %match_result, align 8
  ret ptr %match_val

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.274, i64 30, ptr @.panic_file.275, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  %deref_struct = load %WorkSubmitBody.4, ptr %path_val, align 8
  store %WorkSubmitBody.4 %deref_struct, ptr %submit, align 8
  %submit4 = load %WorkSubmitBody.4, ptr %submit, align 8
  %call5 = call ptr @Work__handle_valid_submit(%WorkSubmitBody.4 %submit4)
  call void @mesh_reduction_check()
  store ptr %call5, ptr %match_result, align 8
  br label %match_merge

case_Err:                                         ; preds = %entry
  %variant_field6 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val7 = load ptr, ptr %variant_field6, align 8
  store ptr %path_val7, ptr %reason, align 8
  %str = call ptr @mesh_string_new(ptr @.str.273, i64 0)
  %reason8 = load ptr, ptr %reason, align 8
  %call9 = call ptr @Work__invalid_request_payload_json(ptr %str, ptr %reason8)
  call void @mesh_reduction_check()
  %call10 = call ptr @mesh_http_response_new(i64 400, ptr %call9)
  store ptr %call10, ptr %match_result, align 8
  br label %match_merge
}

define ptr @handle_work_status(ptr %0) {
entry:
  %reason = alloca ptr, align 8
  %request_key = alloca ptr, align 8
  %value = alloca ptr, align 8
  %request = alloca ptr, align 8
  store ptr %0, ptr %request, align 8
  %raw_request_key = alloca ptr, align 8
  %request1 = load ptr, ptr %request, align 8
  %str = call ptr @mesh_string_new(ptr @.str.276, i64 11)
  %call = call ptr @mesh_http_request_param(ptr %request1, ptr %str)
  %match_result = alloca ptr, align 8
  %tag_ptr = getelementptr inbounds nuw { i8, ptr }, ptr %call, i32 0, i32 0
  %tag = load i8, ptr %tag_ptr, align 1
  switch i8 %tag, label %switch_default [
    i8 0, label %case_Some
    i8 1, label %case_None
  ]

match_merge:                                      ; preds = %case_None, %case_Some
  %match_val = load ptr, ptr %match_result, align 8
  store ptr %match_val, ptr %raw_request_key, align 8
  %raw_request_key4 = load ptr, ptr %raw_request_key, align 8
  %call5 = call { i8, ptr } @validate_request_key(ptr %raw_request_key4)
  call void @mesh_reduction_check()
  %scrutinee = alloca { i8, ptr }, align 8
  store { i8, ptr } %call5, ptr %scrutinee, align 8
  %match_result6 = alloca ptr, align 8
  %tag_ptr8 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 0
  %tag9 = load i8, ptr %tag_ptr8, align 1
  switch i8 %tag9, label %switch_default10 [
    i8 0, label %case_Ok
    i8 1, label %case_Err
  ]

switch_default:                                   ; preds = %entry
  call void @mesh_panic(ptr @.panic_msg.278, i64 30, ptr @.panic_file.279, i64 9, i32 0)
  unreachable

case_Some:                                        ; preds = %entry
  %variant_field = getelementptr inbounds nuw { i8, ptr }, ptr %call, i32 0, i32 1
  %path_val = load ptr, ptr %variant_field, align 8
  store ptr %path_val, ptr %value, align 8
  %value2 = load ptr, ptr %value, align 8
  store ptr %value2, ptr %match_result, align 8
  br label %match_merge

case_None:                                        ; preds = %entry
  %str3 = call ptr @mesh_string_new(ptr @.str.277, i64 0)
  store ptr %str3, ptr %match_result, align 8
  br label %match_merge

match_merge7:                                     ; preds = %case_Err, %case_Ok
  %match_val21 = load ptr, ptr %match_result6, align 8
  ret ptr %match_val21

switch_default10:                                 ; preds = %match_merge
  call void @mesh_panic(ptr @.panic_msg.281, i64 30, ptr @.panic_file.282, i64 9, i32 0)
  unreachable

case_Ok:                                          ; preds = %match_merge
  %variant_field11 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val12 = load ptr, ptr %variant_field11, align 8
  store ptr %path_val12, ptr %request_key, align 8
  %request_key13 = load ptr, ptr %request_key, align 8
  %call14 = call ptr @Work__handle_valid_status(ptr %request_key13)
  call void @mesh_reduction_check()
  store ptr %call14, ptr %match_result6, align 8
  br label %match_merge7

case_Err:                                         ; preds = %match_merge
  %variant_field15 = getelementptr inbounds nuw { i8, ptr }, ptr %scrutinee, i32 0, i32 1
  %path_val16 = load ptr, ptr %variant_field15, align 8
  store ptr %path_val16, ptr %reason, align 8
  %str17 = call ptr @mesh_string_new(ptr @.str.280, i64 0)
  %reason18 = load ptr, ptr %reason, align 8
  %call19 = call ptr @Work__invalid_request_payload_json(ptr %str17, ptr %reason18)
  call void @mesh_reduction_check()
  %call20 = call ptr @mesh_http_response_new(i64 400, ptr %call19)
  store ptr %call20, ptr %match_result6, align 8
  br label %match_merge7
}

define {} @Main__log_config_error(ptr %0) {
entry:
  %message = alloca ptr, align 8
  store ptr %0, ptr %message, align 8
  %str = call ptr @mesh_string_new(ptr @.str.283, i64 30)
  %message1 = load ptr, ptr %message, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %message1)
  call void @mesh_println(ptr %call)
  ret {} zeroinitializer
}

define ptr @Main__current_mode() {
entry:
  %cluster_cookie = alloca ptr, align 8
  %str = call ptr @mesh_string_new(ptr @.str.284, i64 20)
  %str1 = call ptr @mesh_string_new(ptr @.str.285, i64 0)
  %call = call ptr @mesh_env_get_with_default(ptr %str, ptr %str1)
  store ptr %call, ptr %cluster_cookie, align 8
  %cluster_cookie2 = load ptr, ptr %cluster_cookie, align 8
  %str3 = call ptr @mesh_string_new(ptr @.str.286, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %cluster_cookie2, ptr %str3)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca ptr, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %str4 = call ptr @mesh_string_new(ptr @.str.287, i64 10)
  store ptr %str4, ptr %if_result, align 8
  br label %if_merge

else:                                             ; preds = %entry
  %str5 = call ptr @mesh_string_new(ptr @.str.288, i64 7)
  store ptr %str5, ptr %if_result, align 8
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load ptr, ptr %if_result, align 8
  ret ptr %if_val
}

define i64 @Main__current_http_port() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.289, i64 4)
  %call = call i64 @mesh_env_get_int(ptr %str, i64 8080)
  ret i64 %call
}

define i64 @Main__current_cluster_port() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.290, i64 17)
  %call = call i64 @mesh_env_get_int(ptr %str, i64 4370)
  ret i64 %call
}

define ptr @Main__current_discovery_seed() {
entry:
  %str = call ptr @mesh_string_new(ptr @.str.291, i64 19)
  %str1 = call ptr @mesh_string_new(ptr @.str.292, i64 0)
  %call = call ptr @mesh_env_get_with_default(ptr %str, ptr %str1)
  ret ptr %call
}

define ptr @Main__handle_membership(ptr %0) {
entry:
  %request = alloca ptr, align 8
  store ptr %0, ptr %request, align 8
  %call = call ptr @Main__current_mode()
  call void @mesh_reduction_check()
  %call1 = call i64 @Main__current_http_port()
  call void @mesh_reduction_check()
  %call2 = call i64 @Main__current_cluster_port()
  call void @mesh_reduction_check()
  %call3 = call ptr @Main__current_discovery_seed()
  call void @mesh_reduction_check()
  %call4 = call ptr @membership_payload(ptr %call, i64 %call1, i64 %call2, ptr %call3)
  call void @mesh_reduction_check()
  %call5 = call ptr @mesh_http_response_new(i64 200, ptr %call4)
  ret ptr %call5
}

define {} @Main__start_http_server(i64 %0) {
entry:
  %http_port_value = alloca i64, align 8
  store i64 %0, ptr %http_port_value, align 8
  %call = call i64 @start_work_services()
  call void @mesh_reduction_check()
  %router = alloca ptr, align 8
  %call1 = call ptr @mesh_http_router()
  %str = call ptr @mesh_string_new(ptr @.str.293, i64 11)
  %call2 = call ptr @mesh_http_route_get(ptr %call1, ptr %str, ptr @Main__handle_membership)
  %str3 = call ptr @mesh_string_new(ptr @.str.294, i64 5)
  %call4 = call ptr @mesh_http_route_post(ptr %call2, ptr %str3, ptr @handle_work_submit)
  %str5 = call ptr @mesh_string_new(ptr @.str.295, i64 18)
  %call6 = call ptr @mesh_http_route_get(ptr %call4, ptr %str5, ptr @handle_work_status)
  store ptr %call6, ptr %router, align 8
  %str7 = call ptr @mesh_string_new(ptr @.str.296, i64 41)
  %http_port_value8 = load i64, ptr %http_port_value, align 8
  %call9 = call ptr @mesh_int_to_string(i64 %http_port_value8)
  %call10 = call ptr @mesh_string_concat(ptr %str7, ptr %call9)
  call void @mesh_println(ptr %call10)
  %router11 = load ptr, ptr %router, align 8
  %http_port_value12 = load i64, ptr %http_port_value, align 8
  call void @mesh_http_serve(ptr %router11, i64 %http_port_value12)
  ret {} zeroinitializer
}

define {} @Main__start_standalone(i64 %0, i64 %1) {
entry:
  %http_port_value = alloca i64, align 8
  store i64 %0, ptr %http_port_value, align 8
  %cluster_port_value = alloca i64, align 8
  store i64 %1, ptr %cluster_port_value, align 8
  %str = call ptr @mesh_string_new(ptr @.str.297, i64 56)
  %http_port_value1 = load i64, ptr %http_port_value, align 8
  %call = call ptr @mesh_int_to_string(i64 %http_port_value1)
  %call2 = call ptr @mesh_string_concat(ptr %str, ptr %call)
  %str3 = call ptr @mesh_string_new(ptr @.str.298, i64 14)
  %call4 = call ptr @mesh_string_concat(ptr %call2, ptr %str3)
  %cluster_port_value5 = load i64, ptr %cluster_port_value, align 8
  %call6 = call ptr @mesh_int_to_string(i64 %cluster_port_value5)
  %call7 = call ptr @mesh_string_concat(ptr %call4, ptr %call6)
  %str8 = call ptr @mesh_string_new(ptr @.str.299, i64 40)
  %call9 = call ptr @mesh_string_concat(ptr %call7, ptr %str8)
  call void @mesh_println(ptr %call9)
  %http_port_value10 = load i64, ptr %http_port_value, align 8
  %call11 = call {} @Main__start_http_server(i64 %http_port_value10)
  call void @mesh_reduction_check()
  ret {} zeroinitializer
}

define {} @Main__start_cluster(i64 %0, i64 %1, ptr %2, ptr %3, ptr %4) {
entry:
  %http_port_value = alloca i64, align 8
  store i64 %0, ptr %http_port_value, align 8
  %cluster_port_value = alloca i64, align 8
  store i64 %1, ptr %cluster_port_value, align 8
  %cluster_cookie = alloca ptr, align 8
  store ptr %2, ptr %cluster_cookie, align 8
  %discovery_seed_value = alloca ptr, align 8
  store ptr %3, ptr %discovery_seed_value, align 8
  %advertised_node_name = alloca ptr, align 8
  store ptr %4, ptr %advertised_node_name, align 8
  %str = call ptr @mesh_string_new(ptr @.str.300, i64 48)
  %advertised_node_name1 = load ptr, ptr %advertised_node_name, align 8
  %call = call ptr @mesh_string_concat(ptr %str, ptr %advertised_node_name1)
  %str2 = call ptr @mesh_string_new(ptr @.str.301, i64 11)
  %call3 = call ptr @mesh_string_concat(ptr %call, ptr %str2)
  %http_port_value4 = load i64, ptr %http_port_value, align 8
  %call5 = call ptr @mesh_int_to_string(i64 %http_port_value4)
  %call6 = call ptr @mesh_string_concat(ptr %call3, ptr %call5)
  %str7 = call ptr @mesh_string_new(ptr @.str.302, i64 14)
  %call8 = call ptr @mesh_string_concat(ptr %call6, ptr %str7)
  %cluster_port_value9 = load i64, ptr %cluster_port_value, align 8
  %call10 = call ptr @mesh_int_to_string(i64 %cluster_port_value9)
  %call11 = call ptr @mesh_string_concat(ptr %call8, ptr %call10)
  %str12 = call ptr @mesh_string_new(ptr @.str.303, i64 39)
  %call13 = call ptr @mesh_string_concat(ptr %call11, ptr %str12)
  %discovery_seed_value14 = load ptr, ptr %discovery_seed_value, align 8
  %call15 = call ptr @mesh_string_concat(ptr %call13, ptr %discovery_seed_value14)
  call void @mesh_println(ptr %call15)
  %start_result = alloca i64, align 8
  %advertised_node_name16 = load ptr, ptr %advertised_node_name, align 8
  %cluster_cookie17 = load ptr, ptr %cluster_cookie, align 8
  %advertised_node_name18 = load ptr, ptr %advertised_node_name, align 8
  %cluster_cookie19 = load ptr, ptr %cluster_cookie, align 8
  %str_len = load i64, ptr %advertised_node_name18, align 8
  %str_data = getelementptr i8, ptr %advertised_node_name18, i64 8
  %str_len20 = load i64, ptr %cluster_cookie19, align 8
  %str_data21 = getelementptr i8, ptr %cluster_cookie19, i64 8
  %node_start = call i64 @mesh_node_start(ptr %str_data, i64 %str_len, ptr %str_data21, i64 %str_len20)
  store i64 %node_start, ptr %start_result, align 8
  %start_result22 = load i64, ptr %start_result, align 8
  %eq = icmp eq i64 %start_result22, 0
  %if_result = alloca {}, align 8
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  %str23 = call ptr @mesh_string_new(ptr @.str.304, i64 30)
  %advertised_node_name24 = load ptr, ptr %advertised_node_name, align 8
  %call25 = call ptr @mesh_string_concat(ptr %str23, ptr %advertised_node_name24)
  call void @mesh_println(ptr %call25)
  %http_port_value26 = load i64, ptr %http_port_value, align 8
  %call27 = call {} @Main__start_http_server(i64 %http_port_value26)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %str28 = call ptr @mesh_string_new(ptr @.str.305, i64 39)
  %advertised_node_name29 = load ptr, ptr %advertised_node_name, align 8
  %call30 = call ptr @mesh_string_concat(ptr %str28, ptr %advertised_node_name29)
  %str31 = call ptr @mesh_string_new(ptr @.str.306, i64 6)
  %call32 = call ptr @mesh_string_concat(ptr %call30, ptr %str31)
  %start_result33 = load i64, ptr %start_result, align 8
  %call34 = call ptr @mesh_int_to_string(i64 %start_result33)
  %call35 = call ptr @mesh_string_concat(ptr %call32, ptr %call34)
  call void @mesh_println(ptr %call35)
  store {} zeroinitializer, ptr %if_result, align 1
  br label %if_merge

if_merge:                                         ; preds = %else, %then
  %if_val = load {}, ptr %if_result, align 1
  ret {} zeroinitializer
}

define {} @Main__maybe_start_cluster(i64 %0, i64 %1, ptr %2) {
entry:
  %http_port_value = alloca i64, align 8
  store i64 %0, ptr %http_port_value, align 8
  %cluster_port_value = alloca i64, align 8
  store i64 %1, ptr %cluster_port_value, align 8
  %cluster_cookie = alloca ptr, align 8
  store ptr %2, ptr %cluster_cookie, align 8
  %discovery_seed_value = alloca ptr, align 8
  %call = call ptr @discovery_seed()
  call void @mesh_reduction_check()
  store ptr %call, ptr %discovery_seed_value, align 8
  %discovery_seed_value1 = load ptr, ptr %discovery_seed_value, align 8
  %str = call ptr @mesh_string_new(ptr @.str.307, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %discovery_seed_value1, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %if_result = alloca {}, align 8
  br i1 %str_eq_bool, label %then, label %else

then:                                             ; preds = %entry
  %call2 = call ptr @discovery_seed_key()
  call void @mesh_reduction_check()
  %call3 = call ptr @missing_required_env(ptr %call2)
  call void @mesh_reduction_check()
  %call4 = call {} @Main__log_config_error(ptr %call3)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %advertised_node_name = alloca ptr, align 8
  %cluster_port_value5 = load i64, ptr %cluster_port_value, align 8
  %call6 = call ptr @node_name(i64 %cluster_port_value5)
  call void @mesh_reduction_check()
  store ptr %call6, ptr %advertised_node_name, align 8
  %identity_error = alloca ptr, align 8
  %cluster_port_value7 = load i64, ptr %cluster_port_value, align 8
  %call8 = call ptr @node_name_error(i64 %cluster_port_value7)
  call void @mesh_reduction_check()
  store ptr %call8, ptr %identity_error, align 8
  %identity_error9 = load ptr, ptr %identity_error, align 8
  %str10 = call ptr @mesh_string_new(ptr @.str.308, i64 0)
  %str_eq11 = call i8 @mesh_string_eq(ptr %identity_error9, ptr %str10)
  %str_eq_bool12 = icmp ne i8 %str_eq11, 0
  %if_result13 = alloca {}, align 8
  br i1 %str_eq_bool12, label %then14, label %else15

if_merge:                                         ; preds = %if_merge16, %then
  %if_val25 = load {}, ptr %if_result, align 1
  ret {} zeroinitializer

then14:                                           ; preds = %else
  %http_port_value17 = load i64, ptr %http_port_value, align 8
  %cluster_port_value18 = load i64, ptr %cluster_port_value, align 8
  %cluster_cookie19 = load ptr, ptr %cluster_cookie, align 8
  %discovery_seed_value20 = load ptr, ptr %discovery_seed_value, align 8
  %advertised_node_name21 = load ptr, ptr %advertised_node_name, align 8
  %call22 = call {} @Main__start_cluster(i64 %http_port_value17, i64 %cluster_port_value18, ptr %cluster_cookie19, ptr %discovery_seed_value20, ptr %advertised_node_name21)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result13, align 1
  br label %if_merge16

else15:                                           ; preds = %else
  %identity_error23 = load ptr, ptr %identity_error, align 8
  %call24 = call {} @Main__log_config_error(ptr %identity_error23)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result13, align 1
  br label %if_merge16

if_merge16:                                       ; preds = %else15, %then14
  %if_val = load {}, ptr %if_result13, align 1
  store {} %if_val, ptr %if_result, align 1
  br label %if_merge
}

define {} @Main__maybe_start_with_mode(i64 %0, i64 %1) {
entry:
  %http_port_value = alloca i64, align 8
  store i64 %0, ptr %http_port_value, align 8
  %cluster_port_value = alloca i64, align 8
  store i64 %1, ptr %cluster_port_value, align 8
  %validation_error = alloca ptr, align 8
  %call = call ptr @mode_error()
  call void @mesh_reduction_check()
  store ptr %call, ptr %validation_error, align 8
  %validation_error1 = load ptr, ptr %validation_error, align 8
  %str = call ptr @mesh_string_new(ptr @.str.309, i64 0)
  %str_eq = call i8 @mesh_string_eq(ptr %validation_error1, ptr %str)
  %str_eq_bool = icmp ne i8 %str_eq, 0
  %str_neq = xor i1 %str_eq_bool, true
  %if_result = alloca {}, align 8
  br i1 %str_neq, label %then, label %else

then:                                             ; preds = %entry
  %validation_error2 = load ptr, ptr %validation_error, align 8
  %call3 = call {} @Main__log_config_error(ptr %validation_error2)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %configured_mode = alloca ptr, align 8
  %call4 = call ptr @mode()
  call void @mesh_reduction_check()
  store ptr %call4, ptr %configured_mode, align 8
  %configured_mode5 = load ptr, ptr %configured_mode, align 8
  %str6 = call ptr @mesh_string_new(ptr @.str.310, i64 10)
  %str_eq7 = call i8 @mesh_string_eq(ptr %configured_mode5, ptr %str6)
  %str_eq_bool8 = icmp ne i8 %str_eq7, 0
  %if_result9 = alloca {}, align 8
  br i1 %str_eq_bool8, label %then10, label %else11

if_merge:                                         ; preds = %if_merge12, %then
  %if_val20 = load {}, ptr %if_result, align 1
  ret {} zeroinitializer

then10:                                           ; preds = %else
  %http_port_value13 = load i64, ptr %http_port_value, align 8
  %cluster_port_value14 = load i64, ptr %cluster_port_value, align 8
  %call15 = call {} @Main__start_standalone(i64 %http_port_value13, i64 %cluster_port_value14)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result9, align 1
  br label %if_merge12

else11:                                           ; preds = %else
  %http_port_value16 = load i64, ptr %http_port_value, align 8
  %cluster_port_value17 = load i64, ptr %cluster_port_value, align 8
  %call18 = call ptr @cookie()
  call void @mesh_reduction_check()
  %call19 = call {} @Main__maybe_start_cluster(i64 %http_port_value16, i64 %cluster_port_value17, ptr %call18)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result9, align 1
  br label %if_merge12

if_merge12:                                       ; preds = %else11, %then10
  %if_val = load {}, ptr %if_result9, align 1
  store {} %if_val, ptr %if_result, align 1
  br label %if_merge
}

define {} @mesh_main() {
entry:
  %http_port_value = alloca i64, align 8
  %call = call i64 @http_port()
  call void @mesh_reduction_check()
  store i64 %call, ptr %http_port_value, align 8
  %http_port_value1 = load i64, ptr %http_port_value, align 8
  %le = icmp sle i64 %http_port_value1, 0
  %if_result = alloca {}, align 8
  br i1 %le, label %then, label %else

then:                                             ; preds = %entry
  %call2 = call ptr @http_port_key()
  call void @mesh_reduction_check()
  %call3 = call ptr @invalid_positive_int(ptr %call2)
  call void @mesh_reduction_check()
  %call4 = call {} @Main__log_config_error(ptr %call3)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result, align 1
  br label %if_merge

else:                                             ; preds = %entry
  %cluster_port_value = alloca i64, align 8
  %call5 = call i64 @cluster_port()
  call void @mesh_reduction_check()
  store i64 %call5, ptr %cluster_port_value, align 8
  %cluster_port_value6 = load i64, ptr %cluster_port_value, align 8
  %le7 = icmp sle i64 %cluster_port_value6, 0
  %if_result8 = alloca {}, align 8
  br i1 %le7, label %then9, label %else10

if_merge:                                         ; preds = %if_merge11, %then
  %if_val18 = load {}, ptr %if_result, align 1
  ret {} zeroinitializer

then9:                                            ; preds = %else
  %call12 = call ptr @cluster_port_key()
  call void @mesh_reduction_check()
  %call13 = call ptr @invalid_positive_int(ptr %call12)
  call void @mesh_reduction_check()
  %call14 = call {} @Main__log_config_error(ptr %call13)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result8, align 1
  br label %if_merge11

else10:                                           ; preds = %else
  %http_port_value15 = load i64, ptr %http_port_value, align 8
  %cluster_port_value16 = load i64, ptr %cluster_port_value, align 8
  %call17 = call {} @Main__maybe_start_with_mode(i64 %http_port_value15, i64 %cluster_port_value16)
  call void @mesh_reduction_check()
  store {} zeroinitializer, ptr %if_result8, align 1
  br label %if_merge11

if_merge11:                                       ; preds = %else10, %then9
  %if_val = load {}, ptr %if_result8, align 1
  store {} %if_val, ptr %if_result, align 1
  br label %if_merge
}

define i32 @main(i32 %0, ptr %1) {
entry:
  call void @mesh_rt_init()
  call void @mesh_rt_init_actor(i32 0)
  call void @mesh_register_function(ptr @fn_reg_ToJson__to_json__MembershipPayload, i64 34, ptr @ToJson__to_json__MembershipPayload)
  call void @mesh_register_function(ptr @fn_reg_membership_snapshot, i64 19, ptr @membership_snapshot)
  call void @mesh_register_function(ptr @fn_reg_current_self_name, i64 17, ptr @current_self_name)
  call void @mesh_register_function(ptr @fn_reg_current_membership, i64 18, ptr @current_membership)
  call void @mesh_register_function(ptr @fn_reg_membership_payload, i64 18, ptr @membership_payload)
  call void @mesh_register_function(ptr @fn_reg_http_port_key, i64 13, ptr @http_port_key)
  call void @mesh_register_function(ptr @fn_reg_cluster_port_key, i64 16, ptr @cluster_port_key)
  call void @mesh_register_function(ptr @fn_reg_cookie_key, i64 10, ptr @cookie_key)
  call void @mesh_register_function(ptr @fn_reg_discovery_seed_key, i64 18, ptr @discovery_seed_key)
  call void @mesh_register_function(ptr @fn_reg_node_basename_key, i64 17, ptr @node_basename_key)
  call void @mesh_register_function(ptr @fn_reg_advertise_host_key, i64 18, ptr @advertise_host_key)
  call void @mesh_register_function(ptr @fn_reg_missing_required_env, i64 20, ptr @missing_required_env)
  call void @mesh_register_function(ptr @fn_reg_invalid_positive_int, i64 20, ptr @invalid_positive_int)
  call void @mesh_register_function(ptr @fn_reg_cluster_cookie_required, i64 23, ptr @cluster_cookie_required)
  call void @mesh_register_function(ptr @fn_reg_explicit_identity_required, i64 26, ptr @explicit_identity_required)
  call void @mesh_register_function(ptr @fn_reg_fly_identity_required, i64 21, ptr @fly_identity_required)
  call void @mesh_register_function(ptr @fn_reg_missing_identity_source, i64 23, ptr @missing_identity_source)
  call void @mesh_register_function(ptr @fn_reg_Config__invalid_cluster_identity, i64 32, ptr @Config__invalid_cluster_identity)
  call void @mesh_register_function(ptr @fn_reg_Config__any_fly_identity_set, i64 28, ptr @Config__any_fly_identity_set)
  call void @mesh_register_function(ptr @fn_reg_Config__has_cluster_hint, i64 24, ptr @Config__has_cluster_hint)
  call void @mesh_register_function(ptr @fn_reg_Config__positive_env_int, i64 24, ptr @Config__positive_env_int)
  call void @mesh_register_function(ptr @fn_reg_Config__normalized_host_or_empty, i64 32, ptr @Config__normalized_host_or_empty)
  call void @mesh_register_function(ptr @fn_reg_Config__validated_basename_or_empty, i64 35, ptr @Config__validated_basename_or_empty)
  call void @mesh_register_function(ptr @fn_reg_Config__host_validation_error, i64 29, ptr @Config__host_validation_error)
  call void @mesh_register_function(ptr @fn_reg_http_port, i64 9, ptr @http_port)
  call void @mesh_register_function(ptr @fn_reg_cluster_port, i64 12, ptr @cluster_port)
  call void @mesh_register_function(ptr @fn_reg_cookie, i64 6, ptr @cookie)
  call void @mesh_register_function(ptr @fn_reg_discovery_seed, i64 14, ptr @discovery_seed)
  call void @mesh_register_function(ptr @fn_reg_mode, i64 4, ptr @mode)
  call void @mesh_register_function(ptr @fn_reg_mode_error, i64 10, ptr @mode_error)
  call void @mesh_register_function(ptr @fn_reg_node_name, i64 9, ptr @node_name)
  call void @mesh_register_function(ptr @fn_reg_node_name_error, i64 15, ptr @node_name_error)
  call void @mesh_register_function(ptr @fn_reg_FromJson__from_json__WorkSubmitBody, i64 35, ptr @FromJson__from_json__WorkSubmitBody)
  call void @mesh_register_function(ptr @fn_reg_ToJson__to_json__WorkStatusPayload, i64 34, ptr @ToJson__to_json__WorkStatusPayload)
  call void @mesh_register_function(ptr @fn_reg_Work__build_membership, i64 22, ptr @Work__build_membership)
  call void @mesh_register_function(ptr @fn_reg_Work__find_index, i64 16, ptr @Work__find_index)
  call void @mesh_register_function(ptr @fn_reg_Work__find_first_peer_index, i64 27, ptr @Work__find_first_peer_index)
  call void @mesh_register_function(ptr @fn_reg_Work__max_request_key_length, i64 28, ptr @Work__max_request_key_length)
  call void @mesh_register_function(ptr @fn_reg_Work__pending_phase, i64 19, ptr @Work__pending_phase)
  call void @mesh_register_function(ptr @fn_reg_Work__pending_result, i64 20, ptr @Work__pending_result)
  call void @mesh_register_function(ptr @fn_reg_Work__completed_phase, i64 21, ptr @Work__completed_phase)
  call void @mesh_register_function(ptr @fn_reg_Work__succeeded_result, i64 22, ptr @Work__succeeded_result)
  call void @mesh_register_function(ptr @fn_reg_Work__missing_phase, i64 19, ptr @Work__missing_phase)
  call void @mesh_register_function(ptr @fn_reg_Work__unknown_result, i64 20, ptr @Work__unknown_result)
  call void @mesh_register_function(ptr @fn_reg_Work__invalid_phase, i64 19, ptr @Work__invalid_phase)
  call void @mesh_register_function(ptr @fn_reg_Work__rejected_result, i64 21, ptr @Work__rejected_result)
  call void @mesh_register_function(ptr @fn_reg_Work__unassigned_replica_status, i64 31, ptr @Work__unassigned_replica_status)
  call void @mesh_register_function(ptr @fn_reg_Work__assigned_replica_status, i64 29, ptr @Work__assigned_replica_status)
  call void @mesh_register_function(ptr @fn_reg_Work__payload_hash, i64 18, ptr @Work__payload_hash)
  call void @mesh_register_function(ptr @fn_reg_attempt_id_from_token, i64 21, ptr @attempt_id_from_token)
  call void @mesh_register_function(ptr @fn_reg_request_registry_name_for_node, i64 30, ptr @request_registry_name_for_node)
  call void @mesh_register_function(ptr @fn_reg_Work__standalone_work_node_name, i64 31, ptr @Work__standalone_work_node_name)
  call void @mesh_register_function(ptr @fn_reg_Work__effective_work_node_name, i64 30, ptr @Work__effective_work_node_name)
  call void @mesh_register_function(ptr @fn_reg_resolve_member_at, i64 17, ptr @resolve_member_at)
  call void @mesh_register_function(ptr @fn_reg_route_selection, i64 15, ptr @route_selection)
  call void @mesh_register_function(ptr @fn_reg_selection_membership, i64 20, ptr @selection_membership)
  call void @mesh_register_function(ptr @fn_reg_selection_ingress_index, i64 23, ptr @selection_ingress_index)
  call void @mesh_register_function(ptr @fn_reg_selection_target_index, i64 22, ptr @selection_target_index)
  call void @mesh_register_function(ptr @fn_reg_selection_routed_remotely, i64 25, ptr @selection_routed_remotely)
  call void @mesh_register_function(ptr @fn_reg_selection_fell_back_locally, i64 27, ptr @selection_fell_back_locally)
  call void @mesh_register_function(ptr @fn_reg_validate_request_key, i64 20, ptr @validate_request_key)
  call void @mesh_register_function(ptr @fn_reg_Work__validate_payload, i64 22, ptr @Work__validate_payload)
  call void @mesh_register_function(ptr @fn_reg_Work__normalize_submit_body, i64 27, ptr @Work__normalize_submit_body)
  call void @mesh_register_function(ptr @fn_reg_parse_submit_body, i64 17, ptr @parse_submit_body)
  call void @mesh_register_function(ptr @fn_reg_Work__status_payload_from_fields, i64 32, ptr @Work__status_payload_from_fields)
  call void @mesh_register_function(ptr @fn_reg_Work__status_payload_from_record, i64 32, ptr @Work__status_payload_from_record)
  call void @mesh_register_function(ptr @fn_reg_status_payload_json, i64 19, ptr @status_payload_json)
  call void @mesh_register_function(ptr @fn_reg_Work__missing_status_payload_json, i64 33, ptr @Work__missing_status_payload_json)
  call void @mesh_register_function(ptr @fn_reg_Work__invalid_request_payload_json, i64 34, ptr @Work__invalid_request_payload_json)
  call void @mesh_register_function(ptr @fn_reg_Work__invalid_selection_payload_json, i64 36, ptr @Work__invalid_selection_payload_json)
  call void @mesh_register_function(ptr @fn_reg_initial_request_registry_state, i64 30, ptr @initial_request_registry_state)
  call void @mesh_register_function(ptr @fn_reg_Work__make_request_record, i64 25, ptr @Work__make_request_record)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_decision, i64 21, ptr @Work__submit_decision)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_next_state, i64 23, ptr @Work__submit_next_state)
  call void @mesh_register_function(ptr @fn_reg_lookup_request, i64 14, ptr @lookup_request)
  call void @mesh_register_function(ptr @fn_reg_Work__transition_completed_record, i64 33, ptr @Work__transition_completed_record)
  call void @mesh_register_function(ptr @fn_reg_Work__apply_completion_from_record, i64 34, ptr @Work__apply_completion_from_record)
  call void @mesh_register_function(ptr @fn_reg_apply_completion, i64 16, ptr @apply_completion)
  call void @mesh_register_function(ptr @fn_reg_Work__log_submit, i64 16, ptr @Work__log_submit)
  call void @mesh_register_function(ptr @fn_reg_Work__log_dedupe, i64 16, ptr @Work__log_dedupe)
  call void @mesh_register_function(ptr @fn_reg_Work__log_conflict, i64 18, ptr @Work__log_conflict)
  call void @mesh_register_function(ptr @fn_reg_Work__log_status, i64 16, ptr @Work__log_status)
  call void @mesh_register_function(ptr @fn_reg_Work__log_status_missing, i64 24, ptr @Work__log_status_missing)
  call void @mesh_register_function(ptr @fn_reg_Work__log_status_transition, i64 27, ptr @Work__log_status_transition)
  call void @mesh_register_function(ptr @fn_reg_Work__log_status_transition_rejected, i64 36, ptr @Work__log_status_transition_rejected)
  call void @mesh_register_function(ptr @fn_reg_Work__log_invalid_selection, i64 27, ptr @Work__log_invalid_selection)
  call void @mesh_register_function(ptr @fn_reg_Work__registry_message, i64 22, ptr @Work__registry_message)
  call void @mesh_register_function(ptr @fn_reg_Work__registry_message_kind, i64 27, ptr @Work__registry_message_kind)
  call void @mesh_register_function(ptr @fn_reg_Work__registry_message_json, i64 27, ptr @Work__registry_message_json)
  call void @mesh_register_function(ptr @fn_reg_Work__status_found_response, i64 27, ptr @Work__status_found_response)
  call void @mesh_register_function(ptr @fn_reg_Work__status_missing_response, i64 29, ptr @Work__status_missing_response)
  call void @mesh_register_function(ptr @fn_reg_Work__log_status_transition_and_continue, i64 40, ptr @Work__log_status_transition_and_continue)
  call void @mesh_register_function(ptr @fn_reg_Work__mark_completed_success, i64 28, ptr @Work__mark_completed_success)
  call void @mesh_register_function(ptr @fn_reg_Work__mark_completed_error, i64 26, ptr @Work__mark_completed_error)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_created_response, i64 29, ptr @Work__submit_created_response)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_duplicate_response, i64 31, ptr @Work__submit_duplicate_response)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_conflict_response, i64 30, ptr @Work__submit_conflict_response)
  call void @mesh_register_function(ptr @fn_reg_Work__submit_registry_response, i64 30, ptr @Work__submit_registry_response)
  call void @mesh_register_function(ptr @fn_reg_Work__get_status_registry_response, i64 34, ptr @Work__get_status_registry_response)
  call void @mesh_register_function(ptr @fn_reg_Work__mark_completed_registry_state, i64 35, ptr @Work__mark_completed_registry_state)
  call void @mesh_register_function(ptr @fn_reg_Work__local_request_registry_name, i64 33, ptr @Work__local_request_registry_name)
  call void @mesh_register_function(ptr @fn_reg_Work__local_request_registry_pid, i64 32, ptr @Work__local_request_registry_pid)
  call void @mesh_register_function(ptr @fn_reg_Work__request_registry_pid_for_node, i64 35, ptr @Work__request_registry_pid_for_node)
  call void @mesh_register_function(ptr @fn_reg_Work__register_global_request_registry, i64 38, ptr @Work__register_global_request_registry)
  call void @mesh_register_function(ptr @fn_reg_Work__current_target_selection, i64 30, ptr @Work__current_target_selection)
  call void @mesh_register_function(ptr @fn_reg_execute_work, i64 12, ptr @execute_work)
  call void @mesh_register_function(ptr @fn_reg_Work__dispatch_work, i64 19, ptr @Work__dispatch_work)
  call void @mesh_register_function(ptr @fn_reg_start_work_services, i64 19, ptr @start_work_services)
  call void @mesh_register_function(ptr @fn_reg_Work__handle_valid_submit, i64 25, ptr @Work__handle_valid_submit)
  call void @mesh_register_function(ptr @fn_reg_Work__handle_valid_status, i64 25, ptr @Work__handle_valid_status)
  call void @mesh_register_function(ptr @fn_reg_handle_work_submit, i64 18, ptr @handle_work_submit)
  call void @mesh_register_function(ptr @fn_reg_handle_work_status, i64 18, ptr @handle_work_status)
  call void @mesh_register_function(ptr @fn_reg_Main__log_config_error, i64 22, ptr @Main__log_config_error)
  call void @mesh_register_function(ptr @fn_reg_Main__current_mode, i64 18, ptr @Main__current_mode)
  call void @mesh_register_function(ptr @fn_reg_Main__current_http_port, i64 23, ptr @Main__current_http_port)
  call void @mesh_register_function(ptr @fn_reg_Main__current_cluster_port, i64 26, ptr @Main__current_cluster_port)
  call void @mesh_register_function(ptr @fn_reg_Main__current_discovery_seed, i64 28, ptr @Main__current_discovery_seed)
  call void @mesh_register_function(ptr @fn_reg_Main__handle_membership, i64 23, ptr @Main__handle_membership)
  call void @mesh_register_function(ptr @fn_reg_Main__start_http_server, i64 23, ptr @Main__start_http_server)
  call void @mesh_register_function(ptr @fn_reg_Main__start_standalone, i64 22, ptr @Main__start_standalone)
  call void @mesh_register_function(ptr @fn_reg_Main__start_cluster, i64 19, ptr @Main__start_cluster)
  call void @mesh_register_function(ptr @fn_reg_Main__maybe_start_cluster, i64 25, ptr @Main__maybe_start_cluster)
  call void @mesh_register_function(ptr @fn_reg_Main__maybe_start_with_mode, i64 27, ptr @Main__maybe_start_with_mode)
  call void @mesh_register_function(ptr @fn_reg_mesh_main, i64 9, ptr @mesh_main)
  %2 = call {} @mesh_main()
  call void @mesh_rt_run_scheduler()
  ret i32 0
}

attributes #0 = { noreturn }

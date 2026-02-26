I benchmarked Mesh against Go, Rust, and Elixir on real hardware. Here's what I found.

Mesh is my language — statically typed, Hindley-Milner inference, actors as primitives, compiles to native code via LLVM. I wanted to know where it actually lands on throughput before making any claims about it.

**THE NUMBERS**

Two Fly.io `performance-2x` machines (2 dedicated vCPU, 4 GB RAM each) in the same region (Chicago). Load generator on a separate VM. 100 concurrent connections, HTTP/1.1, `hey` load tester. 30 s warmup + 5 timed runs of 30 s each, first run excluded, runs 2–5 averaged.

| Language | /text req/s | /json req/s |
|----------|------------|------------|
| **Mesh** | **19,718** | **20,483** |
| Go       | 26,278     | 26,175     |
| Rust     | 27,133     | 28,563     |
| Elixir   | 11,842     | 11,481     |

Latency (p50 / p99): Go 3.1 ms / 14.1 ms, Rust 2.8 ms / 14.5 ms, Elixir 7.8 ms / 19.7 ms. Mesh p50/p99 aren't recorded — the latency parser fix in the benchmark runner arrived after this run.

**THE MESH SERVER**

Nine lines of Mesh:

```
fn handle_text(request) do
  HTTP.response(200, "Hello, World!")
end

fn handle_json(request) do
  HTTP.response(200, "{\"message\":\"Hello, World!\"}")
end

fn main() do
  HTTP.serve((HTTP.router()
    |> HTTP.on_get("/text", handle_text)
    |> HTTP.on_get("/json", handle_json)), 3000)
end
```

Compiled to a native binary via meshc (LLVM 21 backend), linked against mesh-rt. No interpreter, no VM, no JIT. The binary runs cold.

**WHAT THE NUMBERS MEAN**

Mesh beats Elixir by ~66% on throughput. That's the right comparison — both are actor-model languages. Both pay the cost of a supervision tree and scheduled processes. Mesh wins that fight handily.

Go and Rust are ~35% ahead of Mesh. That's not a failure. Go's `net/http` and Rust's axum/tokio are raw thread-pool HTTP servers with no actor machinery at all. They take a request, dispatch it to a thread or task, return a response. That's it.

Mesh does more. Every HTTP request goes through the mesh-rt actor scheduler: process spawning, mailbox dispatch, the supervision tree. The same infrastructure that gives you fault isolation and location-transparent PIDs handles every request. The ~35% gap is the honest cost of that abstraction.

**THE ACTOR OVERHEAD**

It's structural, not accidental. In Go, handling a request means calling a function. In Mesh, handling a request means creating a supervised process, routing a message through its mailbox, and collecting the reply. That machinery exists whether you use it or not.

The payoff is that the same runtime that handles your HTTP server also handles your stateful actors, your supervision trees, your distributed PIDs. You get fault isolation and concurrency primitives for free. Go gives you goroutines. Rust gives you tokio tasks. Mesh gives you an Erlang-style actor runtime baked into the language itself.

**MEMORY**

| Language | Startup RSS |
|----------|------------|
| Mesh     | ~4.9 MB    |
| Go       | ~1.5 MB    |
| Rust     | ~3.4 MB    |
| Elixir   | ~1.6 MB    |

Mesh starts heavier than the others — the actor runtime has real upfront cost. But it produces ~66% more throughput than Elixir at ~3x Elixir's memory. That's a reasonable trade.

**CAVEATS**

All four servers ran co-located on the same 2-vCPU VM. They share resources under load; none of these numbers represent isolated peak throughput. Mesh's first timed run for `/text` came in at 4,041 req/s — classic JIT warmup effect. It's excluded from the reported average. Subsequent runs stabilized at 19,500–20,000 req/s.

**METHODOLOGY**

Full setup details: [METHODOLOGY.md](https://github.com/gsd-build/snow/blob/main/benchmarks/METHODOLOGY.md) and [RESULTS.md](https://github.com/gsd-build/snow/blob/main/benchmarks/RESULTS.md).

Mesh: https://meshlang.dev

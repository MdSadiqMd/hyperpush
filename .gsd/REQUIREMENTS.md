# Requirements

This file is the explicit capability and coverage contract for the project.

Use it to track what is actively in scope, what has been validated by completed work, what is intentionally deferred, and what is explicitly out of scope.

Guidelines:
- Keep requirements capability-oriented, not a giant feature wishlist.
- Requirements should be atomic, testable, and stated in plain language.
- Every **Active** requirement should be mapped to a slice, deferred, blocked with reason, or moved out of scope.
- Each requirement should have one accountable primary owner and may have supporting slices.
- Research may suggest requirements, but research does not silently make them binding.
- Validation means the requirement was actually proven by completed work and verification, not just discussed.

## Active

### R001 — Production baseline is explicit and mechanically verifiable
- Class: launchability
- Status: active
- Description: Mesh has an explicit definition of what “production ready language needs to have” means for this repo, and that baseline can be checked through concrete proof rather than vague claims.
- Why it matters: Without a baseline contract, the work turns into an endless feature list and nobody can tell whether Mesh actually became more trustworthy.
- Source: inferred
- Primary owning slice: M028/S01
- Supporting slices: M028/S06
- Validation: mapped
- Notes: M028 should define the baseline and prove it through one canonical backend path, not through abstract promises.

### R002 — Canonical backend path works end-to-end: API + DB + migrations + background jobs
- Class: core-capability
- Status: active
- Description: Mesh can power a real backend shape with an HTTP API, persistent database state, migrations, and background jobs in one coherent flow.
- Why it matters: This is the first serious proof target for trusting Mesh for a real production app backend in any capacity.
- Source: user
- Primary owning slice: M028/S01
- Supporting slices: M028/S02, M028/S04, M028/S05, M028/S06
- Validation: mapped
- Notes: This is the first deep proof shape before the project expands to other backend forms.

### R003 — HTTP, DB, and migration runtime path is trustworthy under automated verification
- Class: quality-attribute
- Status: active
- Description: The runtime path behind the canonical backend flow is exercised by automated verification strongly enough that the path is not just “implemented,” but trusted.
- Why it matters: A backend language loses credibility quickly if its basic runtime surfaces only work in isolated or manual scenarios.
- Source: inferred
- Primary owning slice: M028/S02
- Supporting slices: M028/S06
- Validation: mapped
- Notes: Ignored/manual proof paths should be reduced where they block trust on the golden path.

### R004 — Supervised jobs and services isolate failures and recover predictably
- Class: quality-attribute
- Status: active
- Description: Mesh concurrency and supervision are proven under crash, restart, and failure-reporting scenarios instead of only being advertised as features.
- Why it matters: The user explicitly said “concurrency exists but isn’t trustworthy” would be a failure state for the project.
- Source: user
- Primary owning slice: M028/S05
- Supporting slices: M028/S02, M028/S06
- Validation: mapped
- Notes: Recovery behavior must be explicit, observable, and tied to the reference backend.

### R005 — Native build and deployment feel boring and reliable
- Class: launchability
- Status: active
- Description: Mesh’s native-binary workflow is proven through a deployment path that feels closer to shipping a Go app than to assembling a fragile language stack.
- Why it matters: Easier deployment is one of the first ways the user wants Mesh to beat Elixir.
- Source: user
- Primary owning slice: M028/S04
- Supporting slices: M028/S06
- Validation: mapped
- Notes: The milestone does not need every deployment target, but it does need one honest boring path.

### R006 — Daily-driver tooling is credible for backend work
- Class: quality-attribute
- Status: active
- Description: Diagnostics, formatter, LSP, tests, and the coverage story are credible enough that a backend engineer can use Mesh daily without fighting the toolchain.
- Why it matters: Better DX is part of the explicit comparison target against Elixir, and weak tooling would erase gains from static typing or native binaries.
- Source: user
- Primary owning slice: M028/S03
- Supporting slices: M030/S01 (provisional), M030/S02 (provisional)
- Validation: mapped
- Notes: The toolchain should be judged against the real reference backend, not only tiny fixtures.

### R007 — Package and dependency workflow is reproducible and credible for shipping backend apps
- Class: launchability
- Status: active
- Description: Mesh projects have a believable dependency/package workflow for building and shipping backend applications with reproducible inputs.
- Why it matters: A language may have good runtime features and still fail as a serious backend option if dependency flow is rough or confidence-eroding.
- Source: inferred
- Primary owning slice: M030/S01 (provisional)
- Supporting slices: M030/S02 (provisional)
- Validation: mapped
- Notes: This sits after the M028 trust baseline but is already part of the capability contract.

### R008 — Docs and examples prove real backend use honestly
- Class: launchability
- Status: active
- Description: Mesh documentation and examples show a production-style backend path and do not rely mainly on toy examples to make the language look ready.
- Why it matters: The user explicitly said “docs/examples don’t prove real use” would be a failure.
- Source: user
- Primary owning slice: M028/S06
- Supporting slices: M028/S01, M028/S03, M028/S04, M028/S05
- Validation: mapped
- Notes: The docs surface should become part of the proof, not an afterthought.

### R009 — Mesh is dogfooded through a real reference backend
- Class: differentiator
- Status: active
- Description: Mesh proves itself through a real reference backend that exercises the language as a backend platform instead of proving subsystems only in isolation.
- Why it matters: Dogfooding is how the project turns “all types of backend code” from ambition into grounded engineering pressure.
- Source: inferred
- Primary owning slice: M028/S06
- Supporting slices: M028/S01, M028/S02, M028/S05
- Validation: mapped
- Notes: The reference backend may be a focused app or a narrowed dogfooded app, but it must be real and end-to-end.

### R010 — Mesh’s first wins over Elixir are measurable in deployment simplicity, performance, and DX
- Class: differentiator
- Status: active
- Description: The project can point to specific ways Mesh is easier to deploy, measurably fast, and nicer for backend development rather than vaguely claiming it is “better than Elixir.”
- Why it matters: The user’s comparison target is clear, but the comparison needs to be grounded in measurable strengths instead of ecosystem parity rhetoric.
- Source: user
- Primary owning slice: M029/S01 (provisional)
- Supporting slices: M028/S04, M028/S06, M029/S02 (provisional)
- Validation: mapped
- Notes: M028 establishes the baseline proof needed before these comparisons are sharpened further.

### R011 — Backend ergonomics improve from real backend pressure, not hypothetical language design
- Class: differentiator
- Status: active
- Description: New language/runtime work after M028 should come from real backend friction discovered while using Mesh for actual backend code.
- Why it matters: This keeps the project from chasing clever language features that do not improve the target use case.
- Source: user
- Primary owning slice: M029/S02 (provisional)
- Supporting slices: M029/S03 (provisional)
- Validation: mapped
- Notes: This is the guardrail against speculative feature churn.

### R012 — Backend breadth expands after the golden path to cover long-running services, realtime, and distributed systems credibly
- Class: core-capability
- Status: active
- Description: After the canonical API + DB + migrations + jobs path is proven, Mesh continues toward the broader backend space the user wants: long-running supervised services, realtime systems, and distributed backends.
- Why it matters: The long-term vision is “all types of backend code,” not only one app shape.
- Source: user
- Primary owning slice: M031/S01 (provisional)
- Supporting slices: M031/S02 (provisional), M031/S03 (provisional)
- Validation: mapped
- Notes: This remains in scope for the project, but it follows the first credibility milestone.

## Validated

_None yet._

## Deferred

### R020 — First-class debugger, profiler, and tracing experience competitive with mature ecosystems
- Class: operability
- Status: deferred
- Description: Mesh eventually offers a stronger debugger/profiler/trace surface suitable for deeper production diagnostics.
- Why it matters: Mature backend ecosystems are judged heavily on observability and debugging, but this should not swallow the first trust milestone.
- Source: research
- Primary owning slice: none
- Supporting slices: none
- Validation: unmapped
- Notes: Deferred until the canonical backend path and boring deploy story are proven.

### R021 — Full package ecosystem polish beyond baseline trust
- Class: admin/support
- Status: deferred
- Description: Registry, publishing flow, package trust, and ecosystem polish rise from “credible enough” to “mature ecosystem experience.”
- Why it matters: It matters for adoption, but the first milestone should not stall on ecosystem breadth.
- Source: research
- Primary owning slice: none
- Supporting slices: none
- Validation: unmapped
- Notes: The baseline package flow is active scope; broad ecosystem polish is later.

## Out of Scope

### R030 — Frontend-first language positioning
- Class: anti-feature
- Status: out-of-scope
- Description: The project is not being planned primarily as a frontend-first language effort.
- Why it matters: This prevents scope confusion and preserves the explicit server/backend bias from the discussion.
- Source: inferred
- Primary owning slice: none
- Supporting slices: none
- Validation: n/a
- Notes: Mesh remains general-purpose, but planning and proof are backend-led.

### R031 — Chasing new language features ahead of backend trust
- Class: anti-feature
- Status: out-of-scope
- Description: M028 should not become a broad syntax/features sprint before the backend trust baseline is proven.
- Why it matters: This keeps the first milestone honest and evidence-first.
- Source: inferred
- Primary owning slice: none
- Supporting slices: none
- Validation: n/a
- Notes: Feature expansion belongs after the hardening milestone unless a blocker is found on the golden path.

### R032 — Claiming production readiness without a real deployable proof path
- Class: constraint
- Status: out-of-scope
- Description: The project will not call Mesh production-ready based only on feature lists, benchmarks, or toy examples.
- Why it matters: This prevents the exact kind of weak proof the user rejected.
- Source: user
- Primary owning slice: none
- Supporting slices: none
- Validation: n/a
- Notes: Honest proof is a non-negotiable scope boundary.

## Traceability

| ID | Class | Status | Primary owner | Supporting | Proof |
|---|---|---|---|---|---|
| R001 | launchability | active | M028/S01 | M028/S06 | mapped |
| R002 | core-capability | active | M028/S01 | M028/S02, M028/S04, M028/S05, M028/S06 | mapped |
| R003 | quality-attribute | active | M028/S02 | M028/S06 | mapped |
| R004 | quality-attribute | active | M028/S05 | M028/S02, M028/S06 | mapped |
| R005 | launchability | active | M028/S04 | M028/S06 | mapped |
| R006 | quality-attribute | active | M028/S03 | M030/S01, M030/S02 (prov.) | mapped |
| R007 | launchability | active | M030/S01 (prov.) | M030/S02 (prov.) | mapped |
| R008 | launchability | active | M028/S06 | M028/S01, M028/S03, M028/S04, M028/S05 | mapped |
| R009 | differentiator | active | M028/S06 | M028/S01, M028/S02, M028/S05 | mapped |
| R010 | differentiator | active | M029/S01 (prov.) | M028/S04, M028/S06, M029/S02 (prov.) | mapped |
| R011 | differentiator | active | M029/S02 (prov.) | M029/S03 (prov.) | mapped |
| R012 | core-capability | active | M031/S01 (prov.) | M031/S02 (prov.), M031/S03 (prov.) | mapped |
| R020 | operability | deferred | none | none | unmapped |
| R021 | admin/support | deferred | none | none | unmapped |
| R030 | anti-feature | out-of-scope | none | none | n/a |
| R031 | anti-feature | out-of-scope | none | none | n/a |
| R032 | constraint | out-of-scope | none | none | n/a |

## Coverage Summary

- Active requirements: 12
- Mapped to slices: 12
- Validated: 0
- Unmapped active requirements: 0

---
phase: quick-6
plan: 01
subsystem: documentation
tags: [benchmarks, article, hn, marketing]
key-files:
  created:
    - .planning/quick/6-write-an-article-about-the-benchmarks-in/ARTICLE.md
decisions:
  - "Headline comparison: Mesh vs Elixir (~66% faster) as the apples-to-apples actor-model comparison"
  - "Go/Rust gap framed as cost of actor abstraction, not a performance failure"
  - "Mesh p50/p99 absence acknowledged honestly in Caveats section"
metrics:
  duration: 5min
  completed: "2026-02-26"
---

# Quick 6: Mesh HTTP Benchmark Article Summary

**One-liner:** HN-ready benchmark article comparing Mesh HTTP throughput to Go, Rust, and Elixir with honest actor-overhead framing and real numbers.

## Tasks Completed

| Task | Name | Commit | Files |
|------|------|--------|-------|
| 1 | Write benchmark article | 39e94f46 | .planning/quick/6-.../ARTICLE.md |

## What Was Built

`ARTICLE.md` — a ~570-word Markdown article structured for HN or blog posting. Covers:

- Results table with all eight throughput numbers (both endpoints, all four languages)
- 9-line Mesh server code snippet
- Actor overhead explanation: every request goes through process spawning, mailbox dispatch, supervision tree — structural cost, not accidental
- Mesh beats Elixir by ~66% (correct actor-model vs actor-model comparison)
- Go/Rust ~35% lead over Mesh framed as the cost of having actor runtime built in
- Memory table (Mesh 4.9 MB vs Go 1.5 MB vs Rust 3.4 MB vs Elixir 1.6 MB) with throughput context
- Caveats: co-located servers, Run 1 warmup anomaly, missing Mesh p50/p99
- Links to METHODOLOGY.md, RESULTS.md, meshlang.dev

Tone matches ARTICLE_HN.txt — terse, direct, first person, no marketing.

## Deviations from Plan

None — plan executed exactly as written.

## Self-Check: PASSED

- ARTICLE.md exists at `.planning/quick/6-write-an-article-about-the-benchmarks-in/ARTICLE.md`
- Contains 19,718 (grep confirmed)
- Contains 11,842 (grep confirmed)
- Contains all eight throughput numbers from RESULTS.md
- Word count: 576 (within 400-600 target)
- Commit 39e94f46 confirmed in git log

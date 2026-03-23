# Decisions Register

<!-- Append-only. Never edit or remove existing rows.
     To reverse a decision, add a new row that supersedes it.
     Read this file at the start of any planning or research phase. -->

| # | When | Scope | Decision | Choice | Rationale | Revisable? | Made By |
|---|------|-------|----------|--------|-----------|------------|---------|
| D001 | M028 bootstrap | scope | Primary planning focus for the repo during milestone bootstrap | Anchor the GSD project contract around Mesh language maturity rather than the creator-fund product | The user explicitly chose the language as the primary contract for the new milestone, and M028 is meant to plan the language/platform direction rather than the current product effort. | Yes — if the repo returns to product-first planning later | human |
| D002 | M028 bootstrap | architecture | First serious production proof shape for Mesh | Use API + DB + migrations + background jobs as the canonical backend path | The user wants trust for a real production backend in any capacity, and this backend shape is the first deep proof target before expanding to broader backend forms. | Yes — if execution proves a narrower or broader proof path is necessary | collaborative |
| D003 | M028 bootstrap | prioritization | What Mesh should try to beat Elixir on first | Prioritize easier deployment, raw performance, and better DX before trying to match ecosystem breadth | The user defined the early comparison target as easier deployment, raw performance, and better DX, and explicitly called out untrustworthy concurrency and weak docs/examples as unacceptable. | Yes — once the trust baseline is established | collaborative |
| D004 | M028 bootstrap | pattern | How M028 should spend its first milestone energy | Use evidence-first hardening and honest proof before broad new syntax or feature expansion | The repo already exposes a wide backend/runtime/tooling surface; the highest-leverage next step is converting claims into trusted proof rather than increasing surface area without raising credibility. | Yes — if the canonical backend path exposes a blocking feature gap that must be added immediately | agent |

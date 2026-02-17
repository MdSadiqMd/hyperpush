---
status: resolved
trigger: "POST /api/v1/events returns 400 with a DB query error involving the ->> (JSON extraction) operator"
created: 2026-02-17T00:00:00Z
updated: 2026-02-17T00:05:00Z
---

## Current Focus

hypothesis: CONFIRMED - PostgreSQL operator precedence between ->> and || causes SQL parse error
test: fixed SQL, rebuilt binary, tested 5 different event payloads
expecting: all return 202
next_action: archive and commit

## Symptoms

expected: POST /api/v1/events should successfully ingest events and return 200
actual: Returns 400 with error: {"error":"42883\t\t\t\toperator does not exist: text ->> unknown"}
errors: PostgreSQL error 42883 - "operator does not exist: text ->> unknown"
reproduction: curl -X POST http://localhost:8080/api/v1/events -H "x-sentry-auth: mshr_testkey123" -d '{"message":"test error","level":"error"}'
started: After Phase 105.1 fixes. Synchronous path issue, before async EventProcessor runs.

## Eliminated

- hypothesis: Mesh compiler incorrectly escaping ->> in SQL string literals
  evidence: LLVM IR string constant @.str.267 contains the exact SQL with ->> intact (866 bytes, matches source)
  timestamp: 2026-02-17T00:00:30Z

- hypothesis: Runtime parameter binding issue (event JSON not being cast to jsonb)
  evidence: The SQL itself is syntactically invalid regardless of parameter values. Even running directly in psql with hardcoded jsonb value fails with the same error.
  timestamp: 2026-02-17T00:02:00Z

## Evidence

- timestamp: 2026-02-17T00:00:30Z
  checked: LLVM IR string constants for SQL queries containing ->>
  found: All SQL strings are correctly preserved in the IR. The ->> operator is not mangled.
  implication: The compiler handles ->> in string literals correctly.

- timestamp: 2026-02-17T00:01:00Z
  checked: Live reproduction of the issue
  found: curl returns {"error":"42883\t\t\t\toperator does not exist: text ->> unknown"} with HTTP 400
  implication: PostgreSQL is rejecting the SQL query during parse/prepare phase.

- timestamp: 2026-02-17T00:02:00Z
  checked: Running extract_event_fields SQL directly in psql with hardcoded jsonb value
  found: Same error even with direct psql execution. The SQL itself is syntactically problematic.
  implication: Not a parameter binding issue. The SQL has an operator precedence bug.

- timestamp: 2026-02-17T00:02:30Z
  checked: Isolated the problematic expression: frame->>'filename' || '|' || frame->>'function_name'
  found: In PostgreSQL, ->> and || have the same precedence and are left-associative. So this parses as: ((frame->>'filename') || '|' || frame) ->> 'function_name'. The || concatenates 'text' with 'jsonb' (producing text), then ->> is applied to that text -- but ->> doesn't work on text type.
  implication: Need explicit parentheses around ->> expressions when mixed with ||.

- timestamp: 2026-02-17T00:03:00Z
  checked: Fixed SQL with parentheses: (frame->>'filename') || '|' || (frame->>'function_name')
  found: Works correctly in both psql and via the compiled application.
  implication: Fix is minimal (4 characters added) and correct.

- timestamp: 2026-02-17T00:04:00Z
  checked: 5 different event payloads (simple, stacktrace, exception, custom fingerprint, tags+extra)
  found: All return HTTP 202. Issues created correctly in database. Dashboard endpoints confirm data.
  implication: Fix is verified across all event types.

- timestamp: 2026-02-17T00:04:30Z
  checked: Compiler test suite (91 E2E + 13 concurrency tests)
  found: All pass (2 pre-existing HTTP test failures unchanged). No regressions.
  implication: Fix is safe and isolated.

## Resolution

root_cause: PostgreSQL operator precedence bug in extract_event_fields SQL query. The expression `frame->>'filename' || '|' || frame->>'function_name'` inside string_agg() is mis-parsed by PostgreSQL because ->> and || have the same precedence and are left-associative. PostgreSQL parses it as `((frame->>'filename') || '|' || frame) ->> 'function_name'`, which applies ->> to a text value (result of concatenation), causing error "operator does not exist: text ->> unknown". This error occurs during SQL Parse/Prepare, so it fails for ALL events regardless of payload content (even events without stacktraces).
fix: Added explicit parentheses around ->> expressions in the string_agg call: `(frame->>'filename') || '|' || (frame->>'function_name')`. This forces PostgreSQL to evaluate each ->> independently before concatenation.
verification: Tested 5 different event payloads (simple message, stacktrace, exception, custom fingerprint, tags+extra) - all return 202. Verified events appear in issues table. Ran 91 E2E + 13 concurrency compiler tests with no regressions.
files_changed: [mesher/storage/queries.mpl]

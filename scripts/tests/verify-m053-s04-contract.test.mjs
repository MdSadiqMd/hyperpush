import test from 'node:test'
import assert from 'node:assert/strict'
import fs from 'node:fs'
import os from 'node:os'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const scriptDir = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(scriptDir, '..', '..')

const files = {
  readme: 'README.md',
  gettingStarted: 'website/docs/docs/getting-started/index.md',
  clusteredExample: 'website/docs/docs/getting-started/clustered-example/index.md',
  tooling: 'website/docs/docs/tooling/index.md',
  distributed: 'website/docs/docs/distributed/index.md',
  distributedProof: 'website/docs/docs/distributed-proof/index.md',
  clusterProofReadme: 'scripts/fixtures/clustered/cluster-proof/README.md',
  clusterProofTests: 'scripts/fixtures/clustered/cluster-proof/tests/work.test.mpl',
  flyVerifier: 'scripts/verify-m043-s04-fly.sh',
}

const firstContactFiles = [files.readme, files.gettingStarted, files.clusteredExample, files.tooling]
const publicDocsFiles = [
  files.readme,
  files.gettingStarted,
  files.clusteredExample,
  files.tooling,
  files.distributed,
  files.distributedProof,
]
const currentRepoBlobBase = 'https://github.com/snowdamiz/mesh-lang/blob/main/'
const sqliteStarterLink = `${currentRepoBlobBase}examples/todo-sqlite/README.md`
const postgresStarterLink = `${currentRepoBlobBase}examples/todo-postgres/README.md`
const readmeLadderIntro = 'Keep the public ladder starter/examples-first: the scaffold and `/examples` stay ahead of maintainer proof surfaces.'
const gettingStartedProofHandoff = 'When you need the staged deploy + failover proof chain and the same hosted packages/public-surface contract, continue from the generated PostgreSQL starter into Production Backend Proof. Keep those deeper proof commands behind the proof pages instead of turning this first-contact guide into a verifier runbook.'
const clusteredExampleProofPageHandoff = 'Use [Distributed Proof](/docs/distributed-proof/) when you need the repo-owned verifier map, retained compatibility wrappers, or the lower-level fixture-backed rails behind this public starter story. The generated PostgreSQL starter owns the staged deploy + failover proof chain plus the same hosted packages/public-surface contract there, so this page stays focused on the scaffold plus the SQLite/PostgreSQL starter split.'
const toolingWorkflowMarker = 'Keep the public CLI workflow explicit and examples-first: hello world first, then the clustered scaffold, then the honest local SQLite starter or the serious shared/deployable PostgreSQL starter, and only after that the maintainer-facing backend proof page. SQLite stays local-only and single-node only here; the generated PostgreSQL starter is the serious shared/deployable path and the handoff into the staged deploy + failover proof chain plus the same hosted packages/public-surface contract.'
const toolingVerifierHeading = '## Assembled first-contact docs verifier'
const toolingProofNextStep = '- [Production Backend Proof](/docs/production-backend-proof/) — the maintainer-facing backend proof page after the starter/examples-first ladder'
const distributedCalloutMarker = '> **Clustered proof surfaces:**'
const distributedM053MapMarker = 'M053 starter-owned staged deploy + failover + hosted-contract proof map'
const distributedFlyBoundaryMarker = 'retained read-only Fly reference lane'
const distributedProofRoleSentence = 'This is the only public-secondary docs page that carries the named clustered verifier rails.'
const distributedProofChainSentence = "The clustered proof story now centers the generated PostgreSQL starter's M053 chain: `bash scripts/verify-m053-s01.sh` owns staged deploy truth, `bash scripts/verify-m053-s02.sh` owns failover truth, and `bash scripts/verify-m053-s03.sh` keeps packages/public-surface proof in the same hosted contract."
const distributedProofFlyBoundaryMarker = 'keep Fly as a retained read-only reference/proof lane for already-deployed environments instead of treating it as a coequal public starter surface'
const distributedProofFlyNote = '> **Note:** The Fly verifier is intentionally read-only and intentionally secondary.'
const distributedProofPublicSurfacePostgres = '- [`examples/todo-postgres/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/examples/todo-postgres/README.md) — the serious shared/deployable starter that owns the shipped clustered contract'
const distributedProofPublicSurfaceSqlite = '- [`examples/todo-sqlite/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/examples/todo-sqlite/README.md) — the honest local single-node SQLite starter, not a clustered/operator proof surface'
const distributedProofStarterS01 = '- `bash scripts/verify-m053-s01.sh` — starter-owned staged deploy proof that retains the generated PostgreSQL bundle plus bundled artifacts'
const distributedProofStarterS02 = '- `bash scripts/verify-m053-s02.sh` — starter-owned failover proof that replays S01, exercises the staged PostgreSQL starter under failover, and retains the failover proof bundle'
const distributedProofStarterS03 = '- `bash scripts/verify-m053-s03.sh` — hosted packages/public-surface contract that checks the same starter proof remains visible in the public hosted story'
const distributedProofPublicSurfaceProduction = '- [Production Backend Proof](/docs/production-backend-proof/) — the compact backend proof handoff before any maintainer-only surface'
const clusterProofRetainedMarker = '`scripts/fixtures/clustered/cluster-proof/` is a retained reference/proof fixture for the older Fly-oriented packaging rail.'
const clusterProofStarterBoundary = 'It is not a public starter surface'
const clusterProofScopeMarker = 'bounded read-only/reference environment'
const flyHelpIntro = 'Read-only Fly verifier for the retained `cluster-proof` reference rail.'
const flyHelpBoundary = 'This help surface documents a bounded reference/proof lane; it does not define a public starter surface.'
const flyHelpScopeMarker = 'This script is a retained reference sanity/config/log/probe rail.'
const flyHelpNoMutationsMarker = 'no machine restarts, scale changes, or secret writes'
const flyHelpNotStarterMarker = 'does not promote Fly or `cluster-proof` into a public starter surface'
const toolingNextStepLine = '- [Distributed Actors](/docs/distributed/) -- building distributed systems with Mesh'
const staleHistoricalRails = [
  'bash scripts/verify-m047-s04.sh',
  'bash scripts/verify-m047-s05.sh',
  'bash scripts/verify-m047-s06.sh',
  'bash scripts/verify-m043-s04-fly.sh --help',
  'CLUSTER_PROOF_FLY_APP=',
  'mesh-cluster-proof.fly.dev',
]

function readFrom(baseRoot, relativePath) {
  const absolutePath = path.join(baseRoot, relativePath)
  assert.ok(fs.existsSync(absolutePath), `missing ${relativePath}`)
  return fs.readFileSync(absolutePath, 'utf8')
}

function writeTo(baseRoot, relativePath, content) {
  const absolutePath = path.join(baseRoot, relativePath)
  fs.mkdirSync(path.dirname(absolutePath), { recursive: true })
  fs.writeFileSync(absolutePath, content)
}

function copyRepoFile(baseRoot, relativePath) {
  writeTo(baseRoot, relativePath, readFrom(root, relativePath))
}

function copyAllFiles(baseRoot) {
  for (const relativePath of Object.values(files)) {
    copyRepoFile(baseRoot, relativePath)
  }
}

function mkTmpDir(t, prefix) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), prefix))
  t.after(() => fs.rmSync(dir, { recursive: true, force: true }))
  return dir
}

function requireIncludes(errors, relativePath, text, needles) {
  for (const needle of needles) {
    if (!text.includes(needle)) {
      errors.push(`${relativePath} missing ${JSON.stringify(needle)}`)
    }
  }
}

function requireExcludes(errors, relativePath, text, needles) {
  for (const needle of needles) {
    if (text.includes(needle)) {
      errors.push(`${relativePath} still contains stale text ${JSON.stringify(needle)}`)
    }
  }
}

function requireOrdered(errors, relativePath, text, markers) {
  let previousIndex = -1
  for (const marker of markers) {
    const index = text.indexOf(marker)
    if (index === -1) {
      errors.push(`${relativePath} missing ordered marker ${JSON.stringify(marker)}`)
      return
    }
    if (index <= previousIndex) {
      errors.push(`${relativePath} drifted order around ${JSON.stringify(marker)}`)
      return
    }
    previousIndex = index
  }
}

function requireLineCount(errors, relativePath, text, line, expectedCount) {
  const actualCount = text.split('\n').filter((candidate) => candidate === line).length
  if (actualCount !== expectedCount) {
    errors.push(`${relativePath} expected ${expectedCount} exact line(s) ${JSON.stringify(line)} but found ${actualCount}`)
  }
}

function validateS04DocsReferenceContract(baseRoot) {
  const errors = []
  const readme = readFrom(baseRoot, files.readme)
  const gettingStarted = readFrom(baseRoot, files.gettingStarted)
  const clusteredExample = readFrom(baseRoot, files.clusteredExample)
  const tooling = readFrom(baseRoot, files.tooling)
  const distributed = readFrom(baseRoot, files.distributed)
  const distributedProof = readFrom(baseRoot, files.distributedProof)
  const clusterProofReadme = readFrom(baseRoot, files.clusterProofReadme)
  const clusterProofTests = readFrom(baseRoot, files.clusterProofTests)
  const flyVerifier = readFrom(baseRoot, files.flyVerifier)

  requireIncludes(errors, files.readme, readme, [
    readmeLadderIntro,
    'honest local-only starter',
    'single-node only',
    'staged deploy + failover proof chain',
    'hosted packages/public-surface contract',
    sqliteStarterLink,
    postgresStarterLink,
    'https://meshlang.dev/docs/production-backend-proof/',
  ])

  requireIncludes(errors, files.gettingStarted, gettingStarted, [
    '## Choose your next starter',
    'honest local-only starter',
    'single-node only',
    'serious shared/deployable PostgreSQL starter',
    gettingStartedProofHandoff,
    sqliteStarterLink,
    postgresStarterLink,
    '[Production Backend Proof](/docs/production-backend-proof/)',
  ])

  requireIncludes(errors, files.clusteredExample, clusteredExample, [
    'This page stays on that scaffold first.',
    '## After the scaffold, pick the follow-on starter',
    'honest local SQLite starter',
    'serious shared/deployable PostgreSQL starter',
    clusteredExampleProofPageHandoff,
    '## Need the retained verifier map?',
    '[Distributed Proof](/docs/distributed-proof/)',
    sqliteStarterLink,
    postgresStarterLink,
  ])

  requireIncludes(errors, files.tooling, tooling, [
    toolingWorkflowMarker,
    toolingVerifierHeading,
    'bash scripts/verify-m050-s02.sh',
    'staged deploy + failover proof chain',
    'hosted packages/public-surface contract',
    sqliteStarterLink,
    postgresStarterLink,
    toolingNextStepLine,
  ])

  requireIncludes(errors, files.distributed, distributed, [
    distributedCalloutMarker,
    distributedM053MapMarker,
    distributedFlyBoundaryMarker,
    '[Distributed Proof](/docs/distributed-proof/)',
    '[Production Backend Proof](/docs/production-backend-proof/)',
    sqliteStarterLink,
    postgresStarterLink,
  ])
  requireExcludes(errors, files.distributed, distributed, staleHistoricalRails)

  requireIncludes(errors, files.distributedProof, distributedProof, [
    distributedProofRoleSentence,
    distributedProofChainSentence,
    '## Public surfaces and verifier rails',
    '## Retained reference rails',
    '## Named proof commands',
    'bash scripts/verify-m053-s01.sh',
    'bash scripts/verify-m053-s02.sh',
    'bash scripts/verify-m053-s03.sh',
    'bash scripts/verify-m043-s04-fly.sh --help',
    distributedProofFlyBoundaryMarker,
    distributedProofFlyNote,
    sqliteStarterLink,
    postgresStarterLink,
  ])
  requireExcludes(errors, files.distributedProof, distributedProof, [
    'keep `reference-backend` as the deeper backend proof surface rather than a coequal first-contact clustered starter',
  ])

  requireIncludes(errors, files.clusterProofReadme, clusterProofReadme, [
    clusterProofRetainedMarker,
    clusterProofStarterBoundary,
    'generated `meshc init --clustered` scaffold and the PostgreSQL Todo starter own the shipped M053 clustered contract',
    'route-free',
    clusterProofScopeMarker,
    'meshc cluster status',
    'meshc cluster continuity',
    'meshc cluster diagnostics',
  ])
  requireExcludes(errors, files.clusterProofReadme, clusterProofReadme, [
    'one of the three equal canonical clustered surfaces',
    'mesh-cluster-proof.fly.dev',
  ])

  requireIncludes(errors, files.flyVerifier, flyVerifier, [
    flyHelpIntro,
    flyHelpBoundary,
    flyHelpScopeMarker,
    flyHelpNoMutationsMarker,
    flyHelpNotStarterMarker,
  ])
  requireExcludes(errors, files.flyVerifier, flyVerifier, [
    'Read-only Fly verifier for the M043 failover/operator rail.',
    'public starter lane',
  ])

  requireIncludes(errors, files.clusterProofTests, clusterProofTests, [
    'assert_contains(readme, "retained reference/proof fixture")',
    'assert_contains(readme, "It is not a public starter surface")',
    'assert_contains(readme, "bounded read-only/reference environment")',
    'assert_contains(verifier, "Read-only Fly verifier for the retained `cluster-proof` reference rail.")',
    'assert_contains(verifier, "it does not define a public starter surface")',
    'assert_contains(verifier, "does not promote Fly or `cluster-proof` into a public starter surface")',
    'assert_not_contains(verifier, "Read-only Fly verifier for the M043 failover/operator rail.")',
    'assert_not_contains(readme, "one of the three equal canonical clustered surfaces")',
  ])

  for (const relativePath of firstContactFiles) {
    const text = readFrom(baseRoot, relativePath)
    requireExcludes(errors, relativePath, text, staleHistoricalRails)
  }

  requireOrdered(errors, files.readme, readme, [
    'meshc init --clustered hello_cluster',
    sqliteStarterLink,
    postgresStarterLink,
    'https://meshlang.dev/docs/production-backend-proof/',
  ])
  requireOrdered(errors, files.gettingStarted, gettingStarted, [
    'meshc init --clustered hello_cluster',
    'meshc init --template todo-api --db sqlite todo_api',
    'meshc init --template todo-api --db postgres shared_todo',
    '[Production Backend Proof](/docs/production-backend-proof/)',
  ])
  requireOrdered(errors, files.clusteredExample, clusteredExample, [
    'meshc init --template todo-api --db sqlite my_local_todo',
    'meshc init --template todo-api --db postgres my_shared_todo',
    '[Production Backend Proof](/docs/production-backend-proof/)',
    '[Distributed Proof](/docs/distributed-proof/)',
  ])
  requireOrdered(errors, files.tooling, tooling, [
    'meshc init --clustered my_clustered_app',
    'meshc init --template todo-api --db sqlite my_local_todo',
    'meshc init --template todo-api --db postgres my_shared_todo',
    'Inspect a running clustered app with the same operator order used by the scaffold',
    toolingProofNextStep,
    toolingVerifierHeading,
    'bash scripts/verify-m050-s02.sh',
  ])
  requireOrdered(errors, files.distributedProof, distributedProof, [
    '[Clustered Example](/docs/getting-started/clustered-example/)',
    distributedProofPublicSurfacePostgres,
    distributedProofPublicSurfaceSqlite,
    distributedProofStarterS01,
    distributedProofStarterS02,
    distributedProofStarterS03,
    distributedProofPublicSurfaceProduction,
    '[`mesher/README.md`](https://github.com/snowdamiz/mesh-lang/blob/main/mesher/README.md)',
    'bash scripts/verify-m051-s01.sh',
    'bash scripts/verify-m051-s02.sh',
    'bash scripts/verify-m043-s04-fly.sh --help',
  ])

  requireLineCount(errors, files.tooling, tooling, toolingNextStepLine, 1)
  requireLineCount(errors, files.tooling, tooling, '/) -- building distributed systems with Mesh', 0)
  requireLineCount(errors, files.tooling, tooling, 'ng distributed systems with Mesh', 0)

  return errors
}

test('current repo publishes the fail-closed M053 S04 docs and retained Fly reference contract', () => {
  const errors = validateS04DocsReferenceContract(root)
  assert.deepEqual(errors, [], errors.join('\n'))
})

test('contract fails closed when Distributed Proof drops the M053 starter chain or widens Fly into a public starter', (t) => {
  const tmpRoot = mkTmpDir(t, 'verify-m053-s04-distributed-proof-')
  copyAllFiles(tmpRoot)

  let mutatedDistributedProof = readFrom(tmpRoot, files.distributedProof)
  mutatedDistributedProof = mutatedDistributedProof.replace(distributedProofChainSentence, 'Fly owns the clustered proof story now.')
  mutatedDistributedProof = mutatedDistributedProof.replace(distributedProofFlyBoundaryMarker, 'keep Fly as the canonical public starter lane')
  mutatedDistributedProof = mutatedDistributedProof.replace('bash scripts/verify-m053-s03.sh', 'bash scripts/verify-m047-s06.sh')
  writeTo(tmpRoot, files.distributedProof, mutatedDistributedProof)

  const errors = validateS04DocsReferenceContract(tmpRoot)
  assert.ok(errors.some((error) => error.includes(`${files.distributedProof} missing ${JSON.stringify(distributedProofChainSentence)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.distributedProof} missing ${JSON.stringify(distributedProofFlyBoundaryMarker)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.distributedProof} missing ${JSON.stringify('bash scripts/verify-m053-s03.sh')}`) || error.includes(`${files.distributedProof} missing ordered marker ${JSON.stringify(distributedProofStarterS03)}`) || error.includes(`${files.distributedProof} drifted order around ${JSON.stringify(distributedProofStarterS03)}`)), errors.join('\n'))
})

test('contract fails closed when first-contact or distributed public docs regress toward proof-maze-first or Fly-first wording', (t) => {
  const tmpRoot = mkTmpDir(t, 'verify-m053-s04-public-docs-')
  copyAllFiles(tmpRoot)

  let mutatedGettingStarted = readFrom(tmpRoot, files.gettingStarted)
  mutatedGettingStarted = mutatedGettingStarted.replace(gettingStartedProofHandoff, 'Jump straight to retained verifier commands after hello-world.')
  mutatedGettingStarted = `${mutatedGettingStarted}\n\nDirect proof rail: bash scripts/verify-m047-s04.sh\n`
  writeTo(tmpRoot, files.gettingStarted, mutatedGettingStarted)

  let mutatedDistributed = readFrom(tmpRoot, files.distributed)
  mutatedDistributed = mutatedDistributed.replace(distributedFlyBoundaryMarker, 'required Fly deploy target')
  mutatedDistributed = `${mutatedDistributed}\n\nCLUSTER_PROOF_FLY_APP=mesh-cluster-proof\n`
  writeTo(tmpRoot, files.distributed, mutatedDistributed)

  const errors = validateS04DocsReferenceContract(tmpRoot)
  assert.ok(errors.some((error) => error.includes(`${files.gettingStarted} missing ${JSON.stringify(gettingStartedProofHandoff)}`) || error.includes(`${files.gettingStarted} drifted order around ${JSON.stringify(gettingStartedProofHandoff)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.gettingStarted} still contains stale text ${JSON.stringify('bash scripts/verify-m047-s04.sh')}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.distributed} missing ${JSON.stringify(distributedFlyBoundaryMarker)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.distributed} still contains stale text ${JSON.stringify('CLUSTER_PROOF_FLY_APP=')}`)), errors.join('\n'))
})

test('contract fails closed when retained Fly assets stop pinning retained-reference wording', (t) => {
  const tmpRoot = mkTmpDir(t, 'verify-m053-s04-fly-assets-')
  copyAllFiles(tmpRoot)

  let mutatedReadme = readFrom(tmpRoot, files.clusterProofReadme)
  mutatedReadme = mutatedReadme.replace(clusterProofStarterBoundary, 'It is the public starter surface')
  mutatedReadme = mutatedReadme.replace(clusterProofScopeMarker, 'required deploy environment')
  writeTo(tmpRoot, files.clusterProofReadme, mutatedReadme)

  let mutatedFlyVerifier = readFrom(tmpRoot, files.flyVerifier)
  mutatedFlyVerifier = mutatedFlyVerifier.replace(flyHelpIntro, 'Read-only Fly verifier for the public starter rail.')
  mutatedFlyVerifier = mutatedFlyVerifier.replace(flyHelpBoundary, 'This help surface defines the public starter surface.')
  writeTo(tmpRoot, files.flyVerifier, mutatedFlyVerifier)

  let mutatedClusterProofTests = readFrom(tmpRoot, files.clusterProofTests)
  mutatedClusterProofTests = mutatedClusterProofTests.replace(
    'assert_contains(readme, "It is not a public starter surface")',
    'assert_contains(readme, "It is the public starter surface")',
  )
  writeTo(tmpRoot, files.clusterProofTests, mutatedClusterProofTests)

  const errors = validateS04DocsReferenceContract(tmpRoot)
  assert.ok(errors.some((error) => error.includes(`${files.clusterProofReadme} missing ${JSON.stringify(clusterProofStarterBoundary)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.clusterProofReadme} missing ${JSON.stringify(clusterProofScopeMarker)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.flyVerifier} missing ${JSON.stringify(flyHelpIntro)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.flyVerifier} missing ${JSON.stringify(flyHelpBoundary)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.clusterProofTests} missing ${JSON.stringify('assert_contains(readme, "It is not a public starter surface")')}`)), errors.join('\n'))
})

test('contract fails closed on corrupted public doc tails and duplicated trailing lines', (t) => {
  const tmpRoot = mkTmpDir(t, 'verify-m053-s04-doc-corruption-')
  copyAllFiles(tmpRoot)

  let mutatedTooling = readFrom(tmpRoot, files.tooling)
  mutatedTooling = mutatedTooling.replace(
    toolingNextStepLine,
    `${toolingNextStepLine}\n/) -- building distributed systems with Mesh\nng distributed systems with Mesh\n${toolingNextStepLine}`,
  )
  writeTo(tmpRoot, files.tooling, mutatedTooling)

  const errors = validateS04DocsReferenceContract(tmpRoot)
  assert.ok(errors.some((error) => error.includes(`${files.tooling} expected 1 exact line(s) ${JSON.stringify(toolingNextStepLine)}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.tooling} expected 0 exact line(s) ${JSON.stringify('/) -- building distributed systems with Mesh')}`)), errors.join('\n'))
  assert.ok(errors.some((error) => error.includes(`${files.tooling} expected 0 exact line(s) ${JSON.stringify('ng distributed systems with Mesh')}`)), errors.join('\n'))
})

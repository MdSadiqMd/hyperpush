import {
  MOCK_EVENT_SERIES,
  MOCK_ISSUES,
  MOCK_STATS,
  type Breadcrumb,
  type Issue,
  type IssueStatus,
  type Severity,
  type StackFrame,
} from '@/lib/mock-data'
import {
  MesherApiError,
  type MesherApiRecord,
  type MesherDashboardBootstrapPayload,
  type MesherEventDetailResponse,
  type MesherIssueEventSummary,
  type MesherIssueTimelineEntry,
} from '@/lib/mesher-api'

export type IssuesOverviewSource = 'live' | 'mixed' | 'fallback'
export type IssueSummaryFieldSource = 'live' | 'derived-live' | 'fallback'

export interface IssueRecentEvent {
  id: string
  level: Breadcrumb['level']
  message: string
  time: string
}

export interface HydratedIssueDetailSnapshot {
  issue: Issue
  latestEventId: string
  recentEvents: IssueRecentEvent[]
  source: IssuesOverviewSource
}

export interface IssuesOverviewSnapshot {
  issues: Issue[]
  stats: typeof MOCK_STATS
  statsSources: Record<keyof typeof MOCK_STATS, IssueSummaryFieldSource>
  eventSeries: typeof MOCK_EVENT_SERIES
  sources: {
    issues: IssuesOverviewSource
    stats: IssuesOverviewSource
    chart: IssuesOverviewSource
    overall: IssuesOverviewSource
  }
  liveIssueCount: number
}

const LIVE_PROJECT_LABEL = 'default'
const DEFAULT_ZERO_SERIES_POINTS = 12
const RECENT_EVENT_LIMIT = 5

const ISSUE_TEMPLATE_BY_ID = new Map(MOCK_ISSUES.map((issue) => [issue.id, issue] as const))
const FALLBACK_ISSUE_TEMPLATE = MOCK_ISSUES[0]
const FALLBACK_CHART_LABELS = MOCK_EVENT_SERIES.slice(-DEFAULT_ZERO_SERIES_POINTS).map((point) => point.time)

function collapseSources(...sources: IssuesOverviewSource[]): IssuesOverviewSource {
  if (sources.every((source) => source === 'live')) {
    return 'live'
  }

  if (sources.every((source) => source === 'fallback')) {
    return 'fallback'
  }

  return 'mixed'
}

function collapseSummaryFieldSources(
  sources: IssueSummaryFieldSource[],
): IssuesOverviewSource {
  if (sources.every((source) => source === 'live')) {
    return 'live'
  }

  if (sources.every((source) => source === 'fallback')) {
    return 'fallback'
  }

  return 'mixed'
}

function toNonEmptyString(value: unknown): string | null {
  return typeof value === 'string' && value.trim().length > 0 ? value.trim() : null
}

function toNumber(value: unknown): number | null {
  if (typeof value === 'number' && Number.isFinite(value)) {
    return value
  }

  if (typeof value === 'string' && value.trim().length > 0) {
    const parsed = Number(value)
    return Number.isFinite(parsed) ? parsed : null
  }

  return null
}

function toNonNegativeInteger(value: unknown): number | null {
  const numeric = toNumber(value)
  if (numeric === null) {
    return null
  }

  return Math.max(0, Math.round(numeric))
}

function relativeTimeFromIso(value: unknown, fallback: string): string {
  const raw = toNonEmptyString(value)
  if (!raw) {
    return fallback
  }

  const timestamp = Date.parse(raw)
  if (!Number.isFinite(timestamp)) {
    return fallback
  }

  const diffMinutes = Math.max(0, Math.floor((Date.now() - timestamp) / 60_000))

  if (diffMinutes < 1) {
    return 'just now'
  }

  if (diffMinutes < 60) {
    return `${diffMinutes}m ago`
  }

  const diffHours = Math.floor(diffMinutes / 60)
  if (diffHours < 24) {
    return `${diffHours}h ago`
  }

  const diffDays = Math.floor(diffHours / 24)
  return `${diffDays}d ago`
}

function hashString(value: string): number {
  let hash = 0
  for (let index = 0; index < value.length; index += 1) {
    hash = (hash * 31 + value.charCodeAt(index)) >>> 0
  }
  return hash
}

function pickOverlayTemplate(issueId: string, index: number): Issue {
  const directTemplate = ISSUE_TEMPLATE_BY_ID.get(issueId)
  if (directTemplate) {
    return directTemplate
  }

  if (MOCK_ISSUES.length === 0) {
    return FALLBACK_ISSUE_TEMPLATE
  }

  return MOCK_ISSUES[(hashString(issueId || `issue-${index}`) + index) % MOCK_ISSUES.length]
}

function normalizeIssueSeverity(level: unknown, fallback: Severity): Severity {
  switch (toNonEmptyString(level)?.toLowerCase()) {
    case 'fatal':
      return 'critical'
    case 'error':
      return 'high'
    case 'warning':
      return 'medium'
    case 'info':
    case 'debug':
      return 'low'
    default:
      return fallback
  }
}

function normalizeIssueStatus(status: unknown, fallback: IssueStatus): IssueStatus {
  switch (toNonEmptyString(status)?.toLowerCase()) {
    case 'unresolved':
      return 'open'
    case 'resolved':
      return 'resolved'
    case 'archived':
      return 'ignored'
    default:
      return fallback
  }
}

function normalizeBreadcrumbLevel(level: unknown): Breadcrumb['level'] {
  switch (toNonEmptyString(level)?.toLowerCase()) {
    case 'error':
    case 'fatal':
      return 'error'
    case 'warning':
      return 'warning'
    default:
      return 'info'
  }
}

function buildIssueSubtitle(template: Issue, row: MesherApiRecord): string {
  const level = toNonEmptyString(row.level)
  const status = toNonEmptyString(row.status)

  if (!level || !status) {
    return template.subtitle
  }

  return `Mesher ${status} issue · ${level} severity · fallback shell details preserved`
}

function adaptLiveIssue(row: MesherApiRecord, index: number): Issue {
  const liveId = toNonEmptyString(row.id) ?? `mesher-live-${index + 1}`
  const template = pickOverlayTemplate(liveId, index)

  return {
    ...template,
    id: liveId,
    title: toNonEmptyString(row.title) ?? template.title,
    subtitle: buildIssueSubtitle(template, row),
    severity: normalizeIssueSeverity(row.level, template.severity),
    status: normalizeIssueStatus(row.status, template.status),
    count: toNonNegativeInteger(row.event_count) ?? template.count,
    project: LIVE_PROJECT_LABEL,
    firstSeen: relativeTimeFromIso(row.first_seen, template.firstSeen),
    lastSeen: relativeTimeFromIso(row.last_seen, template.lastSeen),
    assignee: toNonEmptyString(row.assigned_to) ?? template.assignee,
  }
}

function buildFallbackRatios() {
  const totals = MOCK_EVENT_SERIES.reduce(
    (accumulator, point) => ({
      critical: accumulator.critical + point.critical,
      high: accumulator.high + point.high,
      medium: accumulator.medium + point.medium,
      low: accumulator.low + point.low,
    }),
    { critical: 0, high: 0, medium: 0, low: 0 },
  )

  return normalizeRatios(totals)
}

function normalizeRatios(counts: Record<'critical' | 'high' | 'medium' | 'low', number>) {
  const total = counts.critical + counts.high + counts.medium + counts.low

  if (total <= 0) {
    return { critical: 0.25, high: 0.3, medium: 0.3, low: 0.15 }
  }

  return {
    critical: counts.critical / total,
    high: counts.high / total,
    medium: counts.medium / total,
    low: counts.low / total,
  }
}

function buildSeverityRatios(levels: MesherApiRecord[], issues: Issue[]) {
  const counts = { critical: 0, high: 0, medium: 0, low: 0 }

  for (const issue of issues) {
    counts[issue.severity] += 1
  }

  for (const row of levels) {
    const count = toNonNegativeInteger(row.count)
    if (count === null) {
      continue
    }

    const severity = normalizeIssueSeverity(row.level, 'low')
    counts[severity] += count
  }

  return normalizeRatios(counts)
}

function splitBucketCount(total: number, ratios: ReturnType<typeof buildFallbackRatios>) {
  const keys: Array<keyof typeof ratios> = ['critical', 'high', 'medium', 'low']
  const result = {
    critical: 0,
    high: 0,
    medium: 0,
    low: 0,
  }

  let allocated = 0
  for (const key of keys) {
    const value = Math.floor(total * ratios[key])
    result[key] = value
    allocated += value
  }

  let remainder = total - allocated
  let index = 0
  while (remainder > 0) {
    const key = keys[index % keys.length]
    result[key] += 1
    remainder -= 1
    index += 1
  }

  return result
}

function formatBucketLabel(bucket: unknown, fallback: string) {
  const raw = toNonEmptyString(bucket)
  if (!raw) {
    return fallback
  }

  return relativeTimeFromIso(raw, raw)
}

function buildZeroEventSeries() {
  return FALLBACK_CHART_LABELS.map((time) => ({
    time,
    critical: 0,
    high: 0,
    medium: 0,
    low: 0,
  }))
}

function buildEventSeries(volume: MesherApiRecord[], ratios: ReturnType<typeof buildFallbackRatios>) {
  if (volume.length === 0) {
    return {
      data: buildZeroEventSeries(),
      source: 'mixed' as IssuesOverviewSource,
    }
  }

  const data = volume.map((row, index) => {
    const fallbackPoint = MOCK_EVENT_SERIES[index % MOCK_EVENT_SERIES.length]
    const total = toNonNegativeInteger(row.count)
    const split = splitBucketCount(total ?? 0, ratios)

    return {
      time: formatBucketLabel(row.bucket, fallbackPoint?.time ?? `bucket-${index + 1}`),
      critical: split.critical,
      high: split.high,
      medium: split.medium,
      low: split.low,
    }
  })

  return {
    data,
    source: 'mixed' as IssuesOverviewSource,
  }
}

function buildStats(issues: Issue[], health: MesherApiRecord) {
  const totalEvents = toNonNegativeInteger(health.events_24h)
  const openIssues = toNonNegativeInteger(health.unresolved_count)
  const criticalIssues = issues.filter((issue) => issue.severity === 'critical' && issue.status === 'open').length
  const stats = {
    ...MOCK_STATS,
    totalEvents: totalEvents ?? MOCK_STATS.totalEvents,
    openIssues: openIssues ?? MOCK_STATS.openIssues,
    criticalIssues,
    eventsPerMin:
      totalEvents !== null
        ? Math.max(0, Math.round(totalEvents / (24 * 60)))
        : MOCK_STATS.eventsPerMin,
  }

  const fieldSources: Record<keyof typeof MOCK_STATS, IssueSummaryFieldSource> = {
    totalEvents: totalEvents === null ? 'fallback' : 'live',
    affectedUsers: 'fallback',
    mttr: 'fallback',
    crashFreeSessions: 'fallback',
    openIssues: openIssues === null ? 'fallback' : 'live',
    criticalIssues: 'derived-live',
    eventsPerMin: totalEvents === null ? 'fallback' : 'derived-live',
    uptime: 'fallback',
  }

  return {
    data: stats,
    fieldSources,
    source: collapseSummaryFieldSources(Object.values(fieldSources)),
  }
}

function isRecord(value: unknown): value is MesherApiRecord {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function expectRecord(value: unknown, path: string, message: string): MesherApiRecord {
  if (!isRecord(value)) {
    throw new MesherApiError('invalid-payload', path, message)
  }

  return value
}

function expectRecordOrNull(value: unknown, path: string, message: string): MesherApiRecord | null {
  if (value === null || value === undefined) {
    return null
  }

  return expectRecord(value, path, message)
}

function expectRecordArray(value: unknown, path: string, message: string): MesherApiRecord[] {
  if (!Array.isArray(value) || value.some((entry) => !isRecord(entry))) {
    throw new MesherApiError('invalid-payload', path, message)
  }

  return value as MesherApiRecord[]
}

function buildTagLabels(tags: MesherApiRecord, fallback: string[]) {
  const liveTags = Object.entries(tags)
    .map(([key, value]) => {
      const textValue = toNonEmptyString(value)
      if (!textValue) {
        return null
      }

      return `${key}:${textValue}`
    })
    .filter((value): value is string => value !== null)

  return liveTags.length > 0 ? liveTags.slice(0, 6) : fallback
}

function pickEnvironment(tags: MesherApiRecord, extra: MesherApiRecord, fallback: string) {
  return (
    toNonEmptyString(tags.environment) ??
    toNonEmptyString(tags.env) ??
    toNonEmptyString(extra.environment) ??
    fallback
  )
}

function pickFilePath(frames: StackFrame[], fallback: string) {
  const preferredFrame = frames.find((frame) => frame.isApp) ?? frames[0]
  if (!preferredFrame) {
    return fallback
  }

  return `${preferredFrame.file}:${preferredFrame.line}`
}

function buildLiveSubtitle(baseIssue: Issue, latestEvent: MesherIssueEventSummary, detail: MesherEventDetailResponse) {
  const liveMessage = toNonEmptyString(detail.event.message) ?? toNonEmptyString(latestEvent.message)
  if (!liveMessage) {
    return baseIssue.subtitle
  }

  if (liveMessage === baseIssue.title) {
    return 'Latest Mesher event detail loaded · mock shell fields remain visible where unsupported'
  }

  return liveMessage
}

function adaptLiveStacktrace(value: unknown, fallback: StackFrame[], detailPath: string): StackFrame[] {
  const rows = expectRecordArray(value, detailPath, 'Expected event stacktrace to be an array of frame objects')

  const liveFrames = rows
    .map((frame) => {
      const file = toNonEmptyString(frame.filename)
      const fn = toNonEmptyString(frame.function_name)
      const contextLine = toNonEmptyString(frame.context_line)
      const line = toNonNegativeInteger(frame.lineno)
      const col = toNonNegativeInteger(frame.colno) ?? 0

      if (!file || !fn || !contextLine || line === null) {
        return null
      }

      return {
        file,
        fn,
        line,
        col,
        code: [contextLine],
        highlight: 0,
        isApp: Boolean(frame.in_app),
      } satisfies StackFrame
    })
    .filter((frame): frame is StackFrame => frame !== null)

  return liveFrames.length > 0 ? liveFrames : fallback
}

function adaptLiveBreadcrumbs(
  value: unknown,
  fallback: Breadcrumb[],
  detailPath: string,
): Breadcrumb[] {
  const rows = expectRecordArray(value, detailPath, 'Expected event breadcrumbs to be an array of breadcrumb objects')

  const liveBreadcrumbs = rows
    .map((breadcrumb) => {
      const timestamp = toNonEmptyString(breadcrumb.timestamp)
      const category = toNonEmptyString(breadcrumb.category)
      const message = toNonEmptyString(breadcrumb.message)

      if (!timestamp || !category || !message) {
        return null
      }

      return {
        time: relativeTimeFromIso(timestamp, timestamp),
        type: category,
        message,
        level: normalizeBreadcrumbLevel(breadcrumb.level),
      } satisfies Breadcrumb
    })
    .filter((breadcrumb): breadcrumb is Breadcrumb => breadcrumb !== null)

  return liveBreadcrumbs.length > 0 ? liveBreadcrumbs : fallback
}

function adaptRecentEvents(timeline: MesherIssueTimelineEntry[], timelinePath: string): IssueRecentEvent[] {
  const liveTimeline = timeline.map((entry, index) => {
    const id = toNonEmptyString(entry.id)
    const receivedAt = toNonEmptyString(entry.received_at)

    if (!id || !receivedAt) {
      throw new MesherApiError(
        'invalid-payload',
        timelinePath,
        `Expected timeline entry ${index + 1} to include id and received_at strings`,
      )
    }

    return {
      id,
      level: normalizeBreadcrumbLevel(entry.level),
      message: toNonEmptyString(entry.message) ?? 'Recent Mesher event',
      time: relativeTimeFromIso(receivedAt, receivedAt),
      timestamp: Date.parse(receivedAt),
    }
  })

  return liveTimeline
    .toSorted((left, right) => (Number.isFinite(right.timestamp) ? right.timestamp : 0) - (Number.isFinite(left.timestamp) ? left.timestamp : 0))
    .slice(0, RECENT_EVENT_LIMIT)
    .map(({ timestamp: _timestamp, ...entry }) => entry)
}

function pickFirstSeen(timeline: MesherIssueTimelineEntry[], fallback: string) {
  const timestamps = timeline
    .map((entry) => Date.parse(entry.received_at))
    .filter((timestamp) => Number.isFinite(timestamp))

  if (timestamps.length === 0) {
    return fallback
  }

  const oldest = Math.min(...timestamps)
  return relativeTimeFromIso(new Date(oldest).toISOString(), fallback)
}

export function buildFallbackIssuesOverview(): IssuesOverviewSnapshot {
  return {
    issues: MOCK_ISSUES,
    stats: MOCK_STATS,
    statsSources: {
      totalEvents: 'fallback',
      affectedUsers: 'fallback',
      mttr: 'fallback',
      crashFreeSessions: 'fallback',
      openIssues: 'fallback',
      criticalIssues: 'fallback',
      eventsPerMin: 'fallback',
      uptime: 'fallback',
    },
    eventSeries: MOCK_EVENT_SERIES,
    liveIssueCount: 0,
    sources: {
      issues: 'fallback',
      stats: 'fallback',
      chart: 'fallback',
      overall: 'fallback',
    },
  }
}

export function adaptMesherDashboardBootstrap(
  payload: MesherDashboardBootstrapPayload,
): IssuesOverviewSnapshot {
  const issues = payload.issues.data.map((row, index) => adaptLiveIssue(row, index))
  const issuesSource: IssuesOverviewSource = 'mixed'
  const ratios = payload.levels.length > 0 ? buildSeverityRatios(payload.levels, issues) : buildFallbackRatios()
  const stats = buildStats(issues, payload.health)
  const chart = buildEventSeries(payload.volume, ratios)

  return {
    issues,
    stats: stats.data,
    statsSources: stats.fieldSources,
    eventSeries: chart.data,
    liveIssueCount: payload.issues.data.length,
    sources: {
      issues: issuesSource,
      stats: stats.source,
      chart: chart.source,
      overall: collapseSources(issuesSource, stats.source, chart.source),
    },
  }
}

export function adaptMesherSelectedIssueDetail(
  baseIssue: Issue,
  latestEvent: MesherIssueEventSummary,
  detail: MesherEventDetailResponse,
  timeline: MesherIssueTimelineEntry[],
): HydratedIssueDetailSnapshot {
  const detailPath = `/api/v1/events/${latestEvent.id}`
  const timelinePath = `/api/v1/issues/${baseIssue.id}/timeline`
  const event = expectRecord(detail.event, detailPath, 'Expected event detail event payload to be an object')
  const tags = expectRecord(event.tags, detailPath, 'Expected event detail tags to be an object')
  const extra = expectRecord(event.extra, detailPath, 'Expected event detail extra to be an object')
  const _userContext = expectRecordOrNull(
    event.user_context,
    detailPath,
    'Expected event detail user_context to be an object or null',
  )

  const stacktrace = adaptLiveStacktrace(event.stacktrace, baseIssue.stacktrace, detailPath)
  const breadcrumbs = adaptLiveBreadcrumbs(event.breadcrumbs, baseIssue.breadcrumbs, detailPath)
  const recentEvents = adaptRecentEvents(timeline, timelinePath)

  return {
    issue: {
      ...baseIssue,
      subtitle: buildLiveSubtitle(baseIssue, latestEvent, detail),
      severity: normalizeIssueSeverity(event.level, baseIssue.severity),
      file: pickFilePath(stacktrace, baseIssue.file),
      environment: pickEnvironment(tags, extra, baseIssue.environment),
      tags: buildTagLabels(tags, baseIssue.tags),
      stacktrace,
      breadcrumbs,
      firstSeen: pickFirstSeen(timeline, baseIssue.firstSeen),
      lastSeen: relativeTimeFromIso(event.received_at, baseIssue.lastSeen),
    },
    latestEventId: latestEvent.id,
    recentEvents,
    source: 'mixed',
  }
}

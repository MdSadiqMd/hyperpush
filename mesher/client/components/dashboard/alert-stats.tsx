"use client"

import type {
  AlertSummaryFieldSource,
  AlertOverviewSource,
  AlertsOverviewStats,
} from '@/lib/admin-ops-live-adapter'
import { Bell, CheckCircle2, Clock, Activity, AlertTriangle, LoaderCircle, ShieldAlert } from 'lucide-react'
import { cn } from '@/lib/utils'

interface StatCardProps {
  label: string
  value: string | number
  sub?: string
  icon: React.ElementType
  accent?: 'green' | 'red' | 'yellow' | 'default'
  source: AlertSummaryFieldSource
  testId: string
}

interface AlertStatsBarProps {
  stats: AlertsOverviewStats
  statSources: Record<keyof AlertsOverviewStats, AlertSummaryFieldSource>
  bootstrapState: 'loading' | 'ready' | 'failed'
  bootstrapErrorCode: string | null
  overviewSource: AlertOverviewSource
  compact?: boolean
}

function formatSummarySourceLabel(source: AlertSummaryFieldSource) {
  switch (source) {
    case 'live':
      return 'live'
    case 'derived-live':
      return 'derived live'
    case 'fallback':
    default:
      return 'fallback'
  }
}

function getOverviewBannerText(
  bootstrapState: AlertStatsBarProps['bootstrapState'],
  overviewSource: AlertOverviewSource,
  bootstrapErrorCode: string | null,
) {
  if (bootstrapState === 'loading') {
    return 'Bootstrapping live alerts through same-origin /api/v1…'
  }

  if (bootstrapState === 'failed') {
    return `Fallback alerts active · live bootstrap failed (${bootstrapErrorCode ?? 'unknown'})`
  }

  if (overviewSource === 'mixed') {
    return 'Live alerts active · unsupported alert fields stay visibly shell-backed'
  }

  if (overviewSource === 'live') {
    return 'Live Mesher alerts active'
  }

  return 'Fallback alerts active'
}

function StatCard({ label, value, sub, icon: Icon, accent = 'default', source, testId }: StatCardProps) {
  const isGreen = accent === 'green'
  const isRed = accent === 'red'
  const isYellow = accent === 'yellow'

  return (
    <div
      className={cn(
        'relative flex-1 px-4 py-3',
        isRed && 'bg-[var(--red)]/[0.03]',
        isYellow && 'bg-[var(--yellow)]/[0.03]',
      )}
      data-source={source}
      data-testid={testId}
    >
      {(isRed || isYellow) && (
        <div
          className={cn(
            'absolute left-4 right-4 top-0 h-px bg-gradient-to-r from-transparent to-transparent',
            isRed && 'via-[var(--red)]/30',
            isYellow && 'via-[var(--yellow)]/30',
          )}
        />
      )}
      <div className="mb-2 flex items-center justify-between gap-2">
        <span className="truncate text-[10px] font-semibold uppercase tracking-[0.08em] text-[var(--text-tertiary)]">
          {label}
        </span>
        <div className="flex items-center gap-1.5">
          <span
            className="rounded px-1.5 py-[2px] text-[9px] font-semibold uppercase tracking-[0.08em] text-[var(--text-faint)] ring-1 ring-inset ring-[var(--line)]"
            data-testid={`${testId}-source`}
          >
            {formatSummarySourceLabel(source)}
          </span>
          <Icon
            size={12}
            className={cn(
              'shrink-0',
              isGreen && 'text-[var(--green)]',
              isRed && 'text-[var(--red)]',
              isYellow && 'text-[var(--yellow)]',
              !isGreen && !isRed && !isYellow && 'text-[var(--text-faint)]',
            )}
          />
        </div>
      </div>
      <div className="flex items-end gap-1.5">
        <span
          className={cn(
            'text-[20px] font-bold leading-none tracking-tight tabular-nums',
            isGreen && 'text-[var(--green)]',
            isRed && 'text-[var(--red)]',
            isYellow && 'text-[var(--yellow)]',
            !isGreen && !isRed && !isYellow && 'text-[var(--text-primary)]',
          )}
        >
          {value}
        </span>
        {sub && <span className="mb-0.5 text-[10px] text-[var(--text-secondary)]">{sub}</span>}
      </div>
    </div>
  )
}

export function AlertStatsBar({
  stats,
  statSources,
  bootstrapState,
  bootstrapErrorCode,
  overviewSource,
  compact = false,
}: AlertStatsBarProps) {
  const bannerText = getOverviewBannerText(bootstrapState, overviewSource, bootstrapErrorCode)

  return (
    <div
      className={cn(
        'grid border-b border-[var(--line)] bg-[var(--surface)]',
        compact ? 'grid-cols-4' : 'grid-cols-2 md:grid-cols-4 lg:grid-cols-7',
      )}
      data-bootstrap-error-code={bootstrapErrorCode ?? ''}
      data-bootstrap-state={bootstrapState}
      data-source={overviewSource}
      data-testid="alerts-stats-bar"
      style={{ boxShadow: 'var(--shadow-inset-subtle)' }}
    >
      <div className="col-span-full flex items-center justify-between border-b border-[var(--line)] px-4 py-2">
        <span className="text-[10px] font-medium uppercase tracking-[0.08em] text-[var(--text-secondary)]">
          {bootstrapState === 'loading' ? <LoaderCircle className="mr-1 inline-block animate-spin" size={10} /> : null}
          {bannerText}
        </span>
        <span className="text-[10px] text-[var(--text-faint)]">Overview source: {overviewSource}</span>
      </div>

      <StatCard
        accent="red"
        icon={Bell}
        label="Firing"
        source={statSources.firing}
        testId="alerts-stat-card-firing"
        value={stats.firing}
      />
      <StatCard
        accent="yellow"
        icon={ShieldAlert}
        label="Acknowledged"
        source={statSources.acknowledged}
        testId="alerts-stat-card-acknowledged"
        value={stats.acknowledged}
      />
      <StatCard
        accent="green"
        icon={CheckCircle2}
        label="Resolved"
        source={statSources.resolved}
        testId="alerts-stat-card-resolved"
        value={stats.resolved}
      />
      <StatCard
        icon={Activity}
        label="Total Alerts"
        source={statSources.totalAlerts}
        testId="alerts-stat-card-total-alerts"
        value={stats.totalAlerts}
      />
      {!compact && (
        <StatCard
          icon={Clock}
          label="MTTA"
          source={statSources.mtta}
          testId="alerts-stat-card-mtta"
          value={stats.mtta}
        />
      )}
      {!compact && (
        <StatCard
          icon={Clock}
          label="Avg Resolution"
          source={statSources.avgResolutionTime}
          testId="alerts-stat-card-avg-resolution"
          value={stats.avgResolutionTime}
        />
      )}
      {!compact && (
        <StatCard
          icon={AlertTriangle}
          label="Avg Firing"
          source={statSources.avgFiringDuration}
          testId="alerts-stat-card-avg-firing"
          value={stats.avgFiringDuration}
        />
      )}
    </div>
  )
}

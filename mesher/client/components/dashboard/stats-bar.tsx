"use client"

import { useDashboardIssuesState } from "@/components/dashboard/dashboard-issues-state"
import type { IssueSummaryFieldSource } from "@/lib/issues-live-adapter"
import { AlertTriangle, Users, Clock, Activity, Zap, TrendingUp } from "lucide-react"
import { cn } from "@/lib/utils"

interface StatCardProps {
  label: string
  value: string | number
  sub?: string
  icon: React.ElementType
  accent?: "green" | "red" | "default"
  source: IssueSummaryFieldSource
  testId: string
}

function formatSummarySourceLabel(source: IssueSummaryFieldSource) {
  switch (source) {
    case "live":
      return "live"
    case "derived-live":
      return "derived live"
    case "fallback":
    default:
      return "fallback"
  }
}

function StatCard({ label, value, sub, icon: Icon, accent = "default", source, testId }: StatCardProps) {
  const isGreen = accent === "green"
  const isRed = accent === "red"

  return (
    <div
      className={cn(
        "relative flex-1 px-4 py-3",
        isRed && "bg-[var(--red)]/[0.03]",
      )}
      data-source={source}
      data-testid={testId}
    >
      {isRed && (
        <div className="absolute top-0 left-4 right-4 h-px bg-gradient-to-r from-transparent via-[var(--red)]/30 to-transparent" />
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
              "shrink-0",
              isGreen && "text-[var(--green)]",
              isRed && "text-[var(--red)]",
              !isGreen && !isRed && "text-[var(--text-faint)]",
            )}
          />
        </div>
      </div>
      <div className="flex items-end gap-1.5">
        <span
          className={cn(
            "text-[20px] font-bold leading-none tracking-tight tabular-nums",
            isGreen && "text-[var(--green)]",
            isRed && "text-[var(--red)]",
            !isGreen && !isRed && "text-[var(--text-primary)]",
          )}
        >
          {value}
        </span>
        {sub && <span className="mb-0.5 text-[10px] text-[var(--text-secondary)]">{sub}</span>}
      </div>
    </div>
  )
}

interface StatsBarProps {
  compact?: boolean
}

function getOverviewBannerText(
  bootstrapState: ReturnType<typeof useDashboardIssuesState>["bootstrapState"],
  overviewSource: ReturnType<typeof useDashboardIssuesState>["overviewSource"],
  statsSource: ReturnType<typeof useDashboardIssuesState>["statsSource"],
  bootstrapErrorCode: string | null,
) {
  if (bootstrapState === "loading") {
    return "Bootstrapping live Mesher overview through same-origin /api/v1…"
  }

  if (bootstrapState === "failed") {
    return `Fallback overview active · live bootstrap failed (${bootstrapErrorCode ?? "unknown"})`
  }

  if (overviewSource === "mixed" && statsSource === "mixed") {
    return "Live overview active · unsupported summary cards stay visibly fallback-backed"
  }

  if (overviewSource === "mixed") {
    return "Live overview active · mock overlay fills unsupported shell fields"
  }

  if (overviewSource === "live") {
    return "Live Mesher overview active"
  }

  return "Fallback overview active"
}

export function StatsBar({ compact = false }: StatsBarProps) {
  const { stats, statsFieldSources, bootstrapState, bootstrapError, statsSource, overviewSource } = useDashboardIssuesState()
  const bannerText = getOverviewBannerText(bootstrapState, overviewSource, statsSource, bootstrapError?.code ?? null)

  return (
    <div
      className={cn(
        "grid border-b border-[var(--line)] bg-[var(--surface)]",
        compact ? "grid-cols-4" : "grid-cols-2 md:grid-cols-4 lg:grid-cols-6 xl:grid-cols-7",
      )}
      data-bootstrap-error-code={bootstrapError?.code ?? ""}
      data-bootstrap-state={bootstrapState}
      data-source={statsSource}
      data-testid="issues-stats-bar"
      style={{ boxShadow: "var(--shadow-inset-subtle)" }}
    >
      <div className="col-span-full flex items-center justify-between border-b border-[var(--line)] px-4 py-2">
        <span className="text-[10px] font-medium uppercase tracking-[0.08em] text-[var(--text-secondary)]">
          {bannerText}
        </span>
        <span className="text-[10px] text-[var(--text-faint)]">Overview source: {overviewSource}</span>
      </div>

      <StatCard
        icon={Activity}
        label="Total Events"
        source={statsFieldSources.totalEvents}
        sub="last 24h"
        testId="issues-stat-card-total-events"
        value={stats.totalEvents.toLocaleString()}
      />
      <StatCard
        icon={Users}
        label="Affected Users"
        source={statsFieldSources.affectedUsers}
        testId="issues-stat-card-affected-users"
        value={stats.affectedUsers.toLocaleString()}
      />
      <StatCard
        accent="red"
        icon={AlertTriangle}
        label="Critical Issues"
        source={statsFieldSources.criticalIssues}
        testId="issues-stat-card-critical-issues"
        value={stats.criticalIssues}
      />
      <StatCard
        icon={TrendingUp}
        label="Open Issues"
        source={statsFieldSources.openIssues}
        testId="issues-stat-card-open-issues"
        value={stats.openIssues}
      />
      <StatCard
        icon={Clock}
        label="MTTR"
        source={statsFieldSources.mttr}
        testId="issues-stat-card-mttr"
        value={stats.mttr}
      />
      <StatCard
        accent="green"
        icon={Zap}
        label="Events/min"
        source={statsFieldSources.eventsPerMin}
        testId="issues-stat-card-events-per-min"
        value={stats.eventsPerMin}
      />
      <StatCard
        accent="green"
        icon={Activity}
        label="Crash-Free"
        source={statsFieldSources.crashFreeSessions}
        testId="issues-stat-card-crash-free"
        value={stats.crashFreeSessions}
      />
    </div>
  )
}

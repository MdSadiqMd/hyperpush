"use client"

import { useCallback, useEffect, useRef, useState } from "react"
import { EventsChart } from "@/components/dashboard/events-chart"
import { FilterBar } from "@/components/dashboard/header"
import { IssueDetail } from "@/components/dashboard/issue-detail"
import { IssueList } from "@/components/dashboard/issue-list"
import { StatsBar } from "@/components/dashboard/stats-bar"
import { useDashboardIssuesState } from "@/components/dashboard/dashboard-issues-state"
import { useDashboardShell } from "@/components/dashboard/dashboard-shell"
import type { Issue } from "@/lib/mock-data"

function ProofHarnessButton({
  testId,
  label,
  action,
  issueId,
  disabled,
  onTrigger,
}: {
  testId: string
  label: string
  action: string
  issueId: string
  disabled: boolean
  onTrigger: (issueId: string, action: string) => void
}) {
  return (
    <button
      className="inline-flex items-center rounded-md border border-[var(--line)] bg-[var(--surface-2)] px-2.5 py-1 text-[11px] font-medium text-[var(--text-secondary)] transition-colors hover:bg-[var(--surface-3)] hover:text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
      data-action={action}
      data-testid={testId}
      disabled={disabled}
      onClick={() => onTrigger(issueId, action)}
      type="button"
    >
      {label}
    </button>
  )
}

export function IssuesPage() {
  const { toggleAI } = useDashboardShell()
  const {
    search,
    statusFilter,
    severityFilter,
    selectedIssueId,
    selectedIssue,
    selectedIssueState,
    selectedIssueSource,
    selectedIssueLatestEventId,
    selectedIssueRecentEvents,
    selectedIssueError,
    filteredIssues,
    bootstrapState,
    bootstrapError,
    liveIssueCount,
    overviewSource,
    statsSource,
    chartSource,
    issueMutationPhase,
    issueMutationError,
    lastIssueAction,
    lastIssueActionIssueId,
    isIssueMutationPending,
    setSearch,
    setStatusFilter,
    setSeverityFilter,
    selectIssue,
    clearSelectedIssue,
    runIssueAction,
  } = useDashboardIssuesState()

  const [closingIssue, setClosingIssue] = useState<Issue | null>(null)
  const closeTimeoutRef = useRef<number | null>(null)
  const [isClosingIssuePanel, setIsClosingIssuePanel] = useState(false)

  const clearPendingClose = useCallback(() => {
    if (closeTimeoutRef.current !== null) {
      window.clearTimeout(closeTimeoutRef.current)
      closeTimeoutRef.current = null
    }
  }, [])

  useEffect(() => {
    return () => {
      clearPendingClose()
    }
  }, [clearPendingClose])

  useEffect(() => {
    if (selectedIssue) {
      clearPendingClose()
      setClosingIssue(null)
      setIsClosingIssuePanel(false)
    }
  }, [clearPendingClose, selectedIssue])

  const closeIssuePanel = useCallback(() => {
    if (!selectedIssue) {
      clearSelectedIssue()
      return
    }

    clearPendingClose()
    setClosingIssue(selectedIssue)
    setIsClosingIssuePanel(true)
    closeTimeoutRef.current = window.setTimeout(() => {
      clearSelectedIssue()
      setClosingIssue(null)
      setIsClosingIssuePanel(false)
      closeTimeoutRef.current = null
    }, 150)
  }, [clearPendingClose, clearSelectedIssue, selectedIssue])

  const handleSelectIssue = useCallback(
    (id: string) => {
      if (selectedIssueId === id) {
        closeIssuePanel()
        return
      }

      clearPendingClose()
      setClosingIssue(null)
      setIsClosingIssuePanel(false)
      selectIssue(id)
    },
    [clearPendingClose, closeIssuePanel, selectIssue, selectedIssueId],
  )

  const handleIssueAction = useCallback(
    (issueId: string, action: string) => {
      void runIssueAction(issueId, action)
    },
    [runIssueAction],
  )

  const detailIssue = selectedIssue ?? closingIssue
  const hasIssuePanel = detailIssue !== null
  const detailState = detailIssue ? selectedIssueState : "idle"
  const detailSource = detailIssue ? selectedIssueSource : "none"
  const detailErrorCode = detailIssue ? selectedIssueError?.code ?? null : null
  const proofHarnessIssueId = selectedIssueId ?? detailIssue?.id ?? ""

  return (
    <>
      <div
        className="flex min-h-0 min-w-0 flex-1 flex-col overflow-x-hidden overflow-y-auto transition-all duration-200 ease-out"
        data-bootstrap-error-code={bootstrapError?.code ?? ""}
        data-bootstrap-state={bootstrapState}
        data-chart-source={chartSource}
        data-has-detail-panel={hasIssuePanel ? "true" : "false"}
        data-issue-action-error-code={issueMutationError?.code ?? ""}
        data-issue-action-error-stage={issueMutationError?.stage ?? ""}
        data-issue-action-issue-id={lastIssueActionIssueId ?? ""}
        data-issue-action-phase={issueMutationPhase}
        data-last-action={lastIssueAction ?? ""}
        data-live-issue-count={String(liveIssueCount)}
        data-overview-source={overviewSource}
        data-search-value={search}
        data-selected-issue-error-code={detailErrorCode ?? ""}
        data-selected-issue-id={selectedIssue?.id ?? ""}
        data-selected-issue-source={detailSource}
        data-selected-issue-state={detailState}
        data-severity-filter={severityFilter}
        data-stats-source={statsSource}
        data-status-filter={statusFilter}
        data-testid="issues-shell"
      >
        <StatsBar compact={hasIssuePanel} />
        <EventsChart />
        <FilterBar
          onSearch={setSearch}
          onSeverityFilter={setSeverityFilter}
          onStatusFilter={setStatusFilter}
          search={search}
          severityFilter={severityFilter}
          statusFilter={statusFilter}
        />
        <IssueList
          issues={filteredIssues}
          onSelect={handleSelectIssue}
          overviewSource={overviewSource}
          selectedId={selectedIssueId}
          severityFilter={severityFilter}
          statusFilter={statusFilter}
        />
      </div>

      {detailIssue && (
        <div
          className={`relative z-10 flex w-[440px] shrink-0 flex-col overflow-hidden sm:w-[320px] md:w-[380px] ${isClosingIssuePanel ? "panel-exit" : "panel-enter"}`}
          data-action-error-code={issueMutationError?.code ?? ""}
          data-action-error-stage={issueMutationError?.stage ?? ""}
          data-action-issue-id={lastIssueActionIssueId ?? ""}
          data-action-phase={issueMutationPhase}
          data-issue-status={detailIssue.status}
          data-last-action={lastIssueAction ?? ""}
          data-latest-event-id={selectedIssueLatestEventId ?? ""}
          data-recent-event-count={String(selectedIssueRecentEvents.length)}
          data-source={detailSource}
          data-state={detailState}
          data-testid="issue-detail-panel"
          style={{ boxShadow: "var(--shadow-panel)" }}
        >
          <IssueDetail
            detailSource={detailSource}
            detailState={detailState}
            errorCode={detailErrorCode}
            isLiveActionPending={isIssueMutationPending}
            issue={detailIssue}
            lastLiveAction={lastIssueAction}
            latestEventId={selectedIssueLatestEventId}
            liveActionErrorCode={lastIssueActionIssueId === detailIssue.id ? issueMutationError?.code ?? null : null}
            liveActionIssueId={lastIssueActionIssueId}
            liveActionPhase={issueMutationPhase}
            onClose={closeIssuePanel}
            onOpenAI={toggleAI}
            onRunLiveAction={(action) => handleIssueAction(detailIssue.id, action)}
            recentEvents={selectedIssueRecentEvents}
          />

          <div
            className="border-t border-[var(--line)] bg-[var(--surface)] px-4 py-3"
            data-action-phase={issueMutationPhase}
            data-last-action={lastIssueAction ?? ""}
            data-testid="issue-action-proof-harness"
          >
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="text-[10px] font-semibold uppercase tracking-[0.08em] text-[var(--text-faint)]">
                  Provider proof rail
                </p>
                <p className="mt-1 text-[11px] leading-relaxed text-[var(--text-secondary)]">
                  Live maintainer controls now live in the action row above. This retained proof rail only exercises provider validation and error-path diagnostics that should not appear as supported maintainer actions.
                </p>
              </div>
              <span className="rounded bg-[var(--surface-2)] px-2 py-[3px] text-[10px] font-medium text-[var(--text-secondary)] ring-1 ring-inset ring-[var(--line)]">
                {issueMutationPhase}
              </span>
            </div>

            <div className="mt-3 flex flex-wrap gap-2">
              <ProofHarnessButton
                action="unsupported-proof"
                disabled={isIssueMutationPending}
                issueId={proofHarnessIssueId || "missing-live-issue-id"}
                label="Unsupported action"
                onTrigger={handleIssueAction}
                testId="issue-action-proof-unsupported"
              />
              <ProofHarnessButton
                action="resolve"
                disabled={isIssueMutationPending}
                issueId="missing-live-issue-id"
                label="Unknown issue"
                onTrigger={handleIssueAction}
                testId="issue-action-proof-unknown-issue"
              />
            </div>

            <div className="mt-3 flex flex-wrap gap-x-4 gap-y-1 text-[10px] text-[var(--text-faint)]">
              <span data-testid="issue-action-proof-last-action">last action: {lastIssueAction ?? "none"}</span>
              <span data-testid="issue-action-proof-last-issue">issue: {lastIssueActionIssueId ?? "none"}</span>
              <span data-testid="issue-action-proof-error">error: {issueMutationError?.code ?? "none"}</span>
              <span data-testid="issue-action-proof-stage">stage: {issueMutationError?.stage ?? "none"}</span>
            </div>
          </div>
        </div>
      )}
    </>
  )
}

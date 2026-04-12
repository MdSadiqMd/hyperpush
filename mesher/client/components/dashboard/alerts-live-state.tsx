"use client"

import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { toast } from '@/hooks/use-toast'
import {
  acknowledgeAlert,
  fetchDefaultProjectAlerts,
  MesherApiError,
  type MesherApiErrorCode,
  resolveAlert,
} from '@/lib/mesher-api'
import {
  adaptMesherProjectAlerts,
  buildFallbackAlertsOverview,
  type AlertOverviewSource,
  type AlertsOverviewSnapshot,
} from '@/lib/admin-ops-live-adapter'
import { type Alert, type AlertLiveAction } from '@/lib/mock-data'

export type AlertsBootstrapState = 'loading' | 'ready' | 'failed'
export type SelectedAlertState = 'idle' | 'ready'
export type SelectedAlertSource = 'none' | 'fallback' | 'mixed'
export type AlertsActionPhase = 'idle' | 'mutating' | 'refreshing' | 'failed'
export type AlertsActionStage = 'mutation' | 'overview-refresh'

export interface AlertsBootstrapError {
  code: MesherApiErrorCode
  message: string
  path: string
  status: number | null
}

export interface AlertsActionError extends AlertsBootstrapError {
  stage: AlertsActionStage
  action: AlertLiveAction | string
  alertId: string
}

const SUPPORTED_ALERT_ACTIONS = ['acknowledge', 'resolve'] as const

function isSupportedAlertAction(value: string): value is AlertLiveAction {
  return SUPPORTED_ALERT_ACTIONS.includes(value as AlertLiveAction)
}

function toBootstrapError(error: unknown): AlertsBootstrapError {
  if (error instanceof MesherApiError) {
    return {
      code: error.code,
      message: error.message,
      path: error.path,
      status: error.status,
    }
  }

  return {
    code: 'network',
    message: error instanceof Error ? error.message : 'Unknown alerts bootstrap error',
    path: '/api/v1/projects/default/alerts',
    status: null,
  }
}

function toActionError(
  error: unknown,
  stage: AlertsActionStage,
  action: AlertLiveAction | string,
  alertId: string,
): AlertsActionError {
  if (error instanceof MesherApiError) {
    return {
      code: error.code,
      message: error.message,
      path: error.path,
      status: error.status,
      stage,
      action,
      alertId,
    }
  }

  return {
    code: 'network',
    message: error instanceof Error ? error.message : 'Unknown alerts action error',
    path:
      stage === 'overview-refresh'
        ? '/api/v1/projects/default/alerts'
        : `/api/v1/alerts/${encodeURIComponent(alertId || 'unknown')}/${encodeURIComponent(action || 'unknown')}`,
    status: null,
    stage,
    action,
    alertId,
  }
}

function describeAlertAction(action: AlertLiveAction | string) {
  switch (action) {
    case 'acknowledge':
      return 'Acknowledge'
    case 'resolve':
      return 'Resolve'
    default:
      return 'Alert action'
  }
}

function showBootstrapFailureToast(error: AlertsBootstrapError) {
  const reason = error.status ? `${error.code} · status ${error.status}` : error.code

  toast({
    title: 'Live alerts failed',
    description: `The same-origin alerts bootstrap failed (${reason}). The shell stayed mounted with explicit fallback markers instead of pretending mock alerts were live.`,
    variant: 'destructive',
  })
}

function showActionFailureToast(error: AlertsActionError) {
  const actionLabel = describeAlertAction(error.action)
  const reason = error.status ? `${error.code} · status ${error.status}` : error.code

  if (error.stage === 'mutation') {
    toast({
      title: `${actionLabel} failed`,
      description: `Alert ${error.alertId} stayed selected because the same-origin ${actionLabel.toLowerCase()} request failed (${reason}).`,
      variant: 'destructive',
    })
    return
  }

  toast({
    title: `${actionLabel} applied, but refresh failed`,
    description: `Alert ${error.alertId} changed on Mesher, but the follow-up alerts refresh failed (${reason}). The visible list/detail state stayed unchanged instead of guessing a local patch.`,
    variant: 'destructive',
  })
}

function deriveSelectedAlertSource(alert: Alert | null): SelectedAlertSource {
  if (!alert) {
    return 'none'
  }

  return alert.source === 'live' ? 'mixed' : 'fallback'
}

export function useAlertsLiveState() {
  const [overviewData, setOverviewData] = useState<AlertsOverviewSnapshot>(() => buildFallbackAlertsOverview())
  const [bootstrapState, setBootstrapState] = useState<AlertsBootstrapState>('loading')
  const [bootstrapError, setBootstrapError] = useState<AlertsBootstrapError | null>(null)
  const [selectedAlertId, setSelectedAlertId] = useState<string | null>(null)
  const [actionPhase, setActionPhase] = useState<AlertsActionPhase>('idle')
  const [actionError, setActionError] = useState<AlertsActionError | null>(null)
  const [lastAction, setLastAction] = useState<AlertLiveAction | string | null>(null)
  const [lastActionAlertId, setLastActionAlertId] = useState<string | null>(null)
  const bootstrapAbortRef = useRef<AbortController | null>(null)
  const refreshAbortRef = useRef<AbortController | null>(null)

  const refreshAlerts = useCallback(
    async ({ fallbackOnFailure = false }: { fallbackOnFailure?: boolean } = {}): Promise<AlertsOverviewSnapshot | null> => {
      refreshAbortRef.current?.abort()
      const abortController = new AbortController()
      refreshAbortRef.current = abortController

      try {
        const alerts = await fetchDefaultProjectAlerts(abortController.signal)
        if (abortController.signal.aborted) {
          return null
        }

        const adapted = adaptMesherProjectAlerts(alerts)
        setOverviewData(adapted)
        setBootstrapState('ready')
        setBootstrapError(null)
        return adapted
      } catch (error) {
        if (abortController.signal.aborted) {
          return null
        }

        if (fallbackOnFailure) {
          const normalizedError = toBootstrapError(error)
          setOverviewData(buildFallbackAlertsOverview())
          setBootstrapState('failed')
          setBootstrapError(normalizedError)
          showBootstrapFailureToast(normalizedError)
        }

        throw error
      } finally {
        if (refreshAbortRef.current === abortController) {
          refreshAbortRef.current = null
        }
      }
    },
    [],
  )

  useEffect(() => {
    const abortController = new AbortController()
    bootstrapAbortRef.current = abortController

    void refreshAlerts({ fallbackOnFailure: true }).catch(() => undefined)

    return () => {
      abortController.abort()
      bootstrapAbortRef.current?.abort()
      refreshAbortRef.current?.abort()
    }
  }, [refreshAlerts])

  const alertsById = useMemo(
    () => new Map(overviewData.alerts.map((alert) => [alert.id, alert] as const)),
    [overviewData.alerts],
  )

  useEffect(() => {
    if (!selectedAlertId) {
      return
    }

    if (!alertsById.has(selectedAlertId)) {
      setSelectedAlertId(null)
    }
  }, [alertsById, selectedAlertId])

  const selectedAlert = selectedAlertId ? alertsById.get(selectedAlertId) ?? null : null
  const selectedAlertSource = deriveSelectedAlertSource(selectedAlert)
  const selectedAlertState: SelectedAlertState = selectedAlert ? 'ready' : 'idle'
  const isActionPending = actionPhase === 'mutating' || actionPhase === 'refreshing'

  const selectAlert = useCallback((alertId: string) => {
    setSelectedAlertId((current) => (current === alertId ? null : alertId))
  }, [])

  const clearSelectedAlert = useCallback(() => {
    setSelectedAlertId(null)
  }, [])

  const runAlertAction = useCallback(
    async (alertId: string, action: string) => {
      const normalizedAction = action.trim().toLowerCase()
      const targetAlert = alertsById.get(alertId) ?? null

      setLastAction(normalizedAction || action)
      setLastActionAlertId(alertId)
      setActionError(null)

      if (!isSupportedAlertAction(normalizedAction)) {
        const error = toActionError(
          new MesherApiError(
            'invalid-payload',
            `/api/v1/alerts/${encodeURIComponent(alertId || 'unknown')}/${encodeURIComponent(normalizedAction || 'unknown')}`,
            `Unsupported alert action "${action}"`,
          ),
          'mutation',
          normalizedAction || action,
          alertId || 'unknown',
        )
        setActionPhase('failed')
        setActionError(error)
        showActionFailureToast(error)
        return
      }

      if (!targetAlert) {
        const error = toActionError(
          new MesherApiError(
            'invalid-payload',
            `/api/v1/alerts/${encodeURIComponent(alertId || 'unknown')}/${normalizedAction}`,
            `Unknown alert ${alertId}`,
          ),
          'mutation',
          normalizedAction,
          alertId || 'unknown',
        )
        setActionPhase('failed')
        setActionError(error)
        showActionFailureToast(error)
        return
      }

      if (targetAlert.source !== 'live' || !targetAlert.supportedActions?.includes(normalizedAction)) {
        const error = toActionError(
          new MesherApiError(
            'invalid-payload',
            `/api/v1/alerts/${encodeURIComponent(alertId || 'unknown')}/${normalizedAction}`,
            `Unsupported live action "${normalizedAction}" for alert ${alertId}`,
          ),
          'mutation',
          normalizedAction,
          alertId || 'unknown',
        )
        setActionPhase('failed')
        setActionError(error)
        showActionFailureToast(error)
        return
      }

      if (isActionPending) {
        return
      }

      setActionPhase('mutating')

      try {
        if (normalizedAction === 'acknowledge') {
          await acknowledgeAlert(alertId)
        } else {
          await resolveAlert(alertId)
        }
      } catch (error) {
        const normalizedError = toActionError(error, 'mutation', normalizedAction, alertId)
        setActionPhase('failed')
        setActionError(normalizedError)
        showActionFailureToast(normalizedError)
        return
      }

      setActionPhase('refreshing')

      try {
        const refreshedOverview = await refreshAlerts()
        if (refreshedOverview === null) {
          return
        }

        const refreshedAlert = refreshedOverview.alerts.find((alert) => alert.id === alertId) ?? null
        setSelectedAlertId(refreshedAlert?.id ?? null)
        setActionPhase('idle')
        setActionError(null)
      } catch (error) {
        const normalizedError = toActionError(error, 'overview-refresh', normalizedAction, alertId)
        setActionPhase('failed')
        setActionError(normalizedError)
        showActionFailureToast(normalizedError)
      }
    },
    [alertsById, isActionPending, refreshAlerts],
  )

  return {
    alerts: overviewData.alerts,
    stats: overviewData.stats,
    statsFieldSources: overviewData.statsSources,
    bootstrapState,
    bootstrapError,
    liveAlertCount: overviewData.liveAlertCount,
    alertsSource: overviewData.sources.alerts,
    statsSource: overviewData.sources.stats,
    overviewSource: overviewData.sources.overall,
    selectedAlertId,
    selectedAlert,
    selectedAlertState,
    selectedAlertSource,
    actionPhase,
    actionError,
    lastAction,
    lastActionAlertId,
    isActionPending,
    selectAlert,
    clearSelectedAlert,
    runAlertAction,
  }
}

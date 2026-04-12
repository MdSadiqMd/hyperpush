import { expect, type Page } from '@playwright/test'
import {
  DASHBOARD_ROUTE_KEYS,
  DASHBOARD_ROUTE_MAP,
  type DashboardRouteDefinition,
  type DashboardRouteKey,
} from '../../components/dashboard/dashboard-route-map'

const DEFAULT_MESHER_BACKEND_ORIGIN = process.env.MESHER_BACKEND_ORIGIN ?? 'http://127.0.0.1:18180'
const parsedBackendOrigin = new URL(DEFAULT_MESHER_BACKEND_ORIGIN)
const DIRECT_BACKEND_HOST = parsedBackendOrigin.hostname
const DIRECT_BACKEND_PORT = parsedBackendOrigin.port || (parsedBackendOrigin.protocol === 'https:' ? '443' : '80')

const KNOWN_ABORTED_SAME_ORIGIN_PATHS = [
  '/api/v1/projects/default/issues',
  '/api/v1/projects/default/dashboard/health',
  '/api/v1/projects/default/dashboard/levels',
  '/api/v1/projects/default/dashboard/volume',
  '/api/v1/projects/default/alerts',
  '/api/v1/projects/default/settings',
  '/api/v1/projects/default/storage',
  '/api/v1/projects/default/api-keys',
  '/api/v1/projects/default/alert-rules',
  '/api/v1/orgs/default/members',
  '/api/v1/issues/',
  '/api/v1/events/',
] as const

const KNOWN_ABORTED_ASSET_PATH_SNIPPETS = [
  '/node_modules/@fontsource/geist/',
  '/node_modules/@fontsource/geist-mono/',
  '/assets/geist-',
  '/assets/geist-mono-',
] as const

export type RuntimeSignalTracker = {
  consoleErrors: string[]
  failedRequests: string[]
  sameOriginApiPaths: string[]
  sameOriginApiCalls: string[]
  directBackendRequests: string[]
}

export const DASHBOARD_ROUTES: DashboardRouteDefinition[] = DASHBOARD_ROUTE_KEYS.map(
  (routeKey) => DASHBOARD_ROUTE_MAP[routeKey],
)

export function attachRuntimeSignalTracking(page: Page): RuntimeSignalTracker {
  const runtimeSignals: RuntimeSignalTracker = {
    consoleErrors: [],
    failedRequests: [],
    sameOriginApiPaths: [],
    sameOriginApiCalls: [],
    directBackendRequests: [],
  }

  page.on('console', (message) => {
    if (message.type() === 'error') {
      runtimeSignals.consoleErrors.push(message.text())
    }
  })

  page.on('pageerror', (error) => {
    runtimeSignals.consoleErrors.push(error.message)
  })

  page.on('request', (request) => {
    const url = new URL(request.url())

    if (url.pathname === '/api/v1' || url.pathname.startsWith('/api/v1/')) {
      runtimeSignals.sameOriginApiPaths.push(url.pathname)
      runtimeSignals.sameOriginApiCalls.push(`${request.method()} ${url.pathname}`)
    }

    if (url.hostname === DIRECT_BACKEND_HOST && url.port === DIRECT_BACKEND_PORT) {
      runtimeSignals.directBackendRequests.push(request.url())
    }
  })

  page.on('requestfailed', (request) => {
    runtimeSignals.failedRequests.push(
      `${request.method()} ${request.url()} :: ${request.failure()?.errorText ?? 'unknown error'}`,
    )
  })

  page.on('response', (response) => {
    if (response.status() >= 400) {
      runtimeSignals.failedRequests.push(
        `${response.status()} ${response.request().method()} ${response.url()}`,
      )
    }
  })

  return runtimeSignals
}

export function clearRuntimeSignals(runtimeSignals: RuntimeSignalTracker) {
  runtimeSignals.consoleErrors.length = 0
  runtimeSignals.failedRequests.length = 0
  runtimeSignals.sameOriginApiPaths.length = 0
  runtimeSignals.sameOriginApiCalls.length = 0
  runtimeSignals.directBackendRequests.length = 0
}

export function filteredConsoleErrors(runtimeSignals: RuntimeSignalTracker, allowedSubstrings: string[] = []) {
  return runtimeSignals.consoleErrors.filter(
    (entry) => !allowedSubstrings.some((allowed) => entry.includes(allowed)),
  )
}

function isKnownSameOriginAbort(entry: string) {
  return (
    entry.includes(':: net::ERR_ABORTED') &&
    (
      KNOWN_ABORTED_SAME_ORIGIN_PATHS.some((pathPrefix) => entry.includes(pathPrefix)) ||
      KNOWN_ABORTED_ASSET_PATH_SNIPPETS.some((pathSnippet) => entry.includes(pathSnippet))
    )
  )
}

export function filteredFailedRequests(runtimeSignals: RuntimeSignalTracker) {
  return runtimeSignals.failedRequests.filter((entry) => !isKnownSameOriginAbort(entry))
}

export async function assertCleanLiveRuntimeSignals(
  runtimeSignals: RuntimeSignalTracker,
  options: {
    failureContext?: string
    allowedConsoleSubstrings?: string[]
  } = {},
) {
  const { failureContext = 'live runtime', allowedConsoleSubstrings = [] } = options

  expect(
    runtimeSignals.directBackendRequests,
    `${failureContext}: expected browser traffic to stay on same-origin /api/v1 instead of calling Mesher directly`,
  ).toEqual([])
  expect(
    filteredConsoleErrors(runtimeSignals, allowedConsoleSubstrings),
    `${failureContext}: expected no unexpected console errors`,
  ).toEqual([])
  expect(
    filteredFailedRequests(runtimeSignals),
    `${failureContext}: expected no unexpected failed requests`,
  ).toEqual([])
}

export async function expectSameOriginApiPathSeen(
  runtimeSignals: RuntimeSignalTracker,
  pathname: string,
  failureContext = 'live runtime',
) {
  await expect
    .poll(
      () => runtimeSignals.sameOriginApiPaths.includes(pathname),
      `${failureContext}: expected same-origin API path ${pathname}`,
    )
    .toBe(true)
}

export async function expectSameOriginApiCallSeen(
  runtimeSignals: RuntimeSignalTracker,
  call: string,
  failureContext = 'live runtime',
) {
  await expect
    .poll(
      () => runtimeSignals.sameOriginApiCalls.includes(call),
      `${failureContext}: expected same-origin API call ${call}`,
    )
    .toBe(true)
}

export async function expectPathname(page: Page, pathname: string) {
  await expect
    .poll(async () => page.evaluate(() => window.location.pathname))
    .toBe(pathname)
}

export function sidebarNavigationTestId(routeKey: DashboardRouteKey) {
  return routeKey === 'settings' ? 'sidebar-footer-settings' : `sidebar-nav-${routeKey}`
}

export async function expectDashboardRoute(page: Page, route: DashboardRouteDefinition) {
  await expectPathname(page, route.pathname)
  await expect(page.getByTestId('dashboard-shell')).toHaveAttribute('data-route-key', route.key)
  await expect(page.getByTestId(`sidebar-nav-${route.key}`)).toHaveAttribute('data-active', 'true')
}

export async function navigateToDashboardRoute(page: Page, route: DashboardRouteDefinition) {
  await page.getByTestId(sidebarNavigationTestId(route.key)).click()
  await expectDashboardRoute(page, route)
}

export async function goToDashboardRouteDirect(page: Page, route: DashboardRouteDefinition) {
  await page.goto(route.pathname)
  await expectDashboardRoute(page, route)
}

export function requireDashboardRoute(routeKey: string): DashboardRouteDefinition {
  const route = DASHBOARD_ROUTE_MAP[routeKey as DashboardRouteKey]

  if (!route) {
    throw new Error(`Unknown dashboard route key: ${routeKey}`)
  }

  return route
}

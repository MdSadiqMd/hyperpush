const DEFAULT_MESHER_BACKEND_ORIGIN = 'http://127.0.0.1:18180'
const MESHER_BACKEND_ORIGIN_ENV = 'MESHER_BACKEND_ORIGIN'

function invalidOrigin(message, candidate) {
  return new Error(`[mesher-client] ${MESHER_BACKEND_ORIGIN_ENV} ${message}: ${candidate}`)
}

export function resolveMesherBackendOrigin(env = process.env) {
  const candidate = env[MESHER_BACKEND_ORIGIN_ENV] ?? DEFAULT_MESHER_BACKEND_ORIGIN

  let origin
  try {
    origin = new URL(candidate)
  } catch {
    throw invalidOrigin('must be a valid absolute URL', candidate)
  }

  if (!['http:', 'https:'].includes(origin.protocol)) {
    throw invalidOrigin('must use http or https', candidate)
  }

  if (!['', '/'].includes(origin.pathname)) {
    throw invalidOrigin('must not include a path', candidate)
  }

  if (origin.search || origin.hash) {
    throw invalidOrigin('must not include search params or a hash', candidate)
  }

  return origin
}

export { DEFAULT_MESHER_BACKEND_ORIGIN, MESHER_BACKEND_ORIGIN_ENV }

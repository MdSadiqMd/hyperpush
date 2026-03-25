struct RateLimitState do
  limits :: Map < String, Int >
  window_seconds :: Int
  max_events :: Int
end

service InlineRateLimiter do
  fn init(window_seconds :: Int, max_events :: Int) -> RateLimitState do
    RateLimitState {
      limits : Map.new(),
      window_seconds : window_seconds,
      max_events : max_events
    }
  end

  call CheckLimit(project_id :: String) :: Bool do|state|
    let count = Map.get(state.limits, project_id)
    println("service-count=#{count}")
    println("service-max=#{state.max_events}")
    if count >= state.max_events do
      (state, false)
    else
      let new_limits = Map.put(state.limits, project_id, count + 1)
      let new_state = RateLimitState {
        limits : new_limits,
        window_seconds : state.window_seconds,
        max_events : state.max_events
      }
      (new_state, true)
    end
  end
end

fn main() do
  let limiter = InlineRateLimiter.start(60, 2)
  let project_id = "project-1"
  let one = InlineRateLimiter.check_limit(limiter, project_id)
  println("one=#{one}")
  let two = InlineRateLimiter.check_limit(limiter, project_id)
  println("two=#{two}")
  let three = InlineRateLimiter.check_limit(limiter, project_id)
  println("three=#{three}")
end

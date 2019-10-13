class Qwer < ApplicationRecord
  include TimelyScopes

  add_timely_scopes(
    :dated_after,
    :dated_before,
    :dated_from,
    :dated_until,
    :datetimed_after,
    :datetimed_before,
    :datetimed_from,
    :datetimed_until,
  )
end

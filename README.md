# TimelyScopes

A Rails plugin to add handy, time-based scopes.

## Usage

Given a model:
```ruby
# db/migrate/XXXXXXXXXXXXXX_create_asdfs.rb
class CreateAsdfs < ActiveRecord::Migration[6.0]
  def change
    create_table :asdfs do |t|
      t.date :dated_on
      t.datetime :datetimed_at
    end
  end
end
```

Include the `TimelyScopes` module and declare the scopes you want using `add_timely_scopes`:
```ruby
# app/models/asdf.rb
class Asdf < ApplicationRecord
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
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "timely_scopes"
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

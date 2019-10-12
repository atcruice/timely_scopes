$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "timely_scopes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "timely_scopes"
  spec.version     = TimelyScopes::VERSION
  spec.authors     = ["Alex Cruice"]
  spec.email       = ["alex.cruice@gmail.com"]
  spec.homepage    = "https://github.com/alexcruice/timely_scopes"
  spec.summary     = "A Rails plugin to add handy, time-based scopes"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0"

  spec.add_development_dependency "sqlite3"
end

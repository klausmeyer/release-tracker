source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
# gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
# gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
# gem "solid_cache"
# gem "solid_queue"
# gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
# gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
# gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Ruby toolkit for the GitHub API [https://github.com/octokit/octokit.rb]
gem "octokit", "~> 10.0.0"

# Simple, but flexible HTTP client library, with support for multiple backends: https://github.com/lostisland/faraday
gem "faraday", "~> 2.7"

# Catches exceptions and retries each request a limited number of times [https://github.com/lostisland/faraday-retry]
gem "faraday-retry", "~> 2.4.0"

# Simple health check of Rails app: https://github.com/Purple-Devs/health_check
gem "health_check", "~> 3.1"

# Simple, efficient background processing for Ruby [https://github.com/sidekiq/sidekiq]
gem "sidekiq", "~> 8.1.0"

# The official Airbrake library for Ruby applications [https://github.com/airbrake/airbrake]
gem "airbrake", "~> 13.0.0"

# RSS reading and writing [https://github.com/ruby/rss]
gem "rss", "~> 0.3.0"

#  A Ruby client library for Redis [https://github.com/redis/redis-rb]
gem "redis", "~> 5.4.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # A Ruby gem to load environment variables from `.env`. [https://github.com/bkeepers/dotenv]
  gem "dotenv-rails", "~> 3.0"

  # Behaviour Driven Development for Ruby [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 8.0.0"

  # Fixtures replacement: https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails", "~> 6.2"

  # Code coverage: https://github.com/simplecov-ruby/simplecov
  gem "simplecov", "~> 0.22.0", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Manage Procfile-based applications
  gem "foreman", "~> 0.90.0"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  # Library for stubbing and setting expectations on HTTP requests in Ruby: https://github.com/bblimke/webmock
  gem "webmock", "~> 3.19"
end

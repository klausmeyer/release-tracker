source "https://rubygems.org"

ruby "3.2.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Ruby toolkit for the GitHub API [https://github.com/octokit/octokit.rb]
gem "octokit", "~> 8.0.0"

# Simple, but flexible HTTP client library, with support for multiple backends: https://github.com/lostisland/faraday
gem "faraday", "~> 2.7"

# Catches exceptions and retries each request a limited number of times [https://github.com/lostisland/faraday-retry]
gem "faraday-retry", "~> 2.2.0"

# Simple health check of Rails app: https://github.com/Purple-Devs/health_check
gem "health_check", "~> 3.1"

# Simple, efficient background processing for Ruby [https://github.com/sidekiq/sidekiq]
gem "sidekiq", "~> 7.2.0"

# The official Airbrake library for Ruby applications [https://github.com/airbrake/airbrake]
gem "airbrake", "~> 13.0.0"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # A Ruby gem to load environment variables from `.env`. [https://github.com/bkeepers/dotenv]
  gem "dotenv-rails", "~> 2.8"

  # Behaviour Driven Development for Ruby [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 6.1.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Manage Procfile-based applications
  gem "foreman", "~> 0.87.2"

  # Ruby Style Guide, with linter & automatic code fixer [https://github.com/testdouble/standard]
  gem "standard", "~> 1.33.0"
end

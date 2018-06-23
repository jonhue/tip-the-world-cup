source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# # See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'aws-sdk-s3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Internationalization
gem 'i18n', '~> 1.0'
# Haml views
gem 'haml', '~> 5.0'
# Authentication
gem 'devise', '~> 4.4'
# Authorization
gem 'cancancan', '~> 2.2'
# Notifications
gem 'onsignal', '~> 5.0'
gem 'notification-handler', '~> 1.2'
gem 'notification-pusher-onesignal', '~> 1.2'
# Layouts & components
gem 'mozaic', '~> 2.0'
# Meta tags
gem 'metamagic', '~> 3.1'
# SEO
gem 'search-engine-optimization', '~> 1.2'
# Forms
gem 'simple_form', '~> 4.0'
# Error pages
gem 'r404', '~> 2.0'
# Progressive Web App
gem 'pwa', '~> 4.0'
# Sentry issue tracking
gem 'sentry-raven', '~> 2.7'
# Mail
gem 'mailgun-ruby', '~> 1.1'
# URLs
gem 'friendly_id', '~> 5.2'
# Animations
gem 'turbolinks-animate', '~> 2.0'
# Records
gem 'randomize_id', '~> 1.0'
gem 'nilify_blanks', '~> 1.3'
# Myg framework
gem 'myg', '~> 2.10'
# Modals
gem 'modalist', '~> 2.3'
# API requests
gem 'httparty', '~> 0.16.2'
# Language detection
gem 'browser', '~> 1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot', '~> 4.8'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'certified', '~> 1.0'
  gem 'pry-rails', '~> 0.3.6'
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'mysql2', '~> 0.5.1'
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'lol_dba', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg', '~> 1.0'
  gem 'rack-timeout', '~> 0.5.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

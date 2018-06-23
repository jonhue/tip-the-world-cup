source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# # See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
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
gem 'bootsnap', require: false

# Internationalization
gem 'i18n'
# Haml views
gem 'haml'
# Authentication
gem 'devise'
# Authorization
gem 'cancancan'
# Notifications
gem 'onsignal'
gem 'notification-handler'
gem 'notification-pusher-onesignal'
# Layouts & components
gem 'mozaic'
# Meta tags
gem 'metamagic'
# SEO
gem 'search-engine-optimization'
# Forms
gem 'simple_form'
# Error pages
gem 'r404'
# Progressive Web App
gem 'pwa'
# Sentry issue tracking
gem 'sentry-raven'
# Mail
gem 'mailgun-ruby'
# URLs
gem 'friendly_id'
# Animations
gem 'turbolinks-animate'
# Records
gem 'randomize_id'
gem 'nilify_blanks'
# Myg framework
gem 'myg'
# Modals
gem 'modalist'
# API requests
gem 'httparty'
# Language detection
gem 'browser'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  gem 'certified'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'mysql2', '~> 0.5.1'
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

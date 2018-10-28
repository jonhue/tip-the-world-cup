# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.0'

gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'browser'
gem 'cancancan'
gem 'devise'
gem 'friendly_id'
gem 'haml'
gem 'httparty'
gem 'i18n'
gem 'mailgun-ruby'
gem 'metamagic'
gem 'modalist'
gem 'mozaic'
gem 'myg'
gem 'nilify_blanks'
gem 'nokogiri'
gem 'notification-handler'
gem 'notification-pusher-onesignal'
gem 'onsignal'
gem 'pg'
gem 'puma'
gem 'pwa'
gem 'r404'
gem 'randomize_id'
gem 'sass-rails'
gem 'search-engine-optimization'
gem 'sentry-raven'
gem 'simple_form'
gem 'skylight'
gem 'turbolinks'
gem 'turbolinks-animate'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot'
  gem 'haml_lint', require: false
  gem 'rspec-rails', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman', require: false
  gem 'pry-rails'
  gem 'web-console'
end

group :production do
  gem 'rack-timeout'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# frozen_string_literal: true

Myg.configure do |config|
  # Path to Myg javascripts directory
  config.javascripts_dir = 'app/webpack/javascripts/myg'

  # Path to Myg stylehseets directory
  config.stylesheets_dir = 'app/webpack/stylesheets/myg'

  # Enable or disable Webpack (ES6)
  # config.es6 = true

  ##### MYG-THEME #####

  # Array of available themes
  # config.themes = ['default']

  # Default theme
  # config.theme = 'default'

  ### Automatic themes ###

  # Enable automatic themes
  # config.theme_auto = false

  # Day theme
  # config.theme_day = 'light'
  # Night theme
  # config.theme_night = 'dark'

  # Beginning of daytime
  # config.theme_day_time = '6:00 am'
  # Beginning of nighttime
  # config.theme_night_time = '6:00 pm'
end

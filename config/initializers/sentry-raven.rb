Raven.configure do |config|
  config.dsn = 'https://9ba7364281bc45fabd5d1c1650836c21:b4cce1077f0049b58da2b7ca3e12cd94@sentry.io/1213892'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end

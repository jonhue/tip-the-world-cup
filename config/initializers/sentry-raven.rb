Raven.configure do |config|
  config.dsn = Rails.application.credentials.send(Rails.env.production? ? 'production' : 'development')[:sentry][:dsn]
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end

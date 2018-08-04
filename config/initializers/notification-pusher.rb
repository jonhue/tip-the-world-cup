# frozen_string_literal: true

NotificationPusher.configure do |config|
  # A pusher handles the process of sending your notifications to various
  # services for you.
  # Learn more: https://github.com/jonhue/notifications-rails/tree/master/notification-pusher#pushers
  config.define_pusher(
    :OneSignal,
    app_id: Rails.application.credentials.onesignal[:app_id],
    auth_key: Rails.application.credentials.onesignal[:auth_key]
  )
end

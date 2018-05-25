NotificationPusher.configure do |config|

    # A pusher handles the process of sending your notifications to various services for you.
    # Learn more: https://github.com/jonhue/notifications-rails/tree/master/notification-pusher#pushers
    config.define_pusher :OneSignal, app_id: 'f158a844-9f3c-4207-b246-e93603b0a970', auth_key: 'kODc3N2ItOTNC00NGzOGYtMzI5OWQ3ZmQ'

end

if Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
    email: {
      email_prefix: "[RC] ",
      sender_address: %["exception_notifier" <noreply@rakuten-campaign.herokuapp.com>],
      exception_recipients: [ENV['EMAIL_TO']]
    }
end

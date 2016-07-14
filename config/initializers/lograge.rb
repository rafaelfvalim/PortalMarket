Rails.application.configure do
  config.lograge.enabled = true
  # http://help.papertrailapp.com/kb/configuration/configuring-centralized-logging-from-ruby-on-rails-apps/
  # config.logger = RemoteSyslogLogger.new('logs4.papertrailapp.com', 13242)
  # https://github.com/roidrage/lograge
  config.lograge.enabled = true
  config.lograge.custom_options = lambda do |event|
    {:time => event.time}
    event.payload
  end
end
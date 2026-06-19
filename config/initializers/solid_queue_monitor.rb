SolidQueueMonitor.setup do |config|
  config.authentication_enabled = true
  config.username = ENV["SOLID_QUEUE_MONITOR_USERNAME"]
  config.password = ENV["SOLID_QUEUE_MONITOR_PASSWORD"]
end

require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false

  # Require master key to decrypt credentials
  config.require_master_key = true

  # Assume requests arrive via SSL-terminating reverse proxy
  config.assume_ssl = true

  # Force HTTPS, but skip redirect for health check endpoints
  config.force_ssl = true
  config.ssl_options = {
    redirect: { exclude: ->(request) { request.path.start_with?("/health", "/up") } }
  }

  # Restrict allowed hostnames — set ALLOWED_HOSTS=myapp.com,www.myapp.com in env
  allowed_hosts = ENV.fetch("ALLOWED_HOSTS", "").split(",").map(&:strip).reject(&:empty?)
  config.hosts = allowed_hosts.presence

  # Structured STDOUT logging with request ID tagging
  config.logger = ActiveSupport::Logger.new($stdout)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  config.log_tags = [ :request_id ]
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
end

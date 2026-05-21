threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

port ENV.fetch("PORT", 8080)

if ENV["RAILS_ENV"] == "production"
  workers ENV.fetch("WEB_CONCURRENCY", 2)
  preload_app!
end

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

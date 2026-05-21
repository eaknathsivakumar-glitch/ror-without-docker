module HealthCheckable
  extend ActiveSupport::Concern

  def show
    render json: {
      status: "ok",
      timestamp: Time.current.iso8601,
      version: {
        ruby: RUBY_VERSION,
        rails: Rails.version
      },
      environment: Rails.env
    }, status: :ok
  end
end

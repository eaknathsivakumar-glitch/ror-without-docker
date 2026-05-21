class ApplicationController < ActionController::API
  before_action :set_default_response_format

  rescue_from StandardError do |e|
    Rails.logger.error("#{e.class}: #{e.message}\n#{e.backtrace&.first(5)&.join("\n")}")
    render json: { error: "internal_server_error", message: "An unexpected error occurred" },
           status: :internal_server_error
  end

  rescue_from ActionController::RoutingError do
    render json: { error: "not_found", message: "Resource not found" }, status: :not_found
  end

  private

  def set_default_response_format
    request.format = :json
  end
end

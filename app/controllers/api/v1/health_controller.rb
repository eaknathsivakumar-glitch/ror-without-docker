module Api
  module V1
    class HealthController < ApplicationController
      def show
        render json: {
          status: "ok",
          timestamp: Time.current.iso8601,
          ruby_version: RUBY_VERSION,
          rails_version: Rails.version,
          environment: Rails.env
        }, status: :ok
      end
    end
  end
end

module Api
  module V1
    class HealthController < ApplicationController
      include HealthCheckable
    end
  end
end

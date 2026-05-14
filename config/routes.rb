Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Built-in Rails health check (returns 200 if app boots without exceptions)
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom health check with JSON response
  namespace :api do
    namespace :v1 do
      get "health", to: "health#show"
    end
  end
end

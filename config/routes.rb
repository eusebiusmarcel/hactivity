# frozen_string_literal: true

Rails.application.routes.draw do
  # Forward all requests to StaticController#index but requests
  # must be non-Ajax (!req.xhr?) and HTML Mime type (req.format.html?).
  # This does not include the root ("/") path.
  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end
  # Forward root to StaticController#index
  root 'static#index'

  namespace :api do
    post 'user', to: 'users#create'
    post 'login', to: 'users#authenticate'
  end
end

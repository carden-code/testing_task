Rails.application.routes.draw do
  root 'projects#index', defaults: { format: :json }

  resources :projects, defaults: { format: :json }, shallow: true, only: :index do
    resources :todos, shallow: true, only: :create do
      patch :update, on: :member
    end
  end
end

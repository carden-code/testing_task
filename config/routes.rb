Rails.application.routes.draw do
  root 'projects#index', defaults: { format: :json }

  resources :projects, defaults: { format: :json }, shallow: true, only: :index do
    resources :todos, shallow: true, only: %i[create update], except: :update do
      patch :update, on: :member
    end
  end
end

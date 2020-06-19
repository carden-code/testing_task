Rails.application.routes.draw do
  root 'projects#index'

  # Резурс задач вложен в ресурс категорий(projects)
  resources :projects, shallow: true, only: :index do
    resources :todos, shallow: true, only: %i[create update]
  end
end

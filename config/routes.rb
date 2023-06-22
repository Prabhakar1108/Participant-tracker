Rails.application.routes.draw do
  resources :registries do
    resources :enrollments, only: [:new, :create, :index]
    resources :participants, only: [:index,:new,:create]
  resources :coordinators, only: [:new, :create, :index]
  end

  get 'export_participants', to: 'participants#export'
  root 'registries#index'
end

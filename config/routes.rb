Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :show]
    resources :meetings do
      resources :messages, only: [:index, :new, :create]
    end
    resource :profile, only: [:edit, :show, :update]
  end
end

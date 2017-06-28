Rails.application.routes.draw do
  devise_for :users
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resources :profiles, only: [:edit, :show, :update]
    end
  end
end


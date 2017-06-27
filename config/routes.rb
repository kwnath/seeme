Rails.application.routes.draw do
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resource :profiles, only: [:edit, :show, :update]
    end
  end
  devise_for :users
end


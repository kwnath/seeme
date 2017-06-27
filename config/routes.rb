Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show], defaults: { format: :json }
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resource :profiles, only: [:edit, :show, :update]
    end
  end
end

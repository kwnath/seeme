Rails.application.routes.draw do
  devise_for :users
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      patch 'meetings/:id/accept', to: 'meetings#accept'
      patch 'meetings/:id/decline', to: 'meetings#decline'
      patch 'meetings/:id/cancel', to: 'meetings#cancel'
      patch 'profile/addhobby', to: 'profiles#addhobby'
      patch 'users/search', to: 'users#search'
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resource :profile, only: [:edit, :show, :update]
    end
  end
end


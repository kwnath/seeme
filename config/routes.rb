Rails.application.routes.draw do
  devise_for :users
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      put 'meetings/:id/accept', to: 'meetings#accept'
      put 'meetings/:id/decline', to: 'meetings#decline'
      put 'meetings/:id/cancel', to: 'meetings#cancel'
      put 'profile/addhobby', to: 'profiles#addhobby'
      put 'users/search', to: 'users#search'
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resource :profile, only: [:edit, :show, :update]
    end
  end
end


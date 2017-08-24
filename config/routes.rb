Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"

  devise_for :users
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :create]
      get 'users', to: 'users#index'
      put 'meetings/:id/accept', to: 'meetings#accept'
      put 'meetings/:id/decline', to: 'meetings#decline'
      put 'meetings/:id/cancel', to: 'meetings#cancel'
      put 'users/search', to: 'users#search'
      resources :meetings do
        resources :messages, only: [:index, :new, :create]
      end
      resource :profile, only: [:edit, :show, :update]
    end
  end
end


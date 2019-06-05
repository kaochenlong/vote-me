Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  devise_for :users
  root 'candidates#index'

  get "/history", to: "users#history"

  resources :products, only: [:index, :show]

  resource :cart, only: [:show, :destroy] do
    collection do
      put :add, path: 'add/:id'
    end
  end

  resources :candidates do
    member do
      patch :vote
    end
  end

  namespace :admin do
    root 'pages#index'

    resources :candidates
  end
end

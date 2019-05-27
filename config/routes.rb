Rails.application.routes.draw do
  devise_for :users
  root 'candidates#index'

  get "/history", to: "users#history"

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

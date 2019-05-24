Rails.application.routes.draw do
  root 'candidates#index'

  resources :candidates do
    member do
      patch :vote
    end
  end
end

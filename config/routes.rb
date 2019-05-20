Rails.application.routes.draw do
  # get '/', to: 'candidates#index'
  root 'candidates#index'
  resources :candidates
end

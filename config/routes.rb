Rails.application.routes.draw do
  resources :relationships
  resources :tips
  root 'home#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

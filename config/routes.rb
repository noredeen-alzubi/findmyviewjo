Rails.application.routes.draw do
  root to: 'pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :cities, only: [:index, :destroy, :update]
  resources :stunning_views
  resources :users, except: [:index]
end

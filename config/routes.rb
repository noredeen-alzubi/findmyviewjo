Rails.application.routes.draw do
  root to: 'pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :cities, only: [:index, :destroy, :update] do
    get :autocomplete_city_name, on: :collection
  end
  resources :stunning_views
  resources :users, except: [:index]
end

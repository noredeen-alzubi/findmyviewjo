Rails.application.routes.draw do
  root to: 'pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get   '/search',  to: 'stunning_views#search'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :cities, only: [:index, :destroy, :update] do
    get :autocomplete_city_name, on: :collection
  end
  resources :stunning_views do
    resources :reviews
  end
  resources :users, except: [:index]
end

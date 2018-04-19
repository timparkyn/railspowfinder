Rails.application.routes.draw do


  root 'static_pages#home'
  get 'session/new'
  get 'users/new'
  get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users do
    resources :selections
    resources :stations, only: [:index]
  end

  resources :stations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

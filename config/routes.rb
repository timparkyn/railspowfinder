Rails.application.routes.draw do

  root 'static_pages#home'
  get 'session/new'
  get 'users/new'
  get 'static_pages/home'
  get '/about', to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  # post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :selections
  end

  resources :stations


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

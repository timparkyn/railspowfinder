Rails.application.routes.draw do


  root 'static_pages#home'

  get 'users/new'

  get 'static_pages/home'

  get '/help', to: 'static_pages#help'

  get  '/signup',  to: 'users#new'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
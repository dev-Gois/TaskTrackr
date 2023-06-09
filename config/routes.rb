Rails.application.routes.draw do
  resources :tasks
  root 'main#index'
  # cadastro
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

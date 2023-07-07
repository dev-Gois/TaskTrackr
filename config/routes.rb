Rails.application.routes.draw do
  root 'main#index'

  # redefinicao de senha
  get '/reset_password', to: 'password_resets#new', as: 'reset_password'
  post '/reset_password', to: 'password_resets#create'
  get '/password_resets/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  patch '/password_resets/update', to: 'password_resets#update', as: 'update_password_reset'
  
  # cadastro
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # tasks adicionais
  get 'search/:filter', to: 'tasks#index', as: 'filtered_tasks'
  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'update_completed'
  
  # resources
  resources :tasks 
  resources :lists, only: [:create, :destroy]
  resources :tags, only: [:create, :destroy]
  resources :password_resets, only: [:new, :create]
end

Rails.application.routes.draw do
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
  root 'main#index'
end

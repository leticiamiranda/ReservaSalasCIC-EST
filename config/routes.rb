Rails.application.routes.draw do

  resources :recursos
  namespace :salas do
   resources :salas
   root to: 'salas#index'
  end

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users

end

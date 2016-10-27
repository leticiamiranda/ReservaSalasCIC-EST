Rails.application.routes.draw do

  resources :reservas
  resources :salas
  resources :recursos
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users

end

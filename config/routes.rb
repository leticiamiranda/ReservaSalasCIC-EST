Rails.application.routes.draw do

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  namespace :salas do
  	resources :salas
  	root :to => redirect('/salas')
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users

end

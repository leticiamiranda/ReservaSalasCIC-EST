Rails.application.routes.draw do

  
  get '/reservas/upcoming_events', to: 'reservas#upcoming_events'
  resources :agendas
  resources :reservas
  resources :salas
  resources :recursos
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  
  namespace :professor do
    resources :reservas
    root to: "reservas#index"
  end
  
  root to: 'visitors#index'
  devise_for :users
  resources :users

end

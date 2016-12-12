Rails.application.routes.draw do

  get '/reservas/google_calendar', to: 'reservas#google_calendar'
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
  
  root to: "reservas#index"
  devise_for :users
  resources :users

end

Rails.application.routes.draw do
  # default_url_options :host => "https://reservas-salas-cic-est-leticia-ribeiro.c9users.io/"

  get '/reservas/google_calendar', to: 'reservas#google_calendar'
  post '/reservas/insert', to: 'reservas#insert'
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
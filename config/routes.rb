Rails.application.routes.draw do
  devise_for :users
  get "pages/home"
  get "create-admin", to: 'pages#create_admin'
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources 'search', only: [:index]
  # resources :sessions, as: :appointments
  resources :patients
  resources :therapists
end

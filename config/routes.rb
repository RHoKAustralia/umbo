Rails.application.routes.draw do
  devise_for :users
  get "pages/home"
  get "create_admin", to: 'pages#create_admin'
  post "create_therapist_user", to: 'pages#create_therapist_user', as: 'create_therapist_user'
  get "new_therapist_user", to: 'pages#new_therapist_user', as: 'new_therapist_user'
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources 'search', only: [:index]
  # resources :sessions, as: :appointments
  resources :patients
  resources :therapists
end
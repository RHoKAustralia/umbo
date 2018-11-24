Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources 'search', only: [:index]
  resources 'sessions'
  resources 'therapists', only: [:show]
  resources 'patients'
end

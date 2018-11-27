Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}, :controllers => { :registrations => :registrations }
  get "pages/home"
  get "create_admin", to: 'admin#create_admin'
  post "create_therapist_user", to: 'admin#create_therapist_user', as: 'create_therapist_user'
  get "new_therapist_user", to: 'admin#new_therapist_user', as: 'new_therapist_user'
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources 'search', only: [:index]
  resources :patients
  resources :therapists do
    resources :schedules
    resources :appointments
  end
end

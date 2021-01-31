Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "profiles#new"
  resources :profiles, only: [:new, :create]
end

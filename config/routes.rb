Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "articles#index"
  resources :profiles, only: [:new, :create]
  resources :articles, only: [:index, :new, :create, :show]
end

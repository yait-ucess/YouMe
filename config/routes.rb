Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "articles#index"
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  resources :articles do
    get :search, on: :collection
    resource :likes, only: [:create, :destroy]
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "articles#index"
  resources :profiles, only: [:new, :create, :show, :edit, :update] do
    resource :likes, only: [:create, :destroy]
  end
  resources :articles do
    get :search, on: :collection
  end
end

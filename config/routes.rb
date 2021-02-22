Rails.application.routes.draw do
  root to: "articles#index"
  devise_for :users
  resources :users do
    resource :gifts, only: [:new, :create]
  end
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  resources :articles do
    get :search, on: :collection
    resource :likes, only: [:create, :destroy]
  end
end

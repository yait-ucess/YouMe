Rails.application.routes.draw do
  root to: "articles#index"
  devise_for :users
  resources :profiles, only: [:new, :create, :show, :edit, :update] do
    resource :gifts, only: [:index, :new, :create, :show]
  end
  resources :articles do
    get :search, on: :collection
    resource :likes, only: [:create, :destroy]
  end
end

Rails.application.routes.draw do
  root to: "articles#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  #resource :users, only: [:show]
  resources :profiles, only: [:new, :create, :show, :edit, :update] do
    resource :gifts, only: [:new, :create, :show]
    resource :relationships, only: [:create, :destroy]
    member do
      get :follower, :followed
    end
  end

  resources :articles do
    get :search, on: :collection
    resource :likes, only: [:create, :destroy]
  end
end

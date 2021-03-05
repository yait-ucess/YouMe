Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "articles#index"
<<<<<<< Updated upstream
  resources :profiles, only: [:new, :create, :show, :edit, :update]
=======
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  #resource :users, only: [:show]
  resources :profiles, only: [:new, :create, :show, :edit, :update] do
    resource :gifts, only: [:new, :create, :show]
  end
>>>>>>> Stashed changes
  resources :articles do
    get :search, on: :collection
    resource :likes, only: [:create, :destroy]
  end
end

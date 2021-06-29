Rails.application.routes.draw do    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users do
    resources :articles
  end

  # List of users
  get '/users', to: 'users#index', as: "users_list"

  resources :follows, only: [:create]

  # Destroy->Unfollow function
  post "unfollow", to: "follows#destroy", as: "user_unfollow"

end

Rails.application.routes.draw do    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users do
    resources :articles
  end

  get '/list', to: 'list#index', as: "userslist"

  resources :follows, only: [:create]

  post "unfollow", to: "follows#destroy", as: "user_unfollow"

  get '/rails/info/routes' => 'routes'
end

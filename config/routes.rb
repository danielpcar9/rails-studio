Rails.application.routes.draw do
  resources :genres, param: :slug

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  resources :movies do 
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
  root "movies#index"

  resource  :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  
  resources :users, param: :username
  get "signup" => "users#new"
end

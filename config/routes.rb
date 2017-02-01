Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts
  end

  resources :posts, only: [:index, :show] do
    resources :likes, only: [:create, :destroy], module: "posts"
    resources :comments, only: :show
  end

  resources :comments, only: [:index, :show] do
    resources :likes, only: [:create, :destroy], module: "comments"
  end

  root "posts#index"
end

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:show, :edit, :update]
  
  resources :posts, only: [:index, :new, :create, :show] do
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: :create
  end

end

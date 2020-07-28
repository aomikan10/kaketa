Rails.application.routes.draw do
  root "messages#index"
  resources :users do
    get :search, on: :collection
  end
end

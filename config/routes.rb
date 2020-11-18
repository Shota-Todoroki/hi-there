Rails.application.routes.draw do
  devise_for :users
  
  root to: "sends#index"
  resources :sends do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end

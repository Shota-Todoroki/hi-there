Rails.application.routes.draw do
  devise_for :users
  
  root to: "sends#index"
  resources :sends, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end

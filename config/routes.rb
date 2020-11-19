Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  
  root to: "articles#index"
  resources :articles do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:show]
end

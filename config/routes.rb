Rails.application.routes.draw do
  devise_for :users
  
  root to: "sends#index"
  resources :sends, only: [:index]
end

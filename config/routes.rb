Rails.application.routes.draw do
  resources :tag_battles

  root to: 'visitors#index'
  devise_for :users
  resources :users
end

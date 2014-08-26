Rails.application.routes.draw do
  resources :hashtags

  resources :tag_battles

  root to: 'visitors#index'
  devise_for :users
  resources :users
end

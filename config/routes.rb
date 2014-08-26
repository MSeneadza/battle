Rails.application.routes.draw do
  resources :hashtags

  resources :tag_battles do
    get :autocomplete_hashtag_name, :on => :collection
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end

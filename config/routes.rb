Rails.application.routes.draw do
  resources :newsletters
  resources :game_users
  resources :games
  devise_for :users
  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

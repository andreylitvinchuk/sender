require 'sidekiq/web'
Rails.application.routes.draw do

  resources :players
  resources :newsletters
  resources :games
  devise_for :users
  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'
end

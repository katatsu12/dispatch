
Rails.application.routes.draw do
  resources :news
  resources :notifications
  devise_for :users
  root to: 'notifications#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end

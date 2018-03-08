Rails.application.routes.draw do
  resources :notifications
  devise_for :users
  root to: 'notifications#index'
end

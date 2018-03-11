
Rails.application.routes.draw do
  resources :news
  resources :notifications
  devise_for :users
  root to: 'news_chooser#index'
  get '/news_chooser', to: 'news_chooser#index'
  get '/bbc', to: 'news_chooser#bbc'
  get '/tc', to: 'news_chooser#tc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

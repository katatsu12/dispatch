require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do


  devise_for :admin_user

  namespace :admin do

    resources :users
    resources :news_choosers
    resources :notifications
    resources :tasks

    root to: "users#index"
  end

  resources :tasks
  resources :news
  resources :notifications

  devise_for :users, controllers: { sessions: 'devise/sessions', registrations: 'devise/registrations', omniauth_callbacks: 'omniauth_callbacks', confirmations: 'devise/confirmations' }
  as :user do
    get '/login' => 'sessions#new', :as => 'login'
    get '/signup' => 'registrations#new', :as => 'signup'
    get '/signout' => 'devise/sessions#destroy', :as => 'signout'
  end

  root to: 'notifications#index'

  get '/about', to: 'notifications#about'

  # news_choser(sites)----------------------------------------------------------
  get '/news_chooser', to: 'news_chooser#index'
  post '/bbc', to: 'news_chooser#bbc'
  post '/tc', to: 'news_chooser#tc'
  # news_choser(countries)------------------------------------------------------
  post '/us_business', to: 'news_chooser#us_business'
  post '/us_entertainment', to: 'news_chooser#us_entertainment'
  post '/us_health', to: 'news_chooser#us_health'
  post '/us_science', to: 'news_chooser#us_science'
  post '/us_sports', to: 'news_chooser#us_sports'
  post '/us_technology', to: 'news_chooser#us_technology'

  post '/ua_business', to: 'news_chooser#ua_business'
  post '/ua_entertainment', to: 'news_chooser#ua_entertainment'
  post '/ua_health', to: 'news_chooser#ua_health'
  post '/ua_science', to: 'news_chooser#ua_science'
  post '/ua_sports', to: 'news_chooser#ua_sports'
  post '/ua_technology', to: 'news_chooser#ua_technology'

  post '/send_weekly', to: 'news_chooser#send_weekly'
  post '/send_daily', to: 'news_chooser#send_daily'


  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end
end

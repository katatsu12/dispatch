
Rails.application.routes.draw do
  resources :tasks
  resources :news
  resources :notifications
  devise_for :users
  root to: 'news_chooser#index'

  #news_choser(sites)----------------------------------------------------------
  get '/news_chooser', to: 'news_chooser#index'
  post '/bbc', to: 'news_chooser#bbc'
  post '/tc', to: 'news_chooser#tc'
  #news_choser(countries)------------------------------------------------------
  post '/us_business', to: 'news_chooser#us_business'
  post '/us_entertainment' , to: 'news_chooser#us_entertainment'
  post '/us_health' , to: 'news_chooser#us_health'
  post '/us_science' , to: 'news_chooser#us_science'
  post '/us_sports' , to: 'news_chooser#us_sports'
  post '/us_technology' , to: 'news_chooser#us_technology'

  post '/ua_business' , to: 'news_chooser#ua_business'
  post '/ua_entertainment' , to: 'news_chooser#ua_entertainment'
  post '/ua_health' , to: 'news_chooser#ua_health'
  post '/ua_science' , to: 'news_chooser#ua_science'
  post '/ua_sports' , to: 'news_chooser#ua_sports'
  post '/ua_technology' , to: 'news_chooser#ua_technology'

  post '/send_email', to: 'news_chooser#send_email'
  post '/send_ema1l', to: 'tasks#send_email'

end

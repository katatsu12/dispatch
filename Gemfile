source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'ckeditor'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'validates_email_format_of'
gem 'hirb'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'pg'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'redis'
gem 'administrate'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'font-awesome-rails'
gem 'webpush'
gem 'serviceworker-rails'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7'
  gem 'simplecov', require: false
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'whenever', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

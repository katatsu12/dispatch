class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_users

  def current_users
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

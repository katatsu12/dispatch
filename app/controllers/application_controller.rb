class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_users
  before_action :set_current_user

  def current_users
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_current_user
    User.current = current_user
  end
end

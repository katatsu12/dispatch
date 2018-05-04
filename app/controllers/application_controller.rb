class ApplicationController < ActionController::Base
  helper_method :current_users
  before_action :set_current_user
  protect_from_forgery prepend: true
  $vapid_private = 'oFF8a5yMXqJn-QxZ18TNzs8lncEHd7DmF3oYDtsy1fE='
  $vapid_public = 'BItYVBEOYLfJUByY14yGG2gq60UjZay2-d1kik_-ckAZi_AnsnIkmgXjwPOqQsb5ci8kML4tPxh7H_i--HvEZAo='

  def current_users
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_current_user
    User.current = current_user
  end
end

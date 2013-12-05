class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user

    @current_user ||= User.find(session[:userid]) if session[:userid]
  end

  helper_method :current_user
end

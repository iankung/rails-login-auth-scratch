class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  ##Basically, if session[:user_id] is set, find the User with that id. 
  ##The @current_user ||= part of the method will cache the current user 
  ##inside of the @current_user instance variable so we don’t have to 
  ##make a database call each time the method is called.

end

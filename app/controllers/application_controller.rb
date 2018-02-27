class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def logged_in?
    if session[:user_id]
      return true
    end
  end

  def current_user
    @user = User.find(session[:user_id])
  end
end

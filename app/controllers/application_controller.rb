class ApplicationController < ActionController::Base

# BACKEND USER AUTHENTICATION
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user
    redirect_to '/login', status: :see_other unless current_user
  end
# This gives all your Rails controllers access to the methods current_user and authenticate_user.



end



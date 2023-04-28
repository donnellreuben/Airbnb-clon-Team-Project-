class SessionsController < ApplicationController
#------------------LOGIN---------------------#
# NEW 
  def new
    render template: "sessions/new"
  end

# CREATE
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/rooms#show" #REDIRECT HERE 
    else
      redirect_to "/login"
    end
  end

# DESTROY/DELETE
  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
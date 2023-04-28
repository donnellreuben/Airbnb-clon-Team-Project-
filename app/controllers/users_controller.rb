class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/pets"
    else
      render :new, status: :unprocessable_entity
    end
  end
end

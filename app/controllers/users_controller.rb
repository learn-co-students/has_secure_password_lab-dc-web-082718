class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if params[:user][:password] == params[:user][:password_confirmation]
      redirect_to welcome_path(@user.id)
    else
      redirect_to new_user_path
    end
  end

  def welcome
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

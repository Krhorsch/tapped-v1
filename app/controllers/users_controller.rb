class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @current_user = current_user
  end

  def signin
    @user = User.find_by(name: params[:name], password_digest: params[:password_digest])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end

  def logout
    session.clear
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :email)
  end
end

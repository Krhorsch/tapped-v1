class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @current_user = current_user
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

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :email)
  end
end

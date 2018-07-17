class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user}
    end
  end

  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def most

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end

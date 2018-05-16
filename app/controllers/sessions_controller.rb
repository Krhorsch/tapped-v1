class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['nickname']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id

    redirect_to @user
  end

  def signin
    if @user = User.find_by(name: params[:name], password_digest: params[:password_digest])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid Username - Password combination. Please try again."
      render :index
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
  private

  def auth
    request.env['omniauth.auth']
  end
end

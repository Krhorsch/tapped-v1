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
    if @user = User.find_by(name: params[:name])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      end
    else
      flash[:notice] = "Username - Password comination do not match"
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

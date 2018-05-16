class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    redirect_to @user
  end

  def signin
    @user = User.find_by(name: params[:name], password_digest: params[:password_digest])
    session[:user_id] = @user.id
    redirect_to @user
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

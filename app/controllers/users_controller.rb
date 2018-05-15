class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def signin

  end

  def new
    @user = User.new
  end

  def create

  end
end

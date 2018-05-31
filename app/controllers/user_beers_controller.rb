class UserBeersController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update, :destroy]

  def create
    params[:beer_ids].each do |id|
      @userbeer = UserBeer.new(user_id: current_user.id, beer_id: id, rating: params[:rating][id])
      if @userbeer.valid?
        @userbeer.save
      else
        @beer = Beer.new
        @beers = Beer.not_current_user_beers(current_user)
        flash[:notice] = "Beer Rating must be between 1-5"
        render "beers/new"
        return
      end
    end
    redirect_to user_path(current_user)
  end

  def edit
    @userbeer = UserBeer.find_by(id: params[:id])
  end

  def update
    @userbeer = UserBeer.find_by(id: params[:id])
    if @userbeer.update(userbeer_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    UserBeer.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private

  def userbeer_params
    params.require(:user_beer).permit(:rating)
  end
end

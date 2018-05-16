class UserBeersController < ApplicationController
  def create
    params[:beer_ids].each do |id|
      @userbeer = UserBeer.new(user_id: current_user.id, beer_id: id, rating: params[:rating][id])
      @userbeer.save
    end
    redirect_to current_user
  end
end

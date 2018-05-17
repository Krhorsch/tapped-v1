class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find_by(id: params(:id))
  end

  def new
    @beer = Beer.new
    @beers = Beer.not_current_user_beers(current_user)
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.valid?
      @beer.save
      redirect_to @beer
    else
      render :new
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style)
  end
end

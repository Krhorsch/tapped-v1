class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find_by(id: params(:id))
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.save
    redirect_to @beer
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style)
  end
end

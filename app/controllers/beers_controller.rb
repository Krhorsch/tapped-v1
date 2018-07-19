class BeersController < ApplicationController
  before_action :require_login, only: [:show, :new, :create]
  def index
    @beers = Beer.all
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @beers}
    end
  end

  def show
    @beer = Beer.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @beer}
    end
  end

  def new
    @beer = Beer.new
    @beers = Beer.not_current_user_beers(current_user)
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.valid?
      @beer.save
      render json: @beer, status: 201
    else
      @beers = Beer.not_current_user_beers(current_user)
      render :new
    end
  end

  def breweryform
    @breweries = Beer.breweries
  end

  def breweryshow
    @beers = Beer.by_brewery(params[:brewery])
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style)
  end
end

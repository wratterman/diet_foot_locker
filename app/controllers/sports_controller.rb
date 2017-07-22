class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :update]
  # before_action :get_sports, only: [:index]

  def index
    @sports = Sport.all
  end

  def create
    @sport = Sneaker.new(sport_params)
    if @sport.save
      flash[:success] = "#{@sport.name} created"
      redirect_to @sport
    else
      render :new
    end
  end

  def show
    @sneakers = @sport.sneakers
  end

  def update
    if @sport.update(sport_params)
      flash[:success] = "#{@sport.name} updated!"
      redirect_to @sport
    else
      render :edit
    end
  end

  private

  def sport_params
    params.require(:sport).permit(:name, :image_url)
  end

  def set_sport
    @sport = Sport.find(params[:id])
  end
end

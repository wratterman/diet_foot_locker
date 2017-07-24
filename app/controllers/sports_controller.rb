class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :update, :brands]
  # before_action :get_sports, only: [:index]

  def index
    @sports = Sport.all
    @is_admin = current_admin?
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      flash[:success] = "#{@sport.name} created"
      redirect_to @sport
    else
      render :'admin/sports/new'
    end
  end

  def show
    @sneakers = @sport.sneakers
    @is_admin = current_admin?
  end

  def update
    if @sport.update(sport_params)
      flash[:success] = "#{@sport.name} updated!"
      redirect_to @sport
    else
      render :edit
    end
  end

  def brands
    @brands = @sport.my_brands
    render :'/brands/index'
  end


  private

  def sport_params
    params.require(:sport).permit(:name, :image_url, brand_ids: [])
  end

  def set_sport
    @sport = Sport.find(params[:id])
  end
end

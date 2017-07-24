class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :update, :sports]
  # before_action :get_brands, only: [:index]

  def index
    @brands = Brand.all
    @is_admin = current_admin?
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = "#{@brand.name} created"
      redirect_to @brand
    else
      render :'admin/brands/new'
    end
  end

  def show
    @sneakers = @brand.sneakers
    @new_releases = @brand.new_releases
  end

  def update
    if @brand.update(brand_params)
      flash[:success] = "#{@brand.name} updated!"
      redirect_to @brand
    else
      render :edit
    end
  end

  def sports
    @sports = @brand.my_sports
    render :'/sports/index'
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :image_url, sport_ids: [])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end
end

class SneakersController < ApplicationController
  before_action :set_sneaker, only: [:show, :update]
  before_action :get_sneakers, only: [:index]

  def index
    @is_admin = current_admin?
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @is_admin = current_admin?
    @review = @sneaker.reviews.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    if @sneaker.save
      flash[:success] = "#{@sneaker.name} created"
      redirect_to @sneaker
    else
      render :new
    end
  end

  def update
    if @sneaker.update(sneaker_params)
      flash[:success] = "#{@sneaker.name} updated!"
      redirect_to @sneaker
    else
      render :edit
    end
  end

  private

  def set_sneaker
    @sneaker = Sneaker.find(params[:id])
  end

  def sneaker_params
    params.require(:sneaker).permit(:name, :description, :image_url,
                                    :price, :footlocker_url)
  end
end

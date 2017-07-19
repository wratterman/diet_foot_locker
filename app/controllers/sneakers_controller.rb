class SneakersController < ApplicationController

  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
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

  private

  def sneaker_params
    params.require(:sneaker).permit(:name, :description, :image_url,
                                    :price, :footlocker_url)
  end
end

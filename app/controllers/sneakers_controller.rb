class SneakersController < ApplicationController

  before_action :set_sneaker, only: [:show, :edit, :update, :destroy]

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneakers_params)
    if @sneaker.save
      flash[:success] = "#{@sneaker.name} created!"
      redirect_to @sneaker
    else
      render :new
    end
  end

  def index
    @sneakers = Sneaker.all
  end

  def show
  end

  def edit
  end

  def update
    if @sneaker.update(sneakers_params)
      flash[:success] = "#{@sneaker.name} updated!"
      redirect_to @sneaker
    else
      render :edit
    end
  end

  def destroy
    sneaker = @sneaker
    sneaker.destroy
    flash[:delete] = "#{sneaker.name} deleted!"

    redirect_to sneakers_path
  end

  private

  def sneakers_params
    params.require[:sneaker].permit[:name, :description, :image_url,
                                    :price, :footlocker_url]
  end

  def set_sneaker
    @sneaker = Sneaker.find(params[:id])
  end
end

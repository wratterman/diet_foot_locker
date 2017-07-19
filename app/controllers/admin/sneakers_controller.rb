class Admin::SneakersController < Admin::MasterController
  before_action :set_sneaker, only: [:show, :edit, :update, :destroy]

  def index
    @sneakers = Sneaker.all
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneakers_params)
    if @sneaker.save
      #do a thing
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sneaker.update(sneakers_params)
      #do a thing
    else
      render :edit
    end
  end

  def destroy
    @sneaker.destroy
    #promt user + redirect
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

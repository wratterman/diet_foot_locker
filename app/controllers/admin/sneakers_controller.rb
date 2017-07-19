class Admin::SneakersController < Admin::MasterController
  before_action :set_sneaker, only: [:edit, :update, :destroy]

  def new
    @sneaker = Sneaker.new
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

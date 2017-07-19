class Admin::SneakersController < Admin::MasterController
  before_action :set_sneaker, only: [:edit, :destroy]

  def new
    @sneaker = Sneaker.new
  end

  def edit
  end

  def destroy
    @sneaker.destroy
    flash[:delete] = "#{@sneaker.name} deleted"
    redirect_to sneakers_path
  end

  private

  def set_sneaker
    @sneaker = Sneaker.find(params[:id])
  end
end

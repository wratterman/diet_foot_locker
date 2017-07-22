class Admin::BrandsController < Admin::MasterController
  before_action :set_brand, only: [:edit, :destroy]

  def new
    @brand = Brand.new
    @sneakers = Sneaker.all
  end

  def edit
    @sneakers = Sneaker.all
  end

  def destroy
    @brand.destroy
    flash[:delete] = "#{@brand.name} deleted"
    redirect_to brands_path
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end

class Admin::SportsController < Admin::MasterController
  before_action :set_sport, only: [:edit, :destroy]

  def new
    @sport = Sport.new
    @brands = Brand.all
    @sneakers = Sneaker.all
  end

  def edit
    @sneakers = Sneaker.all
    @brands = Brand.all
    @is_admin = current_admin?
  end

  def destroy
    @sport.destroy
    flash[:delete] = "#{@sport.name} deleted"
    redirect_to sports_path
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end
end

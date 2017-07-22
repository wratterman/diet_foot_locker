class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    true unless current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:log_in_now] = "Please log in to your account. Or create one. Your choice."
      redirect_to login_path
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def login(user)
    session[:user_id] = user.id
    flash[:signin] = "#{user.username}, successfully logged in!"
    redirect_to sneakers_path
  end

  def get_sneakers
    if request.url == sneakers_url || request.url == root_url
      @sneakers = Sneaker.all
    else
      # sneakers_by_brand
    end
  end

  # def sneakers_by_brand
  #   @brand = Brand.find(params[:id]) unless params[:id].nil?
  #
  #   if request.url == brand_sneakers_url(@brand)
  #     @brand = Brand.find(params[:id])
  #     @sneakers = Sneaker.where(brand_id: @brand.id)
  #   else
  #     sneakers_by_sport
  #   end
  # end
  #
  # def sneakers_by_sport
  #   @sport = Sport.find(params[:sport_id]) unless params[:sport_id].nil?
  #
  #   if request.url == sport_sneakers_url(@sport)
  #     @sport = Sport.find(params[:sport_id])
  #     @sneakers = Sneaker.where(sport_id: @sport.id)
  #   else
  #     sneakers_by_sport_by_brand
  #   end
  # end
  #
  # def sneakers_by_sport_by_brand
  #   if current_page?(brand_sport_sneakers_path)
  #     @brand = Brand.find(params[:brand_id])
  #     @sport = Sport.find(params[:sport_id])
  #     @sneaker = @brand.sneakers.where(sport_id: @sport.id)
  #   else
  #     sneakers_by_brand_by_sport
  #   end
  # end
  #
  # def sneakers_by_brand_by_sport
  #   if current_page?(sport_brand_sneakers)
  #   end
  # end
end

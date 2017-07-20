class ReviewsController < ApplicationController

  before_action :require_login, only: [:create, :destroy]

  def create
    @review = Review.new(review_params)
    @review.sneaker_id = params[:sneaker_id]
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Review posted by #{@review.user.username}"
      redirect_to @review.sneaker
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @sneaker = @review.sneaker
    @review.destroy

    flash[:delete] = "Review deleted"
    redirect_to @sneaker
  end

  private

  def review_params
    params.require(:review).permit(:body, :sneaker_id, :user_id)
  end
end

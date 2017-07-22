class UsersController < ApplicationController

  before_action :current_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    @sneakers = Sneaker.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
    else
      render :new
    end
  end

  def show
    @sneakers = @user.sneakers
  end

  def edit
    @sneakers = Sneaker.all
  end

  def update
    @sneakers = Sneaker.all
    if @user.update(user_params)
      flash[:success] = "#{@user.username} successfully updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, sneaker_ids: [])
  end
end

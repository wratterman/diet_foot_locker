class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      login(@user)
    end
  end

  def destroy
    if session.clear
      flash[:notice] = "Goodbye"
    end
    redirect_to root_path
  end

end

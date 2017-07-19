class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
    session[:user_id] = @user.id
    flash[:signin] = "#{@user.username}, successfully logged in!"
    redirect_to sneakers_path
  end
end

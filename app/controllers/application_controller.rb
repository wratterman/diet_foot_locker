class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def login(user)
    session[:user_id] = user.id
    flash[:signin] = "#{user.username}, successfully logged in!"
    redirect_to user_path(user)
  end
end

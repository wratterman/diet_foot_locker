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
end

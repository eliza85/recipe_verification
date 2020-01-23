class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def user_admin
    binding.pry
    if @current_user.admin = false
      flash[:alert] = "You need to be an admin to perform that action."
      redirect_to '/'
    end
  end


  def authorize
    if !current_user
      flash[:alert] = "You are not logged in."
      redirect_to '/'
    end
  end
end

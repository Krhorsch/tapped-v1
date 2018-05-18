class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  private

  def require_login
    unless logged_in?
      flash[:notice] = "You must be logged in to access your previous request"
      redirect_to '/'
    end
  end
end

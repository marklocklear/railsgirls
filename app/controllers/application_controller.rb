class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  #
  # Authentication Methods
  #

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to log_in_path
      return false
    end
  end

  def require_no_user
    if current_user
      redirect_to root_path
      return false
    end
  end

  #
  # Redirect Management
  #

  def store_location
    session[:return_to] = request.referer
  end

  def return_to
    @return_to ||= session[:return_to]
  end

  def reset_return_to
    session.delete :return_to
  end

  def redirect_back_or_default(default, options = {})
    if return_to
      reset_return_to
      redirect_to @return_to, options
    else
      redirect_to default, options
    end
  end
end
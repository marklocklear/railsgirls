class SessionsController < ApplicationController
  before_filter :store_location
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy]

  #
  # New / Log In
  #

  def new
  end

  #
  # Create / Log In
  #

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_back_or_default root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  #
  # Destroy / Log Out
  #

  def destroy
    log_out
    redirect_back_or_default root_url, notice: "Logged out!"
  end
end

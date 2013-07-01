class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  #
  # New / Sign Up
  #

  def new
    @user = User.new
  end

  #
  # Create
  #

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in @user
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end

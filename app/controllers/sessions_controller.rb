class SessionsController < ApplicationController
  before_filter :redirect_logged_in_user, only: [:new]

  def new
    @user = User.first
  end

  def create
    if @user = login(valid_params[:email], valid_params[:password])
      redirect_to root_path
    else
      render action: 'new', alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

  private
  def valid_params
    params[:user]
  end
end

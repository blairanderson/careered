class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  def not_found
    if current_user && board = current_user.boards.find(params[:id])
      redirect_to "#{ember_path}?board_id=#{board.id}"
    else
      redirect_to root_path
    end
  end

  def redirect_logged_in_user
    if logged_in?
      redirect_to root_url and return
    end
  end
end

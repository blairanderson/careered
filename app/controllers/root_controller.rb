class RootController < ApplicationController
  layout :pick_layout
  before_action :authenticate_user

  def index

  end

  def pick_layout
    case action_name
      when "react"
        "react"
      when "ember"
        "ember"
      else
        "application"
    end
  end

  def authenticate_user
    unless logged_in?
      redirect_to login_path
    end
    @current_user_json = UserSerializer.new(current_user).serializable_hash.to_json
  end
end

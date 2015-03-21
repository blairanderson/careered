class RootController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    unless logged_in?
      redirect_to login_path
    end
    @current_user_json = UserSerializer.new(current_user).serializable_hash.to_json
  end
end

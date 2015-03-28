class RootController < ApplicationController
  before_action :authenticate_user
  before_action :load_user_data, except: [:index]

  def authenticate_user
    @user = (api_user||current_user)
    unless @user
      redirect_to login_path and return
    end
  end

  def load_user_data
    @current_user_data = {
      user: UserSerializer.new(@user).serializable_hash,
      boards: array_of(@user.boards.includes(:lists), BoardSerializer),
      lists: array_of(@user.lists.includes(:cards), ListSerializer),
      cards: array_of(@user.cards, CardSerializer)
    }.to_json
  end

  def array_of(items=nil, serializer=nil)
    return ActiveModel::ArraySerializer.new(items, each_serializer: serializer).serializable_array
  end
end

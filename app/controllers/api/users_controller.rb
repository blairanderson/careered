module Api
  class UsersController < ApiController
    def show
      render json: User.find(params[:id])
    end

    def current
      if current_user
        render json: current_user
      else
        head :unauthorized
      end
    end
  end
end

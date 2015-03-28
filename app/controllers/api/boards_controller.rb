module Api
  class BoardsController < ApiController
    def index
      render json: current_user.boards.includes(lists: [:cards])
    end

    def show
      render json: current_user.boards.find(params[:id])
    end

    def create
      board = Board.new(params[:board])

      if board.save
        board.members << current_user
        render json: board, status: :ok
      else
        render json: board.errors, status: :unprocessable_entity
      end
    end

    def update
    	board = current_user.boards.find(params[:id])
    	if board.update_attributes(params[:board])
        render json: board, status: :ok
      else
        render json: board.errors, status: :unprocessable_entity
      end    		
    end
  end
end

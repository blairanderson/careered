module Api
  class CardsController < ApplicationController
    def index
      render json: current_user.cards
    end

    def show
      render json: current_user.cards.find(params[:id])
    end

    def create
    	card = Card.new(params[:card])
    	if card.save
    		render json: card, status: :ok
    	else
    		render json: card.errors, status: :unprocessable_entity
    	end
    end

    def update
    	card = current_user.cards.find(params[:id])
    	if card.update_attributes(params[:card])
        render json: card, status: :ok
      else
        render json: card.errors, status: :unprocessable_entity
      end
    end

    def destroy
      card = current_user.cards.find(params[:id])
			if card.destroy
				render json: card, status: :ok
			else
				render json: card.errors, status: :unprocessable_entity
			end
    end

    def sort
      @list = List.find(params[:list_id])
      card_ids = params[:card].map(&:to_i)

      # unless (card_ids - current_user.card_ids).empty?
      #   render nothing: true, status: :unauthorized
      # end

      card_ids.each_with_index do |id, index|
        Card.update_all({ position: index + 1,  list_id: @list.id },
                        { id: id })
      end

      @cards = @list.cards.reload
    end

  end
end

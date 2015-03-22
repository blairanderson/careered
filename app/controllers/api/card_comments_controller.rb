module Api
  class CardCommentsController < ApplicationController
    def create
      card = current_user.cards.find(params[:card_comment][:card_id])
      params[:card_comment][:commenter_id] = current_user.id

      comment = card.comments.build(params[:card_comment])
      if comment.save
        render json: comment
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end
    
  end
end

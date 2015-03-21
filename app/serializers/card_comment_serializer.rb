class CardCommentSerializer < ActiveModel::Serializer
  attributes :id, :card_id, :commenter_id, :content, :position, :created_at, :created_at_timestamp

  has_one :commenter
end

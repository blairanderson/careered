class ListSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :title, :slug, :description,
    :open, :position, :card_template, :created_at, :updated_at

  has_many :cards
end

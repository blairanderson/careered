class ListSerializer < ActiveModel::Serializer
  attributes :id, :id, :board_id, :title, :slug, :description, :open, :position, :card_template, :created_at, :updated_at
end

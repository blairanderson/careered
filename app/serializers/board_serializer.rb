class BoardSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name, :description,  :open

  has_many :lists
end

class BoardSerializer < ActiveModel::Serializer
  attributes :id, :id, :desc, :name, :open, :slug

  has_many :members, :lists
end

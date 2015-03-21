class BoardSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name, :description,  :open
end

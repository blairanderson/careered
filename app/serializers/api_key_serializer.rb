class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :access_token, :expired_at
end

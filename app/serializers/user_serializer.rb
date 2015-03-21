class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :full_name, :bio, :gravatar_url, :session_api_key

  has_many :api_keys, :boards, :lists, :cards
end

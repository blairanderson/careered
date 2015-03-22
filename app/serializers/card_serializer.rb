class CardSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :title, :description,
    :due_date, :open, :comment_count, :url,
    :assignee_id, :position, :company_id,
    :salary, :created_at, :updated_at
end

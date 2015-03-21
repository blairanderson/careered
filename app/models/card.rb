# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  list_id     :integer          not null
#  title       :string(255)      not null
#  description :text
#  due_date    :datetime
#  open        :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer
#

class Card < ActiveRecord::Base
  default_scope {order("cards.position")}
  acts_as_list

  acts_as_taggable_on :languages, :growth, :experience

  belongs_to :list
  belongs_to :assignee, class_name: "User"

  has_one :board, through: :list

  has_many :cards_members, class_name: "CardMember"
  has_many :members, through: :cards_members

  has_many :comments, class_name: "CardComment"
  has_many :activities, class_name: "CardActivities"

  accepts_nested_attributes_for :comments

end

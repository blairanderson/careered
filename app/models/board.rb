# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  open        :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ActiveRecord::Base
  has_many :lists
  has_many :board_activities
  has_many :boards_members, class_name: "BoardMember"
  has_many :members, through: :boards_members
end

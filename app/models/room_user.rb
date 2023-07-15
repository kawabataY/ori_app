class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :tasks, through: :room

  validates :user_id, uniqueness: { message: 'は既に別のグループに所属しています' }
end

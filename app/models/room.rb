class Room < ApplicationRecord
  # association
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :tasks
  has_many :shoppinglists
end

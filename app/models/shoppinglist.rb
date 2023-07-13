class Shoppinglist < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :task, optional: true
end

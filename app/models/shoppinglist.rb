class Shoppinglist < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :task, optional: true

  with_options presence: true do
    validates :content, format: { without: /[!@#\$%^&*,.?":{}|<>]/, message: "cannot contain special characters" }
    validates :room
    validates :user 
  end
end

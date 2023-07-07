class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :room
  belongs_to :frequency
  has_many :comments

  validates :frequency_id, numericality: { other_than: 1 , message: "can't be blank"}
end

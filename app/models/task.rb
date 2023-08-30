class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :room
  belongs_to :frequency
  has_many :donetasks
  has_many :mytasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :shoppinglists, dependent: :destroy


  # バリデーション
  with_options presence: true do
    validates :content, format: { without: /[!@#\$%^&*(),.?":{}|<>]/, message: "cannot contain special characters" }
    validates :itsu
    validates :room
    validates :user 
  end
  
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :task
  has_many :mytasks
  has_many :comments
  has_many :shoppinglists

  # バリデーション
  validates :name, presence: true
  validate  :password_complexity

  before_create :generate_pin

  private

  def generate_pin
    self.pin = SecureRandom.hex(5)
  end

  def password_complexity
    return if password.blank?
    return if password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)

    errors.add(:password, 'は、半角英数字混合で入力してください')
  end
end

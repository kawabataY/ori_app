class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_app_id

  # バリデーション
  validates :name, presence: true
  validates :app_id, presence: true

  validate :password_complexity

  private

  def generate_app_id  # ユーザーが互いに見つけるためにランダムなユーザーIDを付与
    self.app_id = SecureRandom.hex(5)
  end

  def password_complexity
    return if password.blank?

    return if password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)

    errors.add(:password, 'は、半角英数字混合で入力してください')
  end
end

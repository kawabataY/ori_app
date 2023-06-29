class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_app_id

  private
  def generate_app_id #ユーザーが互いに見つけるためにランダムなユーザーIDを付与
    self.app_id = SecureRandom.hex(5)
  end
end

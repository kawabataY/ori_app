FactoryBot.define do
  factory :shoppinglist do
    content         { 'テスト' }
    association     :user
    association     :room
  end
end

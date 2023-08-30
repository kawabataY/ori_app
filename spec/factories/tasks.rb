FactoryBot.define do
  factory :task do
    content         { 'テスト' }
    itsu            { '2023-07-19' }
    frequency_id    { 2 }
    association     :user
    association     :room
  end
end
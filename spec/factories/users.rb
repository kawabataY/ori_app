FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6) }
    password_confirmation { password }
    app_id                { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end

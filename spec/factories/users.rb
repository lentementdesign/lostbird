FactoryBot.define do
  factory :user do
    nickname { "ユーザー" }
    sequence(:email) { |n| "ippan#{n}@example.com" }
    password { "password02" }
  end
end

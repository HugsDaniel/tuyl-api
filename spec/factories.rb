FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :activity do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.question }
  end

  factory :skill do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.question }
  end
end

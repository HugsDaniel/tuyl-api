# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
  end

  factory :activity do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.question }
  end

  factory :skill do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.question }
  end

  factory :user_skill do
    user { create(:user) }
    skill { create(:skill) }
  end

  factory :user_activity do
    user { create(:user) }
    activity { create(:activity) }
  end
end

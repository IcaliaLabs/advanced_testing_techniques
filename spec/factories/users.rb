FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    sequence(:email) {  |n| "test_user#{n}@mail.com" }
    password { '12345678' } 
    password_confirmation { '12345678' }

    trait :as_admin do
      admin { true }
    end

    after(:create) do |user|
      create_list(:shop, 1, user: user)
    end
  end
end

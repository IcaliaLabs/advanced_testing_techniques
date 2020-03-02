FactoryBot.define do
  factory :user do
    sequence(:email) {  |n| "test_user#{n}@mail.com" }
    password { '12345678' } 
    password_confirmation { '12345678' }

    factory :user_with_shops do
      transient do
        shops_count { 2 }
      end

      after(:create) do |user, evaluator|
        create_list(:shop, evaluator.shops_count, user: user)
      end
    end
  end
end

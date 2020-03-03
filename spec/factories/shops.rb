FactoryBot.define do
  factory :shop do
    name { FFaker::Company.name }
    user

    after(:create) do |shop|
      create_list(:product, 3, shop: shop)
    end
  end
end

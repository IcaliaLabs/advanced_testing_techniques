FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Product.letters(200) }
    price { 100.0 }
    shop
  end
end

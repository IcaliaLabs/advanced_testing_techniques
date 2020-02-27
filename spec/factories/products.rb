FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    price { 10.00 }
    description { "A sample description" }
  end
end

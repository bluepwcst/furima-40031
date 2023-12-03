FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    category_id { 1 }
    condition_id { 1 }
    shipping_charge_id { 1 }
    region_id { 1 }
    delivery_time_id { 1 }
    price { 1 }
    user { nil }
  end
end

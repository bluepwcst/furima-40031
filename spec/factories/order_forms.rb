FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 47) } # 日本の都道府県IDを仮定して2から47の間でランダムに生成
    city { '渋谷区' }
    street_address { '道玄坂1-1-1' }
    building_name { '渋谷ビル101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

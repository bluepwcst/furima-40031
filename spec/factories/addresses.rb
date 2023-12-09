FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    region_id { 2 } # ここではサンプルとして2を設定していますが、実際のIDに合わせてください
    city { '東京都' }
    street_address { '渋谷1-1-1' }
    building_name { '渋谷ビル101' } # 任意の項目
    phone_number { '09012345678' }
  end
end

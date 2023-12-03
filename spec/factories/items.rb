FactoryBot.define do
  factory :item do
    # Userの関連付け。既存のUserファクトリを使用して関連付けられたUserインスタンスを生成
    association :user

    name { "サンプル商品名" }
    description { "サンプル商品の説明" }
    
    # category_id, condition_id, などのIDは、それぞれ実際に存在する有効なIDを設定する
    # 1ではなく、実際のカテゴリーID、状態IDなどを使用
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    region_id { 2 }
    delivery_time_id { 2 }

    price { 5000 }

    # 画像について
    # 画像の取り扱いについては、プロジェクトの設定に依存します
    # Active Storageを使用している場合は、以下のように設定できます
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'sample_image.png')), filename: 'sample_image.png', content_type: 'image/png')
    end
  end
end

class Address < ApplicationRecord
    # 関連付け
    belongs_to :order
  
    # バリデーション
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true },length: { in: 10..11 }

  
    # 必要に応じて、フォーマットや長さのバリデーションを追加することもできます。
    # 例: 郵便番号のフォーマットを確認する
    # validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
end
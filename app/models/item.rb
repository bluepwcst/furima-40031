class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_time

  # バリデーションの設定
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # 価格の数値範囲を確認するカスタムメソッド
  validate :price_range_valid

  # 商品が売却済みかどうかを確認するメソッド
  def sold_out?
    order.present?
  end

  private

  # 価格が300〜9,999,999の間であることを確認するカスタムバリデーション
  def price_range_valid
  if price.present?
    errors.add(:price, 'must be between ¥300 and ¥9,999,999') if price < 300 || price > 9_999_999 
  end
  end
end
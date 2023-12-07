# app/forms/order_form.rb
class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  # バリデーションの設定
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def save
    # OrderとShippingAddress（またはそれに相当するモデル）を保存するロジックを実装
    # 例:
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end

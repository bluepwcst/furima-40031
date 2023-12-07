class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  # バリデーションの処理
  validates :postal_code, presence: true
  # ...他にも必要なバリデーションを追加

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end

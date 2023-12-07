# app/forms/order_form.rb
class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :street_address, :building_name, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    # Addressモデルを使用して、関連する住所情報を作成する
    # `address` を `Address` モデルの正しい属性名である `street_address` に変更する
    Address.create(
      order_id: order.id, 
      postal_code: postal_code, 
      region_id: region_id, 
      city: city, 
      street_address: street_address, # 修正: address -> street_address
      building_name: building_name, 
      phone_number: phone_number
    )
  end

end

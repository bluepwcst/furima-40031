class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  # 必要に応じてバリデーションを追加
end

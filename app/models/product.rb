class Product < ApplicationRecord
  belongs_to :userd
  has_one :order
  has_one_attached :image

end

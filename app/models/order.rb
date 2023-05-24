class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :carted_products
  # validates :user_id, presence: true
  # validates :product_id, presence: true
  # validates :quantity, presence: true
  # validates :subtotal, presence: true
  # validates :tax, presence: true
  # validates :total, presence: true
end

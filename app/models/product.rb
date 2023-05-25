class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def is_discounted?
    return price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def images
    Image.where(product_id: id)
  end
end

class Product < ApplicationRecord
  belongs_to :supplier
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

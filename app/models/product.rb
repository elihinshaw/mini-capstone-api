class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :description, length: { maximum: 500 }
  validates :image_url, allow_blank: true, format: { with: %r{.(jpg|png)\Z}i }

  def is_discounted?
    return price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end

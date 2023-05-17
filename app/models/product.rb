class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "image must be png, jpg, or jpeg", multiline: true

  def is_discounted?
    return price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end

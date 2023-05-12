class Product < ApplicationRecord
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

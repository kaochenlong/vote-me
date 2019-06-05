class Product < ApplicationRecord
  # scope
  scope :available, -> { where(is_available: true) }
  scope :expensive_product, -> { price_over(50) }
  scope :good_product, -> { available.expensive_product }
  scope :price_over, -> (n) { where("price >= #{n}") }

  # def self.available
  #   where(is_available: true)
  # end
end

class Product < ApplicationRecord
  # scope
  scope :available, -> { where(is_available: true) }
  scope :expensive_product, -> { where('price >= 50') }
  scope :good_product, -> { available.expensive_product }

  # def self.available
  #   where(is_available: true)
  # end
end

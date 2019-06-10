class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  default_scope { order(id: :desc) }
end

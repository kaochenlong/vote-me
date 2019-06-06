FactoryBot.define do
  factory :order_item do
    order { nil }
    product { nil }
    quantity { 1 }
    strike_price { "9.99" }
  end
end

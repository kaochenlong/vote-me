require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do
    cart = Cart.new
    cart.add_item 1
    expect(cart.empty?).to be false
  end
end

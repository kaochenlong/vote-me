require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new }

  describe "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do
      cart.add_item 1
      expect(cart.empty?).to be false
    end

    it "加了相同種類商品到購物車，購買項目（CartItem）不會增加，商品的數量會改變。" do
      3.times { cart.add_item 1 }
      2.times { cart.add_item 2 }
      3.times { cart.add_item 1 }

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 6
    end

    it "商品可以放到購物車裡，也可以再拿出來。" do
      p1 = create(:product)
      p2 = create(:product)

      2.times { cart.add_item(p1.id) }
      3.times { cart.add_item(p2.id) }

      expect(cart.items.first.product).to be_a Product
      expect(cart.items.first.product.title).to eq p1.title
    end
  end

  describe "進階功能" do
  end
end

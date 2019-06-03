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

    it "可以計算整台購物車的總消費金額。" do
      p1 = create(:product, price: 100)
      p2 = create(:product, price: 50)

      2.times { cart.add_item(p1.id) }
      3.times { cart.add_item(p2.id) }

      expect(cart.total_price).to eq 350
    end

    it "聖誕節全面打 9 折" do
      t = Time.local(2020, 12, 25, 10, 5, 0)
      Timecop.travel(t)

      p1 = create(:product, price: 100)
      p2 = create(:product, price: 50)

      2.times { cart.add_item(p1.id) }
      3.times { cart.add_item(p2.id) }

      expect(cart.total_price).to eq 315
    end
  end

  describe "進階功能" do
  end
end

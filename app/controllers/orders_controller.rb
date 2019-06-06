class OrdersController < ApplicationController
  include CartsHelper

  before_action :authenticate_user!

  def create
    # 建立訂單
    # @order = Order.new(order_params)
    # @order.user = current_user

    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(product: item.product,
                               quantity: item.quantity,
                               strike_price: item.product.price)
    end

    if @order.save
      # 刷卡
      # 清空購物車
      redirect_to products_path, notice: '親，感謝!'
    else
      render 'carts/checkout'
    end

  end

  private
  def order_params
    params.require(:order).permit(:recipient, :phone, :address, :note)
  end
end
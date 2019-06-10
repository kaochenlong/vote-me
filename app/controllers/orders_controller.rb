class OrdersController < ApplicationController
  include CartsHelper
  include Payable

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    # 建立訂單
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(product: item.product,
                               quantity: item.quantity,
                               strike_price: item.product.price)
    end

    if @order.save
      # 刷卡
      nonce = params[:payment_method_nonce]

      result = gateway.transaction.sale(
        amount: current_cart.total_price,
        payment_method_nonce: nonce,
        order_id: @order.id,
        options: {
          submit_for_settlement: true
        }
      )

      if result.success?
        # 清空購物車
        session[:cart9527] = nil

        redirect_to products_path, notice: '親，感謝!'
      else
        # 失敗
        render 'carts/checkout'
      end
    else
      render 'carts/checkout'
    end

  end

  private
  def order_params
    params.require(:order).permit(:recipient, :phone, :address, :note)
  end
end
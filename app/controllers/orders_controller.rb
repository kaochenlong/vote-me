class OrdersController < ApplicationController
  def create
    # 建立訂單

    # 刷卡
    redirect_to products_path, notice: '親，感謝!'
  end
end
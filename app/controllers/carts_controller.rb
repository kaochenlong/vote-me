class CartsController < ApplicationController
  before_action :authenticate_user!

  def add
    cart = Cart.from_hash(session[:cart9527])
    cart.add_item(params[:id])
    session[:cart9527] = cart.serialize

    redirect_to products_path, notice: '已加至購物車'
  end
end
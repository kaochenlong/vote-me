class ProductsController < ApplicationController
  def index
    @products = Product.good_product
  end
end
module CartsHelper
  def current_cart
    @cccc8888c ||= Cart.from_hash(session[:cart9527])
  end
end

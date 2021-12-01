class CartsController < ApplicationController
  before_action :authenticate_user!, :check_cart, only: [:show]

  def show
    @cart = Cart.find(params[:id])
    @total_amount = @cart.total_price()
  end

  private

  def check_cart
    if current_user.cart != Cart.find(params[:id])
      flash[:warning] = "Cha-perlipopette ! Ce panier n'est pas le tien 🙀"
      redirect_to root_path
    end
  end

end

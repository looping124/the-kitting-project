class MycartsController < ApplicationController
  def show
    @user = current_user
    @cart = @user.cart
    @total_amount = @cart.total_price()
  end
end

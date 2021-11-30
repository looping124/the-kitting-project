class JoinTableItemCartsController < ApplicationController
  def create
    JoinTableItemCart.create(cart: current_user.cart, item: Item.find(params[:id]))
    redirect_to root_path
  end

  def destroy
    @item = JoinTableItemCart.find_by(cart: current_user.cart, item: Item.find(params[:id]))
    @item.destroy
    redirect_to cart_path(current_user.cart)
  end

  def update
    @item = JoinTableItemCart.find_by(cart: current_user.cart, item: Item.find(params[:id]))
    increment = params[:increment].to_i
    @item.update(quantity: @item.quantity + increment)
    redirect_to cart_path(current_user.cart)
  end
end

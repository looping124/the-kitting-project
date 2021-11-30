class JoinTableItemCartsController < ApplicationController
  def create
    JoinTableItemCart.create(cart: current_user.cart, item: Item.find(params[:id]))
    redirect_to item_path(params[:id])
  end
end

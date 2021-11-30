class CartsController < ApplicationController
  before_action :authenticate_user!, :check_cart, only: [:show]

  def show

  end

  private

  def check_cart
    if current_user.cart != Cart.find(params[:id])
      redirect_to root_path
    end
  end

end

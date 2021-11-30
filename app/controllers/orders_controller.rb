class OrdersController < ApplicationController
 
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # def new
  # end

  def create
    if current_user.cart.join_table_item_carts.size >= 1
      order = Order.create(user: current_user)
      redirect_to order_path(order)
    else
      redirect_to root_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  # #For admin only :
  # def edit
  # end

  # def update
  # end

  # def destroy
  # end


end

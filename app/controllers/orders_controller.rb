class OrdersController < ApplicationController
 
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # def new
  # end

  def create
    Order.create(user: current_user)
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

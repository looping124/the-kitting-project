class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    Order.create(user: current_user)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

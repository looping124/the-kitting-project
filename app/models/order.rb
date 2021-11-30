class Order < ApplicationRecord

  #Callbacks
  after_create :fill_order
  after_create :empty_cart
 
  after_create :send_new_order_to_admin
  after_create :send_order_validation_to_user

  #Associations
  belongs_to :user
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders
 
  private

  #on remplit la commande avec la join table du panier
  def fill_order
    self.user.join_table_item_carts.each do |join_table_item_cart|
      JoinTableItemOrder.create(order: self, item: join_table_item_cart.item)
    end
  end

  #on vide le panier
  def empty_cart
    self.user.join_table_item_carts.destroy_all
  end

end

  def total_price
    total = 0
    self.join_table_item_orders.each do |order_items|
      total += order_items.item.price * order_items.quantity
    end
    return total
  end

  def send_new_order_to_admin
    UserMailer.new_order_email(self).deliver_now
  end

  def send_order_validation_to_user
    UserMailer.order_validation_email(self).deliver_now
  end


end

class Order < ApplicationRecord
  after_create :send_new_order_to_admin
  after_create :send_order_validation_to_user

  #Associations
  belongs_to :user
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders

  def total_price
    total = 0
    self.join_table_item_order.each do |order_items|
      total += order_items.item.price * order_items.quantity
    end
    return total
  end

  private

  def send_new_order_to_admin
    UserMailer.new_order_email(self).deliver_now
  end

  def send_order_validation_to_user
    UserMailer.order_validation_email(self).deliver_now
  end

end

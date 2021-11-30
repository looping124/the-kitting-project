class Order < ApplicationRecord

  after_create :fill_order
  after_create :empty_cart

  #Associations
  belongs_to :user
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders

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

end

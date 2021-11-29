class Order < ApplicationRecord
  #Associations
  belongs_to :user
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders
end

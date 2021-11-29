class Item < ApplicationRecord
  #Associations
  has_many :join_table_item_carts
  has_many :carts, through: :join_table_item_carts
  
  has_many :join_table_item_orders
  has_many :orders, through: :join_table_item_orders

  #Validations
  validates :title, presence: true, length: { in: 3..140, message: ": Le nombre de caractère doit être compris entre 3 et 140" }
  validates :description, presence: true, length: { in: 20..1000, message: ": Le nombre de caractère doit être compris entre 20 et 1000" }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/, message: ": Le prix doit préciser exactement 2 chiffres après la virgule" }, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999, message: ": Petit gourmand ! Le prix doit être inférieur ou égal à 999€." }
  validates :image_url, presence: true
end

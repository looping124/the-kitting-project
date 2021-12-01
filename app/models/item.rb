class Item < ApplicationRecord
  #Associations
  has_many :join_table_item_carts
  has_many :carts, through: :join_table_item_carts
  
  has_many :join_table_item_orders
  has_many :orders, through: :join_table_item_orders

  has_one_attached :item_picture

  #Validations
  validates :title, presence: true, length: { in: 3..140, message: ": Le nombre de caractères doit être compris entre 3 et 140" }
  validates :description, presence: true, length: { in: 10..1000, message: ": Le nombre de caractères doit être compris entre 10 et 1000" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999, message: "Petit gourmand ! Le prix doit être inférieur ou égal à 999€.", only_integer: true }
  validates :image_url, presence: true
  # validate :has_item_picture?

  private

  def has_item_picture?
    unless self.item_picture.attached?
      errors.add(:item_picture, "Merci d'ajouter une photo.")
    end
  end

end

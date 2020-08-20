class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user
  validates :amount,numericality: { only_integer: true }
  def subtotal
    item.price * amount
  end
end

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user
  validates :amount,numericality: { only_integer: true }
  def subtotal
    item.tax_price * amount
  end

  def tax_price
    (item.price * 1.1).floor
  end
end

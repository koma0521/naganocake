class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :end_user
  validates :amount,numericality: { only_integer: true },presence: true
  def subtotal
    item.tax_price.to_i * amount.to_i
  end

  def tax_price
    (item.price * 1.1).floor
  end
end

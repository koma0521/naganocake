class Order < ApplicationRecord
  belongs_to :end_user
  enum status: { 入金待ち: 0,入金確認: 1,制作中:2,発送準備中:3,発送済み:4 }
  enum payment_method: {クレジットカード:0,銀行振り込み:1}
  attribute :payment_method, default: 0
  attribute :shipping_cost, default: 800
  attribute :status, default: 0
  attr_reader :add
  has_many :order_details

  def total_price
    self.order_details.to_a.sum{|item| item.subtotal}
  end

  def total_amount
    self.order_details.to_a.sum{|item| item.amount}
  end


end

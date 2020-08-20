class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: { 有効: false, 退会済み: true}

  has_many :addresses
  has_many :cart_items

  validates :first_name,presence: true
  validates :last_name,presence: true
  validates :first_name_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :address,presence: true
  validates :postal_code,presence: true,format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}
  validates :telephone_number,presence: true,format: {with: /\A[0-9]+\z/ }
  validates :is_deleted,presence: true
  
  def total_price
    cart_items.to_a.sum{|item| item.subtotal}
  end

  def name
    [first_name,last_name].join('')
  end

  def name_kana
    [first_name_kana,last_name_kana].join('')
  end

  def active_for_authentication?
    super && self.is_deleted == '有効'
  end
end

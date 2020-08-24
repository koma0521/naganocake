class Item < ApplicationRecord
    enum sale_status: { 売り切れ: false, 販売中: true}
    belongs_to :genre
    attachment :image
    validates :name, presence: true
    validates :image,presence: true
    validates :introduction, presence:true
    validates :price, numericality: true

    def tax_price
        (price * 1.10).floor.to_s(:delimited)
    end
end

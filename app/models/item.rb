class Item < ApplicationRecord
    enum is_active: { 売り切れ: false, 販売中: true}
    belongs_to :genre
    attachment :image
    validates :name, presence: true
    validates :image_id,presence: true
    validates :introduction, presence:true
    validates :price, numericality: true
end

class Item < ApplicationRecord
    enum is_active: { 売り切れ: false, 販売中: true}
    belongs_to :genre
    attachment :image
end

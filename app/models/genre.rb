class Genre < ApplicationRecord
    enum is_active: { 無効: false, 有効: true}
    has_many :items
    validates :name, presence: true
end

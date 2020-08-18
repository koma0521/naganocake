class Genre < ApplicationRecord
    enum is_active: { 有効: false, 無効: true}
end

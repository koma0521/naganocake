class Genre < ApplicationRecord
    enum is_active: { passive: false, active: true}
end

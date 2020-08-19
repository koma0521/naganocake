class Address < ApplicationRecord
    belongs_to :end_user 
    validates :postal_code,presence: true, format: { with: /\A\d{7}\z/}
    validates :address,presence: true
    validates :name,presence: true
end

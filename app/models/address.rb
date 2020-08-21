class Address < ApplicationRecord
    belongs_to :end_user 
    validates :postal_code,presence: true, format: { with: /\A\d{7}\z/}
    validates :address,presence: true
    validates :name,presence: true

    def view_postal_code_and_address_and_name
        self.postal_code + ' ' + self.address + ' ' + self.name
    end
end

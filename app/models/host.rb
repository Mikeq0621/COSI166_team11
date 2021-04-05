class Host < ApplicationRecord
    geocoded_by :full_address
    after_validation :geocode
    has_secure_password
    has_many :transactions
    has_many :listings
    def full_address
        [address, city, state, 'USA'].compact.join(', ')
    end
    has_many :requests
end

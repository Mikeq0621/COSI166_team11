class Host < ApplicationRecord
    has_secure_password
    has_many :transactions
    has_many :listings
    has_many :requests
end

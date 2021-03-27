class User < ApplicationRecord
    has_secure_password
    has_many :transactions
    # Validates for a legal user signup format

end

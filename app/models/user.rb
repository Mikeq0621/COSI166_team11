class User < ApplicationRecord
    geocoded_by :full_address
    after_validation :geocode
    has_secure_password
    #has_many :transactions
    #has_many :requests
    # Validates for a legal user signup format
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_NUMBER = /\d[0-9]\)*\z/
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    
    validates :phone_number , presence: true, length: { maximum: 10 }, format: { with: VALID_PHONE_NUMBER}

    def full_address
        [address, city, state, 'USA'].compact.join(', ')
    end

end

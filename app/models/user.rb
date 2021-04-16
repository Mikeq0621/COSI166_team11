class User < ApplicationRecord
    geocoded_by :full_address
    before_validation :set_coords_to_nil, :if => :address_changed?

    def set_coords_to_nil
        self.latitude = nil
        self.longitude = nil
    end

    before_validation :geocode
    has_secure_password
    has_many :transactions
    has_many :requests
    has_many :notifications, as: :recipient
    # Validates for a legal user signup format
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # VALID_PHONE_NUMBER = /\d[0-9]\)*\z/
    VALID_PHONE_NUMBER = /\A(?:\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}|\+\d{2}[ ]\d{10})\z/
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    
    validates :phone_number , presence: true, length: { maximum: 20 }, format: { with: VALID_PHONE_NUMBER }
    
    validates :address, presence: true
    validates :zip_code, presence: true
    validate :found_address_presence

    def found_address_presence
        if latitude.blank? || longitude.blank?
            errors.add(:address, " wasn't found.")
        end
    end

    def full_address
        [address, city, state, zip_code, 'USA'].compact.join(', ')
    end

    def address_changed?
        #full_address != self.address
        true
    end

end

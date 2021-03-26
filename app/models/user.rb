class User < ApplicationRecord
    has_secure_password
    
    # Validates for a legal user signup format

end

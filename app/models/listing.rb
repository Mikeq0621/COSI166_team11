class Listing < ApplicationRecord
    belongs_to :host
    has_many :transactions,dependent: :destroy
    has_many :requests,dependent: :destroy
end

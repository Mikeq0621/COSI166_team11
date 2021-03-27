class Transaction < ApplicationRecord
    belongs_to :host
    belongs_to :user
    belongs_to :listing
end

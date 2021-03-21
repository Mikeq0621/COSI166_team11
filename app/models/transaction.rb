class Transaction < ApplicationRecord
    belongs_to :host
    belongs_to :user
end

class Request < ApplicationRecord
  belongs_to :host
  belongs_to :listing
  belongs_to :user
end

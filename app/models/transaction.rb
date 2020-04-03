class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :finalized_request
end

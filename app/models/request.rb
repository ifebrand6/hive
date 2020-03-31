class Request < ApplicationRecord
  belongs_to :user
  has_many :talent_requests, dependent: :delete_all
end

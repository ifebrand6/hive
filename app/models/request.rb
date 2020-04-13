class Request < ApplicationRecord
  belongs_to :user
  has_many :talent_requests, inverse_of: :request
  accepts_nested_attributes_for :talent_requests, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :phone_number
end

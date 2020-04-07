class Request < ApplicationRecord
  belongs_to :user
  has_one :talent_request, inverse_of: :request
  accepts_nested_attributes_for :talent_request
  validates_presence_of :phoneNumber
end

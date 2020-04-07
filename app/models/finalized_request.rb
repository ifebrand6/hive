class FinalizedRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many  :talent_assignments, inverse_of: :finalized_request
  accepts_nested_attributes_for :talent_assignments
  
end

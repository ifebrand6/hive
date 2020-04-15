class FinalizedRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one  :talent_assignment
  accepts_nested_attributes_for :talent_assignment
  
end

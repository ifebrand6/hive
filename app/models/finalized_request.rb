class FinalizedRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many  :talent_assignments, inverse_of: :finalized_request
  # accepts_nested_attributes_for :talent_assignments
  accepts_nested_attributes_for :talent_assignments, reject_if: :reject_talent_assignment,  allow_destroy: true
  # validates_presence_of :talent_assignments

  def reject_talent_assignment
    attributes['finalized_request_id'].blank?
  end
  
end

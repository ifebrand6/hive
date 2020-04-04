class FinalizedRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :talent_assignment

  accepts_nested_attributes_for :talent_assignment, reject_if: :reject_talent_assignment,  allow_destroy: true

  def reject_talent_assignment
    attributes['start_date'].blank?
  end
  
end

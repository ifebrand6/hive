class TalentAssignment < ApplicationRecord
  #validates :finalized_request, presence: true
  belongs_to :finalized_request,inverse_of: :talent_assignments
  belongs_to :expert_application

end

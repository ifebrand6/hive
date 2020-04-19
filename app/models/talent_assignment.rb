class TalentAssignment < ApplicationRecord
  belongs_to :finalized_request,inverse_of: :talent_assignments
  belongs_to :expert

end

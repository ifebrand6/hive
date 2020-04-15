class TalentAssignment < ApplicationRecord
  belongs_to :finalized_request
  belongs_to :expert_application

end

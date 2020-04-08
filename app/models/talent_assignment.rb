# == Schema Information
#
# Table name: talent_assignments
#
#  id                    :bigint           not null, primary key
#  engaged_date          :date
#  start_date            :date
#  end_date              :date
#  finalized_request_id  :bigint
#  expert_application_id :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class TalentAssignment < ApplicationRecord
  validates :finalized_request, presence: true
  belongs_to :finalized_request,inverse_of: :talent_assignments
  belongs_to :expert_application

end

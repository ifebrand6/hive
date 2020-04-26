# == Schema Information
#
# Table name: finalized_requests
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  request_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FinalizedRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one  :talent_assignment
  accepts_nested_attributes_for :talent_assignment
  after_create :notifier

  private
    
  def notifier
    # SendFinalRequestMailJob.perform_later(id)
    SendMailToExpertForAnAssignedTalentJob.perform_later(id)
  end

end

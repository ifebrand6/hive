class SendMailToExpertForAnAssignedTalentJob < ApplicationJob
  queue_as :default

  def perform(finalized_request_id)
    @finalized_request = FinalizedRequest.find(finalized_request_id)
    NotifierMailer.with(finalized_request: @finalized_request).send_mail_to_expert_for_an_assigned_talent.deliver_now
  end
end

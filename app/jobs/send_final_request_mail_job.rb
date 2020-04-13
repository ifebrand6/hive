class SendFinalRequestMailJob < ApplicationJob
  queue_as :default

  def perform(finalized_request_id)
    @finalized_request = FinalizedRequest.find(finalized_request_id)
    NotifierMailer.with(finalized_request: @finalized_request).send_final_request_mail.deliver_now
  end
end

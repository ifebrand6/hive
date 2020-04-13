class SendAdmittedMsgForTalentRequestJob < ApplicationJob
  queue_as :default

  def perform(request_id)
    @request = Request.find(request_id)
    NotifierMailer.with(request: @request).send_admitted_msg_for_talent_request.deliver_now
  end
end

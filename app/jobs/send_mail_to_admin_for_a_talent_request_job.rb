class SendMailToAdminForATalentRequestJob < ApplicationJob
  queue_as :default

  def perform(request_id)
    @request = Request.find(request_id)
    NotifierMailer.with(request: @request).send_mail_to_admin_for_a_talent_request.deliver_now
  end
end

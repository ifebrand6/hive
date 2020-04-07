class SendAcceptedExpertMailJob < ApplicationJob
  queue_as :default

  def perform(expert_application_id)
    @expert = ExpertApplication.find(expert_application_id)
    NotifierMailer.with(expert: @expert).send_accepted_expert_mail.deliver_now
  end
end

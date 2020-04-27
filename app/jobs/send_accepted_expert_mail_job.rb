class SendAcceptedExpertMailJob < ApplicationJob
  queue_as :default

  def perform(expert_id)
    @expert = Expert.find(expert_id)
    NotifierMailer.with(expert: @expert).send_accepted_expert_mail.deliver_now
  end
end

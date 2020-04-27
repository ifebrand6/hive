class SendAcknowledgeMailToNewExpertJob < ApplicationJob
  queue_as :default

  def perform(expert_id)
    @expert = Expert.find(expert_id)
    NotifierMailer.with(expert: @expert).send_acknowledge_mail_to_new_expert.deliver_now
  end
end

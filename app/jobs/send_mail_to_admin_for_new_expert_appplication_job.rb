class SendMailToAdminForNewExpertAppplicationJob < ApplicationJob
  queue_as :default

  def perform(expert_id)
    @expert = Expert.find(expert_id)
    NotifierMailer.with(expert: @expert).send_mail_to_admin_for_new_expert_appplication.deliver_now
  end
end

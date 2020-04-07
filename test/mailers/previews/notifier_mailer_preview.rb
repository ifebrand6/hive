# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/send_accepted_expert_mail
  def send_accepted_expert_mail
    NotifierMailer.send_accepted_expert_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/send_mail_for_a_talent_request
  def send_mail_for_a_talent_request
    NotifierMailer.send_mail_for_a_talent_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/send_final_request_mail
  def send_final_request_mail
    NotifierMailer.send_final_request_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier_mailer/send_mail_for_a_completed_transcation
  def send_mail_for_a_completed_transcation
    NotifierMailer.send_mail_for_a_completed_transcation
  end

end

class NotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_accepted_expert_mail.subject
  #
  def send_accepted_expert_mail
    @expert = params[:expert]
    mail(to: @expert.email, subject: 'Your application has been approved' )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_mail_for_a_talent_request.subject
  #
  def send_mail_for_a_talent_request
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_final_request_mail.subject
  #
  def send_final_request_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_mail_for_a_completed_transcation.subject
  #
  def send_mail_for_a_completed_transcation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
